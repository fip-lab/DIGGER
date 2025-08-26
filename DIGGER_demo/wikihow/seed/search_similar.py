import json
import os
import pickle
import re

import numpy as np
import torch
from cuml.metrics.pairwise_kernels import cosine_similarity
from sentence_transformers import SentenceTransformer
from tqdm import tqdm

device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERT
model = SentenceTransformer('../all-MiniLM-L6-v2')
with open('entity_embeddings.pkl', 'rb') as f:
    loaded_embeddings = pickle.load(f)
def find_most_similar(entity_name, entity_embeddings, top_n=1):
    if entity_name not in entity_embeddings:
        print(f"Entity '{entity_name}' not found in embeddings. Generating embedding...")
        target_embedding = model.encode([entity_name])[0].reshape(1, -1)  # 
    else:
        target_embedding = entity_embeddings[entity_name].reshape(1, -1)  # 1xD
    # 
    all_entities = list(entity_embeddings.keys())
    all_embeddings = np.array([entity_embeddings[entity] for entity in all_entities])  # NxD

    # 
    similarities = cosine_similarity(target_embedding, all_embeddings)[0]  # ，N

    #  (entity, similarity) 
    similarities = list(zip(all_entities, similarities))

    # 
    #similarities = [item for item in similarities if item[0] != entity_name]

    # 
    most_similar = sorted(similarities, key=lambda item: item[1], reverse=True)[:top_n]
    for entity, similarity in most_similar:
        return entity

def clean_entity(entity):
    # ，
    entity_no_numbers = re.sub(r'\d+', '', entity)  # 
    entity_no_underscores = entity_no_numbers.replace('_', ' ')  # ，
    entity_cleaned = entity_no_underscores.strip()  # 
    return entity_cleaned

def extract_and_clean_entities(steps_predictions):
    all_entities = set()  # 
    for prediction in steps_predictions:
        # ，
        parts = prediction.split(' ')
        # 
        entities = parts[1:]  # 
        cleaned_entities = [clean_entity(entity) for entity in entities]
        all_entities.update(cleaned_entities)  # ，
    return list(all_entities)  # 

def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list
def list_subfolders(folder_path):
    subfolders = []
    # 
    for item in os.listdir(folder_path):
        item_path = os.path.join(folder_path, item)
        # 
        if os.path.isdir(item_path):
            subfolders.append(item_path)
    return subfolders

cluster_data_list=list_subfolders("../generate_step_and_goal/generent_goal")
for cluster_data in cluster_data_list:
    print(cluster_data)
    cluster_data_name = cluster_data.split("/")[-1]
    file_path=file_path_list(cluster_data)
    for file in file_path:
        filename = os.path.basename(file)
        with open(file, 'r', encoding="utf-8") as file:
            AVW_dict_list = json.load(file)

        # 
        results = []

        #  AVW_dict
        for AVW_dict in tqdm(AVW_dict_list, desc=""):
            temp_dic = AVW_dict
            steps_predictions = AVW_dict["steps_predictions"]
            entities_list = extract_and_clean_entities(steps_predictions)

            #  steps_prediction 
            prediction_similarities = {}

            for entities in entities_list:
                most_similar = find_most_similar(entities, loaded_embeddings)
                prediction_similarities[entities] = most_similar  # 

            temp_dic["similar_entity"] = prediction_similarities  # 
            results.append(temp_dic)  # 
            print(results)
        directory = f"../entity_data/comet_data_similar_entity/{cluster_data_name}"
        # ，
        if not os.path.exists(directory):
            os.makedirs(directory)
        #  JSON 
        new_file_path = f"{directory}/{filename}"
        with open(new_file_path, 'w', encoding='utf-8') as f:
            json.dump(results, f, ensure_ascii=False, indent=4)

        print(f"Results saved to {new_file_path}")
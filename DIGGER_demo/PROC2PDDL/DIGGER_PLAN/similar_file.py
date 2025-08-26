import json
import os
import pickle
import re

import torch
import numpy as np
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
from tqdm import tqdm

# CUDA
device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERTGPU
model = SentenceTransformer('../../all-MiniLM-L6-v2').to(device)

def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content

#
def get_file_paths(folder_path):
    file_paths = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
                file_path = os.path.join(root, file)
                file_paths.append(file_path)
    return file_paths

def list_subfolders(folder_path):
    subfolders = []
    #
    for item in os.listdir(folder_path):
        item_path = os.path.join(folder_path, item)
        #
        if os.path.isdir(item_path):
            subfolders.append(item_path)
    return subfolders


def find_most_similar(entity_name, entity_embeddings, top_n=1):
    if entity_name not in entity_embeddings:
        #print(f"Entity '{entity_name}' not found in embeddings. Generating embedding...")
        # ， GPU
        target_embedding = model.encode([entity_name], convert_to_tensor=True, device=device).cpu().numpy()  # Shape: (1, D)
    else:
        target_embedding = entity_embeddings[entity_name].reshape(1, -1)  # Shape: (1, D)

    # Get all entities and their embeddings
    all_entities = list(entity_embeddings.keys())
    all_embeddings = np.array([entity_embeddings[entity] for entity in all_entities])  # Shape: (N, D)

    # Compute cosine similarities
    similarities = cosine_similarity(target_embedding, all_embeddings)[0]  # Shape: (N,)

    # Pair entities with their similarity scores
    similarities = list(zip(all_entities, similarities))

    similarities = [item for item in similarities if entity_name not in item[0]]
    # Sort entities by similarity score in descending order
    most_similar = sorted(similarities, key=lambda item: item[1], reverse=True)[:top_n]
    # Extract entity names
    return most_similar
def clean_task(task):
    cleaned_text = re.sub(r'[^A-Za-z]', ' ', task)
    #
    cleaned_text = re.sub(r'\s+', ' ', cleaned_text).strip()
    return cleaned_text
cluster_data_list = []
cluster_data_no_tag = []
#domain_task_data=read_json("../predict_domain/domain_predict.json")
domain_task_data=read_json("../data/test.json")
similar_task_list = []
for class_name in domain_task_data:
        #
        train_data_list=read_json(f"../entity/comet_data_similar_entity_end/data_train.json")
        embeddings_file="Instantiating_no_entity/Instantiating/task_embedding/data_train/data_train.pkl"
        with open(embeddings_file, 'rb') as f:
            loaded_embeddings = pickle.load(f)
            # Example: Find top 3 entities most similar to 'How to Clean Tail Lights'
            similar_task = {}
            entity_to_search = class_name['task']
            entity_to_searchs = clean_task(entity_to_search)
            top_n = 1
            try:
                similarity = find_most_similar(entity_to_searchs, loaded_embeddings, top_n=top_n)
                print(f"Top {top_n} entities most similar to '{entity_to_search}':")
            except ValueError as e:
                print(e)
            similar_task[entity_to_search] = []
            for keys in similarity:
                key = keys[0]
                file = {}
                task_list = key.split("[SEN]")
                file["task"] = task_list[0]
                file["step"] = task_list[1:]
                for train_data in train_data_list:
                    if file["task"]==train_data["task"] and file["step"]==train_data["step"]:
                        domain_file=train_data["domain_file"].split("/")[-1]
                        train_data["domain_file"]=domain_file
                        similar_task[entity_to_search].append(train_data)
            similar_task_list.append(similar_task)
print(len(similar_task_list))
with open(f"similar_task.json", 'w', encoding='utf-8') as f:
        json.dump(similar_task_list, f, ensure_ascii=False, indent=4)
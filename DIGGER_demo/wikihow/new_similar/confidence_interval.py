import json
import os
import pickle
import scipy.stats as stats
import torch
import numpy as np
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

# CUDA
device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERTGPU
model = SentenceTransformer('../all-MiniLM-L6-v2').to(device)

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
def get_path(file_path):
    path_list=[]
    for file in file_path:
        file_name=file.split("/")[-1].replace("_train.json", "")
        path_list.append(file_name)
    return path_list

def find_most_similar(entity_name, entity_embeddings, top_n=1):
    target_embedding = model.encode([entity_name], convert_to_tensor=True, device=device).cpu().numpy()
    all_entities = list(entity_embeddings.keys())
    all_embeddings = np.array([entity_embeddings[entity] for entity in all_entities])
    similarities = cosine_similarity(target_embedding, all_embeddings)[0]
    similarities = list(zip(all_entities, similarities))
    # similarities = [item for item in similarities if entity_name not in item[0]]
    most_similar = sorted(similarities, key=lambda item: item[1], reverse=True)[:top_n]
    return most_similar, [score[1] for score in most_similar]


def confidence_calculate(score_list):
    mean = np.mean(score_list)
    std_dev = np.std(score_list, ddof=1)  # ddof=1

    # Step 2: 
    standard_error = std_dev / np.sqrt(len(score_list))

    # Step 3: z95%
    z_score = stats.norm.ppf(0.975)  # 95%95%
    margin_of_error = z_score * standard_error

    # Step 4: 
    confidence_interval = (mean - margin_of_error, mean + margin_of_error)

    # 
    print(f"Mean: {mean}")
    print(f"Standard Deviation: {std_dev}")
    print(f"95% Confidence Interval: {confidence_interval}")
cluster_data_list = []
data_list = read_json("../test_data.json")
score_list=[]
for data in data_list:
    # 
    similar_task_list = []
    path_list=get_file_paths("task_embedding")
    scores =-1
    embedding = ""
    for path in path_list:
        with open(path, 'rb') as f:
            loaded_embeddings = pickle.load(f)

            similar_task = {}

            entity_to_search = data['task']
            top_n = 1
            try:
                similarity,score = find_most_similar(entity_to_search, loaded_embeddings, top_n=top_n)

                if score[0] > scores:
                    scores=score
                    embedding=path


            except ValueError as e:
                print(e)
    print(f"Top {top_n} entities most similar to '{entity_to_search}':")
    embedding=os.path.basename(embedding).replace(".pkl","")
    cluster_label=""
    train_data=read_json("../train_data.json")
    for train in train_data:
        if embedding==train["task"]:
            cluster_label=train["cluster_label"]
    print("----------", scores, embedding, entity_to_search)
    score_list.append(scores)
confidence_calculate(score_list)

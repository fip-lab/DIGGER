import json
import os
import pickle
import re

import torch
import numpy as np
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
from tqdm import tqdm

#   CUDA    
device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

#   Sentence-BERT   GPU 
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
cluster_data_list = []
data_list = read_json("../test_data.json")
for data in data_list:
    #     
    similar_task_list = []
    path_list=get_file_paths("task_embedding")
    scores =-1
    embedding = ""
    for path in path_list:
        with open(path, 'rb') as f:
            loaded_embeddings = pickle.load(f)
            # Example: Find top 3 entities most similar to 'How to Clean Tail Lights'
            similar_task = {}
            #similar_task["score"]=[]
            #similar_task["domain_file_path"]=[]
            entity_to_search = data['task']
            top_n = 1
            try:
                similarity,score = find_most_similar(entity_to_search, loaded_embeddings, top_n=top_n)
                #print(score,path)
                if score[0] > scores:
                    scores=score
                    embedding=path
                #similar_task["score"].append(score)
                #similar_task["domain_file_path"].append(embeddings_file_name)
                #similar_task_list.append(similar_task)

                #print(f"Top {top_n} entities most similar to '{entity_to_search}':")

            except ValueError as e:
                print(e)
    #print(f"       {scores}")
    if scores[0] > 0.4600879475454237:
        data["Type"]="seen"
    else:
        data["Type"]="unseen"
    print(f"Top {top_n} entities most similar to '{entity_to_search}':")
    embedding=os.path.basename(embedding).replace(".pkl","")
    cluster_label=""
    train_data=read_json("../../train_data.json")
    for train in train_data:
        if embedding==train["task"]:
            cluster_label=train["cluster_label"]
    # embedding_name=embedding.split("/")[-1].replace("_train.pkl","")
    # domain_list=read_json(f"../Instanting_entity_no_concept/action_check/concept_data/{cluster_label}/{cluster_label}_train.json")
    # data["domain"]=domain_list
    data["similar_task_path"]=f"../../entity_data/similar_entity_data/cluster_{cluster_label}_train.json/cluster_{cluster_label}_train.json"
    cluster_data_list.append(data)
    print("----------",scores,embedding,entity_to_search)
with open(f"action_no_concept_predict.json", 'w', encoding='utf-8') as f:
    json.dump(cluster_data_list, f, ensure_ascii=False, indent=4)
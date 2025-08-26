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
model = SentenceTransformer('../../../../all-MiniLM-L6-v2').to(device)

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


def find_most_similar(entity_name, entity_embeddings, top_n=3):
    target_embedding = model.encode([entity_name], convert_to_tensor=True, device=device).cpu().numpy()
    all_entities = list(entity_embeddings.keys())
    all_embeddings = np.array([entity_embeddings[entity] for entity in all_entities])
    similarities = cosine_similarity(target_embedding, all_embeddings)[0]
    similarities = list(zip(all_entities, similarities))
    # similarities = [item for item in similarities if entity_name not in item[0]]
    most_similar = sorted(similarities, key=lambda item: item[1], reverse=True)[:top_n]
    return most_similar, [score[1] for score in most_similar]
cluster_data_list = []
cluster_data_no_tag = []
domain_task_data=read_json("../../similar_task.json")
similar_task_list = []
embeddings_file = f"task_embedding/train/train.pkl"
save_path_name=os.path.basename(embeddings_file).replace(".pkl", "")
train_data_list = read_json(f"../../../entity/comet_data_similar_entity_end/train.json")
for class_name in domain_task_data:
        #
        # read_json("../../entity_data/similar_entity_data/cluster_10_train.json/cluster_10_train.json")
        # train_data_list=read_json(f"../{embeddings_file}")
        with open(embeddings_file, 'rb') as f:
            loaded_embeddings = pickle.load(f)
            # Example: Find top 3 entities most similar to 'How to Clean Tail Lights'
            similar_task = {}
            for key,v in class_name.items():
                entity_to_search = key
            top_n = 1
            try:
                similarity,score = find_most_similar(entity_to_search, loaded_embeddings, top_n=top_n)
                print(f"Top {top_n} entities most similar to '{entity_to_search}':")
            except ValueError as e:
                print(e)
            similar_task[entity_to_search] = []
            if score[0] > 0.4600879475454237:
                similar_task["Type"] = "seen"
                print(score, "seen")
            else:
                similar_task["Type"] = "unseen"
                print(score, "unseen")
            for keys in similarity:
                key = keys[0]
                file = {}
                task_list = key.split("[SEN]")
                file["task"] = task_list[0]
                file["step"] = task_list[1:]
                for train_data in train_data_list:
                    if file["task"]==train_data["task"] and file["step"]==train_data["step"]:
                        similar_task[entity_to_search].append(train_data)
            similar_task_list.append(similar_task)
save_path=f"similar_task/{save_path_name}/"
if not os.path.exists(save_path):
        os.makedirs(save_path)
with open(f"{save_path}/test.json", 'w', encoding='utf-8') as f:
    json.dump(similar_task_list, f, ensure_ascii=False, indent=4)
print(len(similar_task_list))

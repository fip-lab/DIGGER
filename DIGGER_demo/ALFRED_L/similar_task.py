import json
import os
import pickle
import re

import torch
import numpy as np
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.neighbors import NearestNeighbors
import pandas as pd
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
from tqdm import tqdm

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
def clean_task(task):
    cleaned_text = re.sub(r'[^A-Za-z]', ' ', task)
    # 
    cleaned_text = re.sub(r'\s+', ' ', cleaned_text).strip()
    return cleaned_text
# Initialize lists
cluster_data_list = []
cluster_data_no_tag = []
file_name = "data/train.json".split("/")[-1].replace(".json", "")
print(file_name)
datalist = read_json("data/train.json")
len(datalist)
cluster_data_list = []
cluster_data_no_tag = []
for data in tqdm(datalist,desc=""):
    # Ensure that "task" and "step" exist in data
    task = data.get("task", "")
    steps = data.get("desc", [])
    if not isinstance(steps, list):
        steps = [steps]
    # Append with tags
    tagged_entry = task + "[SEN]" + "[SEN]".join(steps)
    task=clean_task(task)
    cluster_data_list.append(tagged_entry)
    # Append without tags
    no_tag_entry = task + " ".join(steps)
    cluster_data_no_tag.append(no_tag_entry)
    #  GPU 
    # convert_to_tensor=True  PyTorch ， GPU
embeddings = model.encode(cluster_data_no_tag)

# Create a dictionary mapping tagged entries to their embeddings
entity_embeddings = dict(zip(cluster_data_list, embeddings))
# Save embeddings
save_path = f'task_embedding/{file_name}.pkl'
os.makedirs(os.path.dirname(save_path), exist_ok=True)
with open(save_path, 'wb') as f:
    pickle.dump(entity_embeddings, f)
print(f"Embeddings saved to '{save_path}'.")
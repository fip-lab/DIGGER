import json
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


# CUDA
device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERT
model = SentenceTransformer('all-MiniLM-L6-v2')

# JSONclusters_key_dic
clusters_key_dic = {}
with open('wikihow_step_goal/dev-data-reformatted-v4.json', 'r', encoding="utf-8") as file:
    data_dict = json.load(file)

for i in range(1, 55):
    cluster_data = data_dict.get(f"{i}", {}).get("clusters", {})
    for key in cluster_data.keys():
        for entity in cluster_data[key]["entity_cluster"]:
            print(entity)
            if entity in clusters_key_dic:
                clusters_key_dic[entity].append({key:[i]})
            else:
                clusters_key_dic[entity]= [{key:[i]}]
        print(clusters_key_dic)
print(clusters_key_dic)
with open("entity_name.json","w",encoding="utf-8") as file:
    json.dump(clusters_key_dic,file,indent=4)
# 
entities = list(clusters_key_dic.keys())

# 
embeddings = model.encode(entities, device=device)
entity_embeddings = dict(zip(entities, embeddings))

# 
with open('entity_embeddings.pkl', 'wb') as f:
    pickle.dump(entity_embeddings, f)
"""with open('entity_embeddings.pkl', 'rb') as f:
    loaded_embeddings = pickle.load(f)"""
# ：（）
def visualize_embeddings(entity_embeddings):
    # PCA2D
    pca = PCA(n_components=2)
    embeddings_matrix = np.array(list(entity_embeddings.values()))
    principal_components = pca.fit_transform(embeddings_matrix)
    pc_df = pd.DataFrame(data=principal_components, columns=['pc1', 'pc2'])
    pc_df['entity'] = list(entity_embeddings.keys())

    plt.figure(figsize=(12, 8))
    plt.scatter(pc_df['pc1'], pc_df['pc2'], alpha=0.6)

    for i, row in pc_df.iterrows():
        plt.annotate(row['entity'], (row['pc1'], row['pc2']), fontsize=8, alpha=0.7)

    plt.title('Entity Embeddings Visualized with PCA')
    plt.xlabel('Principal Component 1')
    plt.ylabel('Principal Component 2')
    plt.show()


# （）
#visualize_embeddings(loaded_embeddings)


def find_most_similar(entity_name, entity_embeddings, top_n=1):
    if entity_name not in entity_embeddings:
        raise ValueError(f"Entity '{entity_name}' not found in embeddings.")

    # 
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

    return most_similar

# ： 'eraser' 5
#  'eraser'  entity_embeddings 
entity_to_search = 'eraser'
try:
    most_similar_to_eraser = find_most_similar(entity_to_search, entity_embeddings, top_n=1)
    print(f"Top 5 entities most similar to '{entity_to_search}':", most_similar_to_eraser)
except ValueError as e:
    print(e)

# ：
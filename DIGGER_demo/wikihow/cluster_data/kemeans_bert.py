import json
import os
import numpy as np
from cuml.cluster import KMeans
from cuml.metrics.cluster import silhouette_score
from sentence_transformers import SentenceTransformer
from sklearn.decomposition import PCA
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import pairwise_distances
import cudf
from tqdm import tqdm
import torch
import matplotlib.pyplot as plt

# 
def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list


# 
def load_data(file_path):
    documents = []
    original_data = []
    with open(file_path, 'r') as file:
        data_list = json.load(file)
    print(len(data_list))
    for datas in tqdm(data_list, desc="Loading Data"):
        if datas != None:
            task = datas["title"]
            steps = datas.get("steps", [])
            # ，
            full_text = task + ": " + " ".join(steps)
            # 
            clean_text = full_text.lower()
            # 
            documents.append(clean_text)
            # 
            original_data.append(datas)
    return documents, original_data

#  GPU
print(torch.cuda.is_available())

#  Sentence-BERT 
device = 'cuda' if torch.cuda.is_available() else 'cpu'
model = SentenceTransformer('../all-MiniLM-L6-v2', device=device)

file_path = "select/wikihow/all_data_3.json"
documents, original_data = load_data(file_path)
embeddings = model.encode(documents)
np.save('embeddings_lower.npy', embeddings)

# 
scaler = MinMaxScaler()
embeddings_scaled = scaler.fit_transform(embeddings)

# PCA，95%
pca = PCA(n_components=0.95)  # ， n_components=50
embeddings_pca = pca.fit_transform(embeddings_scaled)

# 
#cluster_numbers = range(400,450)# 
cluster_numbers=[2800]
sil_scores = []

# 
for n_clusters in tqdm(cluster_numbers, desc="Evaluating Clusters"):
    kmeans = KMeans(n_clusters=n_clusters, random_state=0)
    cluster_labels = kmeans.fit_predict(embeddings_pca)

    #  GPU 
    data_gpu = cudf.DataFrame.from_records(embeddings_pca)
    cluster_labels_gpu = cudf.Series(cluster_labels)

    # 
    silhouette_avg = silhouette_score(data_gpu, cluster_labels_gpu, metric='euclidean')
    sil_scores.append(silhouette_avg)
    print(f"Number of clusters: {n_clusters}, Silhouette Score: {silhouette_avg}")

# 
best_n_clusters = cluster_numbers[np.argmax(sil_scores)]
print(f": {best_n_clusters}，: {max(sil_scores)}")

# 
kmeans = KMeans(n_clusters=best_n_clusters, random_state=0)
cluster_labels = kmeans.fit_predict(embeddings_pca)

# （）
cluster_centers = kmeans.cluster_centers_

# 
distances_to_centers = pairwise_distances(embeddings_pca, cluster_centers)
class_density = []
for i in range(best_n_clusters):
    class_points = distances_to_centers[cluster_labels == i]
    if len(class_points) > 0:
        class_density.append(np.mean(class_points))  # 
    else:
        class_density.append(float('inf'))  # 

# （）
inter_class_distances = pairwise_distances(cluster_centers)

#  100 （）
top_100_classes = np.argsort(class_density)[:100]
print(np.argsort(class_density))
#=np.argsort(class_density)
# 
high_density_results = []
count=0
for class_idx in np.argsort(class_density):
    count_list=[]
    if count<100:
        #  class_idx 
        class_tasks = [original for original, label in zip(original_data, cluster_labels) if label == class_idx]
        # 
        if len(class_tasks) >= 10 and len(class_tasks) <= 20:
            density = class_density[class_idx]
            print(class_idx, density)
            # ，
            for task in class_tasks:
                task['cluster_label'] = int(class_idx)  # 
                count_list.append(task)
            with open(f"cluster_wikihow/cluster_{int(class_idx)}.json", 'w', encoding='utf-8') as f:
                json.dump(count_list, f, indent=4)
            count=count+1
    else:
        break
#  JSON 
high_density_result_file = 'high_density_clusters.json'

print(f" '{high_density_result_file}' 。")
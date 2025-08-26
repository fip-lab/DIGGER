import json
import os

from tqdm import tqdm


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
def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
rag_data_list=[]
all_data_data=read_json("../../rag_all_data.json")
alfred_l=read_json("rag_all_data.json")
temp_list=[]
for domain in alfred_l:
    for train in all_data_data:
        if domain["task"] == train["task"]:
            temp_list.append(train)
for te in temp_list:
    if te in all_data_data:
        all_data_data.remove(te)
with open("rag_example/rag_example_data.json",'w',encoding="utf-8")as file:
    json.dump(all_data_data,file,indent=4)
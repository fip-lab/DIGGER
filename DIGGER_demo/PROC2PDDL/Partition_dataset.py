import json
import os
import random


def split_data(data):
    # 
    random.shuffle(data)

    # 
    total_len = len(data)
    train_size = int(0.8 * total_len)  # 80%
    val_size = int(0.1 * total_len)  # 10%
    #test_size = total_len - train_size - val_size  #  10%

    # 
    train_data = data[:train_size]
    val_data = data[train_size:train_size + val_size]
    test_data = data[train_size + val_size:]

    # 
    train_path = f"data/"
    val_path = f"data/"
    test_path = f"data/"

    if not os.path.exists(train_path):
        os.makedirs(train_path)
    if not os.path.exists(val_path):
        os.makedirs(val_path)
    if not os.path.exists(test_path):
        os.makedirs(test_path)

    # 
    with open(f"{train_path}/train.json", 'w', encoding='utf-8') as f:
        json.dump(train_data, f, ensure_ascii=False, indent=4)

    with open(f"{val_path}/val.json", 'w', encoding='utf-8') as f:
        json.dump(val_data, f, ensure_ascii=False, indent=4)

    with open(f"{test_path}/test.json", 'w', encoding='utf-8') as f:
        json.dump(test_data, f, ensure_ascii=False, indent=4)

    print("Data has been split and saved.")
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
#file_path_list=get_file_paths("pddl_data/rag_all_data.json")
file_path_file=read_json("pddl_data/rag_all_data.json")
split_data(file_path_file)
data_list_path=get_file_paths("data")
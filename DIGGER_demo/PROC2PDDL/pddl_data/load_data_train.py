import json
import os

from tqdm import tqdm


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
def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
def read_file(file_path, encoding="utf-8"):
    """"""
    with open(file_path, 'r', encoding=encoding) as file:
        return file.read()
train_data=read_json("../data/train.json")
domain_data_list=[]
domain_file_list=file_path_list("domain_test_data")
for domain_file in domain_file_list:
    domain_data=read_json(domain_file)
    for domain in domain_data:
        for train in tqdm(train_data):
            if train["task"] == domain["task"] and train["step"]==domain["step"]:
                train["domain_file"]=domain_file
                domain_data_list.append(train)
with open("data_train.json",'w',encoding="utf-8")as file:
    json.dump(domain_data_list,file,indent=4)
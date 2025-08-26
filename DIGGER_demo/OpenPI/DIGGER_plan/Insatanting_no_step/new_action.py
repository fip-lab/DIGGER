import json
import os
import re

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

def extract_pddl(text):
        #         PDDL
        action_pattern = re.compile(r'\(:action\s[\w_]+.*?\:effect\s\(.*?\)\s*\)', re.DOTALL)
        matches = re.findall(action_pattern, text)

        #
        print(matches)
        return matches

def read_json(file_path):
    with open(file_path,'r',encoding="utf-8")as file:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        data=json.load(file)
    return data

file_path=file_path_list("action_merge/concept_data")
for file in file_path:
    files_name = os.path.basename(file).replace("_train.json", "")
    data_list = read_json(file)
    new_data = []
    for data in data_list:
        new_data = new_data + extract_pddl(data)
    action_path = f"action_new/concept_data/{files_name}"
    if not os.path.exists(action_path):
        os.makedirs(action_path)
    with open(f"{action_path}/{os.path.basename(file)}", 'w', encoding="utf-8") as file:
        json.dump(new_data, file, indent=4)

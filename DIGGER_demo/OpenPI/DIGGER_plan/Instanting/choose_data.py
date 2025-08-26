import json
import os


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
    with open(file_path,'r',encoding="utf-8")as file:
        data=json.load(file)
    return data
action_list=file_path_list("../action_ger")
data_list=read_json(action_list[0])
code_dic={}
i=0
for data in data_list:
    task=data["task"]
    code_dic[task]=i
    action= data["action"]
    save_path=f"action_ger/{i}"

    if not os.path.exists(save_path):
        os.makedirs(save_path)
    with open(f"{save_path}/action_{i}.json",'w',encoding="utf-8")as file:
        json.dump(action,file,indent=4)
    i=i+1
with open(f"code_data.json",'w',encoding="utf-8")as file:
    json.dump(code_dic,file,indent=4)
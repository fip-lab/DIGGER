import json
import os

import pandas as pd


def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list


def list_subfolders(folder_path):
    subfolders = []
    for item in os.listdir(folder_path):
        item_path = os.path.join(folder_path, item)
        if os.path.isdir(item_path):
            subfolders.append(item_path)
    return subfolders
def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
def read_json_read(file_path):
    data_dic=read_json(file_path)
    for key,value in data_dic.items():
        data_dic[key]=round(data_dic[key], 3)
    return data_dic
weight_result_list=[]
get_file_path=file_path_list("DIGGER_plan")
for file_path in get_file_path:
    dict_temp={}
    file=os.path.basename(file_path).replace(".json","")
    data=read_json(file_path)
    weight_result_list.append({file: read_json_read(file_path)})

df = pd.DataFrame([plan[list(plan.keys())[0]] for plan in weight_result_list])

    # Set the index to be the plan names
df.index = [list(plan.keys())[0] for plan in weight_result_list]
df.to_csv('plan_metrics.csv')

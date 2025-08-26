import re

import json
import os
import torch
from openai import OpenAI
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

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


def count_actions_in_pddl(pddl_text):
    """
     PDDL 。

    :
    pddl_text (str):  PDDL 。

    :
    int: 。
    """
    #  `(:action` 
    actions = re.findall(r'\(:action', pddl_text)

    # 
    return len(actions)
data_list=get_file_paths("new_Instanting/action_check/concept_data")
action_data_list=[]
for data in data_list:
    domain_data=read_json(data)
    action_len=count_actions_in_pddl(domain_data[0])
    print(action_len,data)
    action_data_list.append(action_len)
i=0
for action_len in action_data_list:
    i=i+action_len
aver_action=i/len(action_data_list)
print("",i)
print("",aver_action)

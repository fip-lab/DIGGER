import itertools
import json
import os
import re

import spacy

nlp = spacy.load("en_core_web_sm")

from openai import OpenAI
from tqdm import tqdm
client = OpenAI()(api_key='sk-6d1247e5c995420fb25f021088d40523',
base_url="https://api.deepseek.com")


def gen_action(prompt):
    chat_completion = client.chat.completions.create(
            model="deepseek-chat",
            messages=[{"role": "user", "content": prompt}],
        )
    generated_text = chat_completion.choices[0].message.content
    return generated_text
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

def extract_objects_from_steps(steps):
    """          （  ）"""
    extracted_objects = set()
    for step in steps:
        doc = nlp(step)
        for token in doc:
            if token.pos_ in ["NOUN", "PROPN"]:  #      
                extracted_objects.add(token.lemma_.lower())  #    （    ）
    return list(extracted_objects)

def extract_action_parameters(action_text):
    """
       PDDL   ，        
          ，    {   :   }
    """
    param_pattern = re.search(r":parameters\s*\((.*?)\)", action_text, re.DOTALL)
    if not param_pattern:
        return {}

    param_string = param_pattern.group(1)
    parameters = re.findall(r"(\?\w+) - (\w+)", param_string)
    return parameters

def read_json(file_path):
    with open(file_path,'r',encoding="utf-8")as file:
        data=json.load(file)
    return data

def generate_pddl_prompt(parameters_dic,entity_list):
    prompt=f"""
    You are an expert in AI planning and PDDL (Planning Domain Definition Language).  
I will provide you with a list of objects extracted from a task description.  
Your task is to classify each object into one of the following PDDL categories: 
{parameters_dic}

### **Object List**
{', '.join(entity_list)}

### **Expected JSON Output Format**
Please return your response in valid JSON format, structured as follows:
"""
    return prompt

file_path_lists=file_path_list("../../plan_end/similar_task/cluster_10")
action_file_list=file_path_list("../action_check/concept_data/cluster_10")

action_list = read_json(action_file_list[0])


def extract_pddl(text):
    #         PDDL    
    action_pattern = re.compile(r'\(:action\s[\w_]+.*?\:effect\s\(.*?\)\s*\)', re.DOTALL)
    matches = re.findall(action_pattern, text)

    #          
    print(matches)
    return matches


def instantiate_pddl_actions(pddl_actions, param_mapping):
    instantiated_actions = []
    param_values = {}

    #         ，     ，          
    for key, value in param_mapping.items():
        if value not in param_values:
            param_values[value] = []
        param_values[value].append(key)

    #            
    param_keys = list(param_values.keys())
    param_combinations = list(itertools.product(*param_values.values()))

    for action in pddl_actions:
        for combination in param_combinations:
            instantiated_action = action
            for idx, key in enumerate(param_keys):
                instantiated_action = re.sub(rf'\b{re.escape(key)}\b', combination[idx], instantiated_action)
            instantiated_actions.append(instantiated_action)

    return instantiated_actions


action_list=extract_pddl(action_list[0])

data_list=[]


parameters_dic={}
parameters_list=[]
entity_list=[]
for file_path in file_path_lists:
    data_list=read_json(file_path)
for data in data_list:
    entity_list+=extract_objects_from_steps(data.keys())
    for simlar_task in data.values():
        for task in simlar_task:
            entiy_list = extract_objects_from_steps(task["step"])
            entity_list = entiy_list + entity_list
        #                ？               ？            ，  v3?
entity_list=list(set(entity_list))
for action in action_list:
    temp_list=extract_action_parameters(action)
    print(temp_list)
    parameters_list=parameters_list+temp_list
for params in parameters_list:
    parameters_dic[params[0]]=params[1]
print(parameters_dic)
prompt=generate_pddl_prompt(parameters_dic,entity_list)
print(prompt)
result=gen_action(prompt)
regex_pattern = r'"(\w+)":\s*"(\?\w+)"'
matches = re.findall(regex_pattern, result)
extracted_dict = {key: value for key, value in matches}
#extracted_dict={'acquisition': '?task', 'schedule': '?condition', 'family': '?group', 'return': '?task', 'deal': '?task', 'school': '?context', 'community': '?group', 'question': '?condition', 'discussion': '?task', 'book': '?item', 'friend': '?agent', 'club': '?group', 'reading': '?task', 'rule': '?condition', 'opinion': '?attribute', 'member': '?agent', 'forum': '?context', 'policy': '?condition', 'list': '?item', 'library': '?context', 'loan': '?task'}
print(extracted_dict)

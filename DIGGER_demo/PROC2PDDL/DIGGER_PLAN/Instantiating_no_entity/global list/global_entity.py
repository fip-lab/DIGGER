import itertools
import json
import os
import re
from itertools import product

import spacy

nlp = spacy.load("en_core_web_sm")

from openai import OpenAI
from tqdm import tqdm
client = OpenAI()()

def gen_action(prompt):
    chat_completion = client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.7
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
I'll give you a list of objects extracted from the task description.
Your task is to classify each object into one of the following PDDL categories:
{parameters_dic}

### ** List of objects
{', ' .  join (entity_list)}

### ** Desired JSON output format
Your reply must be returned in a valid JSON format, structured as follows:
"""
    prompt=prompt+"""{
"purchase": "?action",
"jar": "?container",
"socket": "?location",
"saucepan": "?container",
"candles": "?object",
"amount": "?state",
"stove": "?location",
"water": "?object"
    }

Please output the result strictly in the above format. Failure to comply will lead to incorrect PDDL domain specifications. Before you output, you must do a self-check to ensure that the output format is correct."""
    return prompt




def extract_pddl(text):
    #         PDDL    
    action_pattern = re.compile(r'\(:action\s[\w_]+.*?\:effect\s\(.*?\)\s*\)', re.DOTALL)
    matches = re.findall(action_pattern, text)

    #          
    # print(matches)
    return matches


def parse_pddl_action(action_text):
    """   PDDL   ，    、  、       """

    #       
    action_name_match = re.search(r"\(:action (\w+)", action_text)
    action_name = action_name_match.group(1) if action_name_match else "unknown_action"

    #     
    parameters_match = re.search(r":parameters \((.*?)\)", action_text, re.DOTALL)
    parameters = []
    if parameters_match:
        param_text = parameters_match.group(1)
        param_pairs = re.findall(r"(\?\w+) - (\w+)", param_text)
        parameters = param_pairs

    #       （        ）
    precondition = extract_subexpression(action_text, ":precondition")

    #     （        ）
    effect = extract_subexpression(action_text, ":effect")

    return {
        "name": action_name,
        "parameters": parameters,
        "precondition": precondition,
        "effect": effect
    }


def extract_subexpression(text, keyword):
    """           ，      """
    pattern = re.compile(rf"{keyword} (.*)", re.DOTALL)  #    :precondition   :effect   
    match = pattern.search(text)

    if match and keyword==":precondition":
        #           
        content = match.group(1)
        return extract_nested(content)  #          
    if keyword==":effect":
        pattern = re.compile(rf"{keyword} (.*)", re.DOTALL)  #    :precondition   :effect   
        match = pattern.search(text)
        return match.group(1)
    return ""

def extract_nested(text):
    """            ，          """
    stack = []
    result = ""
    for char in text:
        if char == "(":
            stack.append(char)  #      ，  
        elif char == ")":
            if stack:
                stack.pop()  #      ，  
            else:
                continue  #      ，  
        if stack:
            result += char  #        ，     
        else:
            return result.strip()  #       
# **            **
def generate_pddl_instances(parsed_actions, object_pool):
    """         PDDL   """
    all_instances = []
    for action in parsed_actions:
        possible_values=[]
        param_names, param_types = zip(*action["parameters"])
        # **           **
        for ptype in param_names:
            temp_list=[]
            for obj, obj_type in object_pool.items():
                if obj_type == ptype:
                    temp_list.append(obj)
            if len(temp_list) == 0:
                temp_list.append(ptype.replace("?",""))
            possible_values.append(temp_list)

        # **            **
        for values in product(*possible_values):
            variable_mapping = dict(zip(param_names, values))

            # **    **
            instantiated_precondition = replace_variables(action["precondition"], variable_mapping)
            instantiated_effect = replace_variables(action["effect"], variable_mapping)

            # **       PDDL   **
            instance = f"(:action {action['name']}\n" \
                       f"  :parameters ({' '.join(values)})\n" \
                       f"  :precondition {instantiated_precondition}\n" \
                       f"  :effect {instantiated_effect}\n)"
            # print(instance)
            all_instances.append(instance)
    return all_instances


def simplify_pddl_action(action):
    #       
    action_name = re.search(r'\(:action (\w+)', action).group(1)

    #       
    params_match = re.search(r':parameters \((.*?)\)', action)
    if params_match:
        params = params_match.group(1)
        params_list = params.split()
        params_str = ' '.join(params_list)

    #         
    simplified_action = f"{action_name}({params_str})"
    return simplified_action
# **    **
def replace_variables(template, mapping):
    """  PDDL        """
    for var, value in mapping.items():
        template = template.replace(var, value)
    return template

# **           ，       **
def key_valuelist(data,result):
    #       
    for entity, type_ in data:
        if type_ not in result:
            result[type_] = []  #        ，      
        result[type_].append(entity)  #               
    return result

entity_and_type_list=[]
result_dic={}
file_path_lists=file_path_list("../Instantiating/similar_task")

for file_path in tqdm(file_path_lists,desc="test"):
    file = os.path.basename(file_path)
    file_name = os.path.basename(file_path)
    save_file_path = f"instantiating_action_4o_update/concept_data/{file_name}/"
    all_data_list=[]
    data_list=read_json(file_path)
    task_Type=""
    task_name=""
    for data in tqdm(data_list,desc="test"):
        for key,value in data.items():
            if key!="Type":
                action_list=value[0]["domain_file"]
                task_name=key
            else:
                task_Type=value
        action_list = extract_pddl(action_list[0])
        entity_list=[]
        parameters_dic={}
        parameters_list=[]
        entity_list += extract_objects_from_steps([task_name])
        for simlar_task in data[task_name]:
            entiy_list = extract_objects_from_steps(simlar_task["step"])
            entity_list = entiy_list + entity_list
            #                 ？               ？            ，  v3?
            #          ，         ？       
        entity_list = list(set(entity_list))
        for action in action_list:
            temp_list = extract_action_parameters(action)
            # print(temp_list)
            parameters_list = parameters_list + temp_list
            for params in parameters_list:
                parameters_dic[params[0]] = params[1]
        prompt = generate_pddl_prompt(parameters_dic, entity_list)
        result = gen_action(prompt)
        print(result,file_path)
        regex_pattern = r'"(\w+)":\s*"(\?\w+)"'
        matches = re.findall(regex_pattern, result)
        extracted_dict = {key: value for key, value in matches}
        entity_and_type_list.append({list(data.keys())[0]:extracted_dict})
        result_dic=key_valuelist(matches,result_dic)
print(result_dic)
print(entity_and_type_list)
with open("entity_and_type_list.json", 'w', encoding="utf-8") as file:
    json.dump(entity_and_type_list, file, indent=4)
with open("entity_and_type_dic.json", 'w', encoding="utf-8") as file:
    json.dump(result_dic, file, indent=4)
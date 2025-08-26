import itertools
import json
import os
import re
from itertools import product
from typing import Dict, Any

import spacy

nlp = spacy.load("en_core_web_sm")

from openai import OpenAI
from tqdm import tqdm
client = OpenAI()


def gen_action(prompt):
    chat_completion = client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": prompt}],
        # temperature=0.7
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
    prompt=prompt+"""
    {
        "purchase": "?action",
        "jar": "?container",
        "socket": "?location",
        "saucepan": "?container",
        "candles": "?object",
        "amount": "?state",
        "stove": "?location",
        "water": "?object"
    }
    Note:
    1.Please output the results strictly in accordance with the above format. Failure to follow the format will result in incorrect PDDL domain specifications.
    2. Type Matching Principle:
        -The type of each object must strictly match the provided PDDL category
        - Prohibit the creation of new types or the use of types not provided
        - If the object does not have an explicit type, it must be skipped without output
    """
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
def generate_prompt_entity(task_name,object_dict):
    prompt=f"""You are an expert in AI planning and PDDL (Planning Domain Definition Language).
I'll give you the names of similar objects in the domain and tasks to solve.
You need to determine how these objects relate to the task name
** Input format ** :
[Available object]:
{object_dict}
[Target task] :
"{task_name}"
** Processing Rules ** :
1. Three-level correlation judgment:
- Strong association: The following conditions must be met
a) The object name contains the task keyword
b) The object type matches core requirements of the task
- Medium association: One of the following conditions is met
Objects that may be used in solving tasks
2. Special Treatment:
- Compound word objects are divided into separate lexical judgments
** Output requirements:
- Strictly in order of correlation strength: Strong → medium
here is example:
[Available object]
['book', 'schedule', 'school', 'policy', 'opinion', 'reading', 'return', 'list', 'family', 'deal', 'loan', 'library', 'member', 'question', 'forum', 'friend', 'rule', 'acquisition', 'discussion', 'community', 'club']

[Target task] :
"How to Start a Book Club at School"

Output:
[Strong correlation] :  
book  
club  
school  

[Related in] :  
member  
community  
reading  
library  
list  
discussion  


Please strictly follow the preceding format to output the result. Do a good job of checking when you output, and do not output any objects that do not exist in [Available object], otherwise the PDDL field specification will be incorrect.
Output: 
[Strong correlation] :
[Related in] :
    """
    return prompt

def clean_entity_function(entity_choose):
    pattern = r"""
    \[(.*?)\]\s*:\s*  #        [.*] :
    ((?:\s*\w+\s*)+)  #            （  ）
    """

    #
    matches = re.findall(pattern, entity_choose, re.VERBOSE)

    #
    result_dict = {}
    for category, items in matches:
        #
        item_list = [item.strip() for item in items.split('\n') if item.strip()]
        result_dict[category] = item_list
    return result_dict
    print(result_dict)
def convert_to_original_format(classified: dict, mapping: dict) -> dict:
    result = {}
    for category, items in classified.items():
        temp={}
        for name in items:
            if name in mapping:
                temp[name]=mapping[name]
        result[category]=temp
    return result
def code_task(data_dic):
    code_list=read_json("../code_data.json")
    for data in data_dic.keys():
        if data!="Type":
            code=code_list[data_dic[data][0]["task"]]
            task_name=data
        else:
            task_Type = data_dic[task_name]
    return code,task_Type,task_name
def select_seen_entity(task_name):
    entity_list=read_json("../global list/entity_and_type_list.json")
    for entity_dict in entity_list:
        #
        if task_name in entity_dict:
            return entity_dict[task_name]
    return None  #     None

def generate_prompt_entity(task_name,object_dict):
    prompt=f"""You are an expert in AI planning and PDDL (Planning Domain Definition Language).
I'll give you the names of similar objects in the domain and tasks to solve.
You need to determine how these objects relate to the task name
** Input format ** :
[Available object]:
{object_dict}
[Target task] :
"{task_name}"
** Processing Rules ** :
1. Three-level correlation judgment:
- Strong association: The following conditions must be met
a) The object name contains the task keyword
b) The object type matches core requirements of the task
- Medium association: One of the following conditions is met
Objects that may be used in solving tasks
2. Special Treatment:
- Compound word objects are divided into separate lexical judgments
** Output requirements:
- Strictly in order of correlation strength: Strong → medium
here is example:
[Available object]
['book', 'schedule', 'school', 'policy', 'opinion', 'reading', 'return', 'list', 'family', 'deal', 'loan', 'library', 'member', 'question', 'forum', 'friend', 'rule', 'acquisition', 'discussion', 'community', 'club']

[Target task] :
"How to Start a Book Club at School"

Output:
[Strong correlation] :  
book  
club  
school  

[Related in] :  
member  
community  
reading  
library  
list  
discussion  


Please strictly follow the preceding format to output the result. Do a good job of checking when you output, and do not output any objects that do not exist in [Available object], otherwise the PDDL field specification will be incorrect.
Output: 
[Strong correlation] :
[Related in] :
    """
    return prompt

def clean_entity_function(entity_choose):
    pattern = r"""
    \[(.*?)\]\s*:\s*  #        [.*] :
    ((?:\s*\w+\s*)+)  #            （  ）
    """

    #
    matches = re.findall(pattern, entity_choose, re.VERBOSE)

    #
    result_dict = {}
    for category, items in matches:
        #
        item_list = [item.strip() for item in items.split('\n') if item.strip()]
        result_dict[category] = item_list
    return result_dict
    print(result_dict)
def convert_to_original_format(classified: dict, mapping: dict) -> dict:
    result = {}
    for category, items in classified.items():
        temp={}
        for name in items:
            if name in mapping:
                temp[name]=mapping[name]
        result[category]=temp
    return result


def find_entity_dic(data):
    task_Type = ""
    task_name = ""
    for key, value in data.items():
        if key != "Type":
            action_list = value[0]["domain_file"]
            task_name = key
        else:
            task_Type = value
    action_list = extract_pddl(action_list[0])
    entity_list = []
    parameters_dic = {}
    parameters_list = []
    entity_list += extract_objects_from_steps([task_name])
    for simlar_task in data[task_name]:
        entiy_list = extract_objects_from_steps(simlar_task["step"])
        entity_list = entiy_list + entity_list
        #                 ？               ？            ，  v3?
        #           ，         ？
    entity_list = list(set(entity_list))
    for action in action_list:
        temp_list = extract_action_parameters(action)
        # print(temp_list)
        parameters_list = parameters_list + temp_list
        for params in parameters_list:
            parameters_dic[params[0]] = params[1]
    prompt = generate_pddl_prompt(parameters_dic, entity_list)
    result = gen_action(prompt)
    print(result, file_path)
    regex_pattern = r'"(\w+)":\s*"(\?\w+)"'
    matches = re.findall(regex_pattern, result)
    extracted_dict = {key: value for key, value in matches}

    return extracted_dict
def select_unseen_entity(parameters_dic: Dict[str, Any]) -> Dict[str, Any]:
    """
                 parameters_dic

    Args:
        parameters_dic:     ，

    Returns:
            ，      entity_and_type_dic.json
    """
    new_entity_dic = {}
    entity_dic = read_json("../global list/entity_and_type_dic.json")
    entity_keys = set(entity_dic.keys())  #    set

    for key, value in parameters_dic.items():
        if key in entity_keys and entity_dic[key] is not None:
            for entity in entity_dic[key]:
                new_entity_dic[entity] = key
    return new_entity_dic
file_path_lists=file_path_list("similar_task")

for file_path in tqdm(file_path_lists,desc="test"):
    file = os.path.basename(file_path)
    file_name = os.path.basename(file_path)
    save_file_path = f"instantiating_action_4o_update/concept_data/{file_name}/"
    all_data_list=[]
    task_Type = ""
    task_name = ""
    data_list=read_json(file_path)
    for data in tqdm(data_list,desc="test"):

        code,task_Type,task_name= code_task(data)
        action_file_list = file_path_list(f"../action_check/concept_data/action_{code}.json")
        action_list = read_json(action_file_list[0])
        action_list = extract_pddl(action_list[0])

        parameters_dic={}
        parameters_list=[]
        for action in action_list:
            temp_list = extract_action_parameters(action)
            # print(temp_list)
            parameters_list = parameters_list + temp_list
            for params in parameters_list:
                parameters_dic[params[0]] = params[1]
        if task_Type == "seen":
            extracted_dict = select_seen_entity(task_name)
            if extracted_dict == None:
                extracted_dict = find_entity_dic(data)
                print("seen", extracted_dict, task_name)
        else:
            extracted_dict = select_unseen_entity(parameters_dic)
            if extracted_dict == None:
                print("unseen", extracted_dict, task_name)
        # **   PDDL   **
        parsed_pddl_actions = []
        for action in action_list:
            parsed_pddl_actions.append(parse_pddl_action(action))

        # **   PDDL     **
        all_pddl_instances = generate_pddl_instances(parsed_pddl_actions, extracted_dict)
        if len(all_pddl_instances) > 120:
            # **           ，           **
            new_entity_list = []
            for key, value in extracted_dict.items():
                new_entity_list.append(key)
            entiy_choose = generate_prompt_entity(list(data.keys())[0], new_entity_list)
            entity_choose = gen_action(entiy_choose)
            clean_entity = clean_entity_function(entity_choose)
            formatted_result = convert_to_original_format(clean_entity, extracted_dict)

            new_extracted_dict = {}
            for key, vlaue in formatted_result.items():
                if key != "Weak association":
                    for k, v in vlaue.items():
                        new_extracted_dict[k] = v
            all_pddl_instances = generate_pddl_instances(parsed_pddl_actions, new_extracted_dict)
            print("  ",len(all_pddl_instances))
        Instantiating_data = []
        # **   PDDL   **
        for instance in all_pddl_instances:
            # print(simplify_pddl_action(instance))
            Instantiating_data.append(simplify_pddl_action(instance))
        all_data_list.append({"task":list(data.keys())[0],"instantiting_action":Instantiating_data})
    if not os.path.exists(save_file_path):
        os.makedirs(save_file_path)
    with open(f"{save_file_path}/{file}", 'w', encoding="utf-8") as file:
        json.dump(all_data_list, file, indent=4)
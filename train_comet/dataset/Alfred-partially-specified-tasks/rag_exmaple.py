import json
import os
import re

from tqdm import tqdm
from transformers import BertTokenizer, BertModel
import torch
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
# 
def extract_actions_with_numbers(action_string):
    # 
    pattern = r"\(:action (\w+)\s*;?\s*([\d, ]*)"
    action_data = re.findall(pattern, action_string)
    temp_list=[]
    for action, numbers in action_data:
        temp_list.append(action)
    # ，
    return temp_list

    # [i]
def extract_references_as_dict(text):
    #  [i] ，
    pattern = r"(.*?)\[(\d+)\]"
    matches = re.findall(pattern, text)

    def remove_number_prefix(sentence):
        # 
        return re.sub(r"^\d+\.\s*", '', sentence).strip()

    # 
    return {int(num): remove_number_prefix(sentence) for sentence, num in matches}
def action_references(actions_dict,sentences_dict):
    action_to_sentences = {}
    for action, indices in actions_dict.items():
        # action
        action_to_sentences[action] = [sentences_dict[i] for i in indices]
    return action_to_sentences
def match_actions_to_sentences(plan_lines, text_to_plan):
    result = {}
    for plan in plan_lines:
        for text in text_to_plan:
            if text["Output"]==plan:
                result[plan]=text["Input"]
            # 
    return result


def extract_actions_as_list(pddl_text):
    #  :action ，，、
    action_pattern = re.compile(r'(\(:action\s+\w+\s*:parameters\s*\(.*?\)\s*:precondition\s*\(.*?\)\s*:effect\s*\(.*?\)\s*\))', re.DOTALL)

    #  action 
    actions = action_pattern.findall(pddl_text)

    #  action ，
    extracted_actions = [action.strip() for action in actions]

    return extracted_actions

# 
def sentence_to_steps_mapping(dictionary):
    # ， key， value
    sentence_to_steps = {}

    for step, sentences in dictionary.items():
        for sentence in sentences:
            # ，
            if sentence not in sentence_to_steps:
                sentence_to_steps[sentence] = []
            # 
            if step not in sentence_to_steps[sentence]:
                sentence_to_steps[sentence].append(step)

    return sentence_to_steps
def extract_floder_name(file_path):
    #  split  '/' 
    file_name = file_path.split('/')[-1]  # 
    #  "problem-"  ".pddl_plan.txt"
    file_count = file_name.replace("problem_", "")
    return file_count
def extract_plan_name(file_path):
    #  split  '/' 
    parent_path, filename = os.path.split(file_path)
    # ，
    _, second_last_dir = os.path.split(parent_path)
    # ，
    number = re.search(r'\d+', second_last_dir).group()
    problem_name = filename.replace(f"_plan.txt", "")
    problem_path = f"problem_new/problem_{number}/{problem_name}"

    #  "problem-"  ".pddl_plan.txt"
    plan_name = filename.replace(f".pddl_plan.txt","").replace("_"," ")
    plan_name = re.sub(r'\d+$', '', plan_name).strip()
    return plan_name,problem_path
def list_subfolders(folder_path):
    subfolders = []
    # 
    for item in os.listdir(folder_path):
        item_path = os.path.join(folder_path, item)
        # 
        if os.path.isdir(item_path):
            subfolders.append(item_path)
    return subfolders

def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list


def read_file(file_path, encoding="utf-8"):
    """"""
    with open(file_path, 'r', encoding=encoding) as file:
        return file.read()


def extract_plan_lines(plan_file):
    """ plan ，"""
    plan_lines = []
    with open(plan_file, 'r', encoding="utf-8") as file:
        lines = file.readlines()
        lines = [line.replace('(', '').replace(')\n', '') for line in lines[:-1]]  # 
        plan_lines.extend(lines)
    return plan_lines


def action_sentences(plan_file):
    """"""
    # 
    action_data = read_file("action_step_map.txt")
    domain = read_file("domain_updated.pddl")
    with open("text_to_plan.json",'r')as file:
        text_to_plan=json.load(file)
    # 
    plan_lines = extract_plan_lines(plan_file)
    actions_dict = extract_actions_with_numbers(action_data)
    domain_action = extract_actions_as_list(domain)
    # 
    plan_sentences = {}
    plan_sentences["action"]=[]
    # 
    for action in actions_dict:
        for plan in plan_lines:
            if action.lower() in plan:
                plan_sentences[plan] = action
    #  domain 
    for action in domain_action:
        for plan in plan_lines:
            if plan_sentences.get(plan) and plan_sentences[plan] in action:
                plan_sentences["action"].append(action)
    plan_sentences["action"]=list(set(plan_sentences["action"]))
    # 
    matched_results = match_actions_to_sentences(plan_lines, text_to_plan)
    return matched_results,plan_sentences

def preprocess_pddl(pddl_str):
    # Remove lines starting with ';;' (comments)
    pddl_str = re.sub(r';;.*', '', pddl_str)
    # Remove non-ASCII characters
    pddl_str = re.sub(r'[^\x00-\x7F]+', '', pddl_str)
    return pddl_str

def tokenize(s):
    return re.findall(r'\(|\)|[^\s()]+', s)

def parse(tokens):
    if len(tokens) == 0:
        raise SyntaxError('Unexpected EOF')
    token = tokens.pop(0)
    if token == '(':
        L = []
        while tokens[0] != ')':
            L.append(parse(tokens))
            if len(tokens) == 0:
                raise SyntaxError('Unexpected EOF')
        tokens.pop(0)  # Remove ')'
        return L
    elif token == ')':
        raise SyntaxError('Unexpected )')
    else:
        return token

def find_goal(parsed):
    if isinstance(parsed, list):
        for item in parsed:
            if isinstance(item, list) and len(item) >= 2 and item[0] == ':goal':
                return item[1]
            else:
                result = find_goal(item)
                if result is not None:
                    return result
    return None

def extract_goal_conditions(pddl_problem):
    with open(pddl_problem,'r',encoding="utf-8") as file:
        pddl_content=file.read()
    clean_pddl = preprocess_pddl(pddl_content)

    # Tokenize and parse the PDDL content
    tokens = tokenize(clean_pddl)
    parsed = parse(tokens)
    goal_content = find_goal(parsed)
    print(goal_content)
    if goal_content[0] == 'and':
        conditions = goal_content[1:]
        conditions=reconstruct_expr(conditions)
    else:
        conditions = [goal_content]
        conditions=reconstruct_expr(conditions)
    return conditions
def reconstruct_expr(expr):
    if isinstance(expr, list):
        return '(' + ' '.join(map(reconstruct_expr, expr)) + ')'
    else:
        return expr






sentence_action_list = []
folder_path_list = list_subfolders("plan")
#folder_path_list=["pddl_data/115168608"]
for folder_path in tqdm(folder_path_list,desc="RAG"):
    plan_file_path = file_path_list(folder_path)
    for plan_file in plan_file_path:
        plan_name,problem_path = extract_plan_name(plan_file)
        matched_results, plan_sentences = action_sentences(plan_file)
        goal_list = extract_goal_conditions(problem_path)
        # 
        selected_sentences = {}
        action_dic = {
            "task": plan_name,
            "step": [],
            "desc": [],
            "action": plan_sentences["action"],
            "goal_state":goal_list
        }

        for step, sentences in matched_results.items():
            action_dic["step"].append(step)
            action_dic["desc"].append(sentences)
        action_dic["desc"]=list(set(action_dic["desc"]))
        #  action_dic 
        sentence_action_list.append(action_dic)
    print(len(sentence_action_list))
#  JSON 
with open("rag_all_data.json", 'w', encoding="utf-8") as file:
    json.dump(sentence_action_list, file, indent=4)
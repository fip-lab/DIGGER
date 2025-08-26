import json
import os
import re

from tqdm import tqdm
from transformers import BertTokenizer, BertModel
import torch
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
#  BERT 
# 
def extract_actions_with_numbers(action_string):
    # 
    pattern = r"\(:action (\w+)\s*;?\s*([\d, ]*)"
    action_data = re.findall(pattern, action_string)

    # ，
    return {action: [int(num) for num in numbers.split(',') if num.strip()] for action, numbers in action_data}

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
def match_actions_to_sentences(actions, action_to_sentences, sentence_dict):
    result = {}
    for action in actions:
        # ， 'chop_wood'  'chop_wood person jungle wood'
        action_type = action.split(' ')[0]

        # 
        if action_type in action_to_sentences:
            sentence_ids = action_to_sentences[action_type]

            # 
            sentences = [sentence_dict[sentence_id] for sentence_id in sentence_ids if sentence_id in sentence_dict]

            # 
            result[action] = sentences

    return result


def extract_actions_as_list(pddl_text):
    #  :action ， .*? ，
    #  (:action ， ) 
    action_pattern = re.compile(r'(\(:action\s[\w_]+.*?)(?=\(:action|\Z)', re.DOTALL)

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
    #action_name = file_name.replace("submission_", "")
    return file_name
def extract_plan_name(file_path):
    #  split  '/' 
    file_name = file_path.split('/')[-1]  # 
    #  "problem-"  ".pddl_plan.txt"
    plan_name = file_name.replace("problem-", "").replace(".pddl_plan.txt","")
    return plan_name
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


def action_sentences():
    """"""

    domain = read_file(f"domain_updated.pddl")

    # d
    domain_action = extract_actions_as_list(domain)
    print(domain_action)
    action_len_s=len(domain_action)
    return action_len_s


sentence_action_list = []
folder_path_list = list_subfolders("plan")




action_len=0
count=1
task_count=0
plan_len_lines=0
action_len_s = action_sentences()
action_len=action_len+action_len_s
for folder_path in tqdm(folder_path_list,desc="RAG"):
    print(folder_path)
    file_path=file_path_list(folder_path)
    print(file_path)
    for path in file_path:
        print(path)
        plan_len_line = len(extract_plan_lines(path))
        print(plan_len_line, file_path)
        plan_len_lines = plan_len_line + plan_len_lines
        task_count = task_count + 1
print(action_len,count,task_count)
print("",plan_len_lines/task_count)
print("",action_len)
print("",task_count)
print("",count)
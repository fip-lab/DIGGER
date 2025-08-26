import json
import os
import re
import shutil
import subprocess
def extract_actions_as_list(pddl_text):
    #  :action ， .*? ，
    #  (:action ， ) 
    action_pattern = re.compile(r'(\(:action\s[\w_]+.*?)(?=\(:action|\Z)', re.DOTALL)

    #  action 
    actions = action_pattern.findall(pddl_text)

    #  action ，
    extracted_actions = [action.strip() for action in actions]

    return extracted_actions
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
# 
def extract_plan_lines(plan_file):
    """ plan ，"""
    plan_lines = []
    with open(plan_file, 'r', encoding="utf-8") as file:
        lines = file.readlines()
        lines = [line.replace('(', '').replace(')\n', '') for line in lines[:-1]]  # 
        plan_lines.extend(lines)
    return plan_lines

def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
def read_file(file_path, encoding="utf-8"):
    """"""
    with open(file_path, 'r', encoding=encoding) as file:
        return file.read()
def load_plan(floder_path):
        len_dic={}
        output_folder = f'plan/{os.path.basename(floder_path)}'
        domain_file = floder_path + "/domain.pddl"
        problem_file=floder_path+"/problem.pddl"
        step_file = floder_path + "/step.json"
        step_json=read_json(step_file)
        domain=read_file(domain_file)
        plan_file = f'{output_folder}/{os.path.basename(problem_file)}_plan.txt'
        data=extract_plan_lines(plan_file)
        domain_action = extract_actions_as_list(domain)
        len_action=len(domain_action)
        plan_len=len(data)
        steps_len=len(step_json["steps"])
        return len_action,plan_len,steps_len

wikihow_plan_txt_list=[]
task_count=0
action_count=0
plan_count=0
steps_count=0
file_path_list=list_subfolders("wikihow_plan")
for file_path in file_path_list:
        task_count=task_count+1
        print(file_path)
        len_action,plan_len,steps_len=load_plan(file_path)
        action_count =action_count+len_action
        plan_count =plan_count+plan_len
        steps_count = steps_len+steps_count
        print(len_action,plan_len,steps_len)
print("",task_count)
print("",action_count/task_count)
print("",plan_count/task_count)
print("",steps_count/task_count)

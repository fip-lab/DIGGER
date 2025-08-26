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
        step_dic = {}
        output_folder = f'plan/{os.path.basename(floder_path)}'
        domain_file = floder_path + "/domain.pddl"
        domain=read_file(domain_file)
        domain_action = extract_actions_as_list(domain)
        # 
        if not os.path.exists(output_folder):
            os.makedirs(output_folder)
        problem_file = floder_path + "/problem.pddl"
        step_file = floder_path + "/step.json"
        plan_file = f'{output_folder}/{os.path.basename(problem_file)}_plan.txt'
        data = extract_plan_lines(plan_file)
        step_json = read_json(step_file)
        step_dic["task"] = step_json["goal"]
        step_dic["step"] = data
        step_dic["desc"] = step_json["steps"]
        step_dic["action"]=domain_action
        return step_dic
with open("../rag_all_data.json",'r',encoding="utf-8")as file:
    data_list=json.load(file)
file_path_list=list_subfolders("wikihow_plan")
for file_path in file_path_list:
        step_dic=load_plan(file_path)
        data_list.append(step_dic)
print(data_list)
with open("../rag_all_data.json",'w',encoding="utf-8")as outfile:
    json.dump(data_list,outfile,indent=4)
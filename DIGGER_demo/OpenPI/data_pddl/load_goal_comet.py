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
def extract_goal(pddl_file):
    with open(pddl_file, 'r') as file:
        pddl_content = file.read()

    #  :goal 
    goal_pattern = re.compile(r':goal\s*(\(.*?\))', re.DOTALL)
    goal_match = goal_pattern.search(pddl_content)

    if goal_match:
        goal_expression = goal_match.group(1)
        goal_expression=clean_goal_expression(goal_expression)
        return goal_expression.strip()
    else:
        return None

def clean_goal_expression(goal_expression):
    #  ;; ，
    goal_expression = re.sub(r';;.*', '', goal_expression)
    # （\u4e00-\u9fff）
    goal_expression = re.sub(r'[\u4e00-\u9fff]', '', goal_expression)
    #  "(and" 
    goal_expression = re.sub(r'\(and', '', goal_expression)
    # 
    cleaned_expression = re.sub(r'\s+', ' ', goal_expression).strip()
    # 
    cleaned_expression = re.sub(r'\) \(', ')\n(', cleaned_expression)
    return cleaned_expression



def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
def read_file(file_path, encoding="utf-8"):
    """"""
    with open(file_path, 'r', encoding=encoding) as file:
        return file.read()
def load_plan(floder_path):
        problem_file=floder_path+"/problem.pddl"
        goal_list=extract_goal(problem_file)
        step_file = floder_path + "/step.json"
        step_json=read_json(step_file)
        goal=step_json["goal"]
        return goal,goal_list

goal_dict_list=[]
"""file_path_list=list_subfolders("wikihow_plan")
for file_path in file_path_list:
        goal_dic={}
        goal,goal_list=load_plan(file_path)
        goal_dic["nl_goal"]=goal
        goal_dic["goal_state"]=goal_list
        goal_dict_list.append(goal_dic)"""
with open("../wikihow_plan_txt.json", "r", encoding="utf-8") as file:
    data_list=json.load(file)
for data in data_list:
    goal_dict={}
    goal_dict['goal']=data["goal"]
    goal_dict["step"]=data["pddl"]
    goal_dict["goal_state"]=data["goal_state"]
    goal_dict_list.append(goal_dict)
with open("../goal_comet/openpi_goal.json","w",encoding="utf-8") as file:
    json.dump(goal_dict_list,file,indent=4)
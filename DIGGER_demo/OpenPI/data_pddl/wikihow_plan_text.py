import json
import os
import re
import shutil
import subprocess


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


def extract_input_output(text):
    # Regular expression to match "Input" and "Output", handling both cases with and without PDDL actions
    input_output_pairs = re.findall(
        r'Input:\s*"([^"]+)"\s*Output:\s*((?:"[^"]+"\s*,?\s*)+)',
        text
    )

    # List to hold structured results
    result = []

    for input_text, output_texts in input_output_pairs:
        # If pair[0] is non-empty, it means we have both Input and Output
        cleaned_output = ', '.join([output.strip().replace("\"", "") for output in output_texts.split(',')])
        result.append({
                "Input": input_text,
                "Output": cleaned_output
            })
        # If pair[2] is non-empty, it means Output is missing

    return result

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
def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
def load_plan(floder_path):
        step_dic={}
        output_folder = f'plan/{os.path.basename(floder_path)}'
        # 
        if not os.path.exists(output_folder):
            os.makedirs(output_folder)
        problem_file=floder_path+"/problem.pddl"
        step_file = floder_path + "/step.json"
        step_json=read_json(step_file)
        step_dic["goal"]=step_json["goal"]
        step_dic["steps"]=step_json["steps"]
        goal_list = extract_goal_conditions(problem_file)
        plan_file = f'{output_folder}/{os.path.basename(problem_file)}_plan.txt'
        data=extract_plan_lines(plan_file)
        step_dic["pddl"]=data
        step_dic["goal_state"]=goal_list
        return step_dic
def create_prompt(data_list):
    prompt_list = []
    for data in data_list:
        prompt = f"""
You are given a set of instructions for '{data["goal"]}' and a corresponding list of PDDL actions. Your task is to match each natural language step from the instructions to its corresponding PDDL action. The PDDL actions represent the logical operations performed by a robot or an automated system to complete the same task as described in the instructions.

Steps Description: {data["steps"]}
PDDL Action: {data["pddl"]}

Output the matching PDDL actions for each step. Only output the exact match in the format below. Do not include any extra explanations or additional text.

Output Format:
Input: <Natural language step>
Output: <PDDL action>

For example:
Input: "Place the yogurt, bananas, and sorbet in a blender."
Output: "place-ingredients bananas sorbet yogurt blender-1"

Now, provide the output for the steps:
"""

        prompt_list.append(prompt)
    return prompt_list


wikihow_plan_txt_list=[]
file_path_list=list_subfolders("wikihow_plan")
for file_path in file_path_list:
        step_dic=load_plan(file_path)
        wikihow_plan_txt_list.append(step_dic)
        print(file_path)

with open("wikihow_plan_txt.json", 'w', encoding="utf-8") as file:
        json.dump(wikihow_plan_txt_list,file,indent=4)

"""all_list=[]
pddl_list=read_json("wikihow_plan_txt_result.json")
for pddl in pddl_list:
    list=extract_input_output(pddl)
    all_list=all_list+list
with open("../all_wikihow_no_llm/wikihow_txt_plan.json", 'w', encoding="utf-8") as file:
    json.dump(all_list, file, indent=4)"""
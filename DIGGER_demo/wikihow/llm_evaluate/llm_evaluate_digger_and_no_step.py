import json
import os
import re

from openai import OpenAI
from tqdm import tqdm

client = OpenAI()
def llm_evaluate(prompt):
    chat_completion = client.chat.completions.create(
        model="o1-mini",
        messages=[{"role": "user", "content": prompt}],
        # temperature=0.5
    )
    totol_completion_tokens = 0
    totol_prompt_tokens = 0
    totol_completion_tokens += chat_completion.usage.completion_tokens
    totol_prompt_tokens += chat_completion.usage.prompt_tokens
    generated_text = chat_completion.choices[0].message.content
    return generated_text

def create_prompt(data,reference_text,generated_text):
    prompt=f"""
You are an expert evaluator tasked with comparing two texts: Text 1 and Text 2. Your primary goal is to evaluate them based on how well they align with the task goal. The evaluation should focus on how effectively each text helps in achieving the core objective of the task, emphasizing comprehensiveness, practicality, and relevance.

Please evaluate both texts based on the following criteria, prioritizing the alignment with the task goal:

Task Alignment & Goal Focus:

Does the text clearly understand and align with the task goal?
Does the text directly address the core objective of the task without deviating or introducing irrelevant content?
Information Richness & Task Completeness:

Does the text provide sufficient details and cover all necessary steps to complete the task as per the task goal?
Does it guide the user in understanding and completing the task successfully?
Clarity of Expression & Practical Usability:

Is the text easy to understand and clearly expressed?   
Does it provide actionable, practical guidance for the task goal?
Linguistic Fluency & Relevance:

Does the text flow naturally and logically without awkward phrasing?
Is the information entirely relevant to the task goal, avoiding redundant or unrelated details?
After evaluating both Text 1 and Text 2 based on these criteria, provide an overall judgment on which text performs better in terms of helping the user achieve the task goal.
#Task: {data["task"]}\n
Gold Step: {data["step"]}
Text 1: {reference_text}\n
Text 2: {generated_text}\n

Only output the result without explanatory texts
Output format example: Final Judgment: Text 1: Win
"""
    return prompt
def clean_data(nl_step):
    match = re.search(r"\*\*Steps in Natural Language\*\*:\n(.*)", nl_step, re.DOTALL)
    if match:
        steps = match.group(1).strip().split("\n")
        # （）
        steps = [re.sub(r'^\d+\.\s*', '', step) for step in steps]
        return steps
    return [nl_step]

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
def data_merge(file_path):
    data_list=[]
    file_path_list=get_file_paths(file_path)
    for file in file_path_list:
        data_list=read_json(file)+data_list
    return data_list
result_list=[]
org_file="../Instantiating_plan/pddl_to_text/instantiating_action_4o_plan_new_prompt"
org_list=data_merge(org_file)

pre_file="../Instanting_no_step_plan/pddl_to_text/instantiating_action_4o_plan_new_prompt"
pre_list = data_merge(pre_file)
    #
for pre_data in pre_list:
    for org_data in org_list:
        if pre_data["task"] == org_data["task"]:
            nl_step_data = pre_data["nl_step"]
            org_step_data = org_data["nl_step"]
            if nl_step_data:
                generated_prompt = create_prompt(pre_data, org_step_data, nl_step_data)
                result = llm_evaluate(generated_prompt)
                result_list.append(result)
                print(result)
similar_path = f"evaluate_result"
if not os.path.exists(similar_path):
    os.makedirs(similar_path)
with open(f"{similar_path}/no_step.json", 'w', encoding='utf-8') as f:
    json.dump(result_list, f, ensure_ascii=False, indent=4)
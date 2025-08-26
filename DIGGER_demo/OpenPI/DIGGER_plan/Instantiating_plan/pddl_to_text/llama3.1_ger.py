# Refer to the document for workspace information: https://help.aliyun.com/document_detail/2746874.html
import time
# For prerequisites running the following sample, visit https://help.aliyun.com/document_detail/611472.html
from http import HTTPStatus
import dashscope

dashscope.api_key="sk-478968c8a09b444788d78a6d0f79ec69"

import json
import os
import torch
from openai import OpenAI
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer


device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERTGPU
def generate_step(prompt):
    messages = [{'role': 'system', 'content': 'You are a helpful assistant.'},
                {'role': 'user', 'content': prompt}]
    response = dashscope.Generation.call(
        model='llama3.1-70b-instruct',
        messages=messages,
        result_format='message',  # set the result to be "message" format.
    )
    if response.status_code == HTTPStatus.OK:
        print(response)
    else:
        print('Request id: %s, Status code: %s, error code: %s, error message: %s' % (
            response.request_id, response.status_code,
            response.code, response.message
        ))
    return response
def generate_pddl_prompt_with_predicted_length(data):

    prompt = f"""Write a solution to this task:
### Task:{data["goal"]}
"""
    return prompt

def iterative_generate_pddl(task_description):
    """
    Iteratively generates PDDL planning steps by building upon each previous step.
    # Initialize an empty list for final steps"""
    final_steps=[]
        # Generate a prompt with the current steps
    prompt = generate_pddl_prompt_with_predicted_length(task_description)
        # Generate a new step using the model
    new_step = generate_step(prompt)
    step=new_step["output"]["choices"][0]["message"]["content"]
        # Add the new step to the list of steps
    final_steps.append(step)
    return final_steps


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
prompt_list = []
class_name_path = read_json("pddl_to_text/pddl_to_text.json")
for class_name in class_name_path:
    time.sleep(10)
    nl_step = iterative_generate_pddl(class_name)
    class_name["nl_step"] = nl_step
    prompt_list.append(class_name)
with open(f"pddl_to_text/llama3.1.json", 'w', encoding='utf-8') as f:
    json.dump(prompt_list, f, ensure_ascii=False, indent=4)

import json
import os
import torch
from openai import OpenAI
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

client = OpenAI()

device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERTGPU
def generate_step(prompt):
    chat_completion = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.5
    )
    totol_completion_tokens = 0
    totol_prompt_tokens = 0
    totol_completion_tokens += chat_completion.usage.completion_tokens
    totol_prompt_tokens += chat_completion.usage.prompt_tokens
    generated_text = chat_completion.choices[0].message.content
    print(generated_text)
    return generated_text
def generate_pddl_prompt_with_predicted_length(data):
    """
    Generates a prompt for producing PDDL planning steps based on the task, domain, examples, and predicted length.
    """
    prompt = f"""Write a solution to this task:
### Task:{data["task"]}
"""
    return prompt

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


cluster_data_list = []
cluster_data_no_tag = []
pddl_file_list = []
prompt_list = []
class_name_path = read_json("../Instantiating_plan/pddl_to_text/instantiating_action_4o_plan_new_prompt/test/test.json")
for class_name in class_name_path:
    # generated_prompt = generate_pddl_plan(next(iter(data)), domain_list[0],data)
    generated_prompt = generate_pddl_prompt_with_predicted_length(class_name)
    print(generated_prompt)
    nl_step = generate_step(generated_prompt)
    class_name["nl_step"] = nl_step
    prompt_list.append(class_name)
with open(f"pddl_to_text/gpt-4.json", 'w', encoding='utf-8') as f:
    json.dump(prompt_list, f, ensure_ascii=False, indent=4)
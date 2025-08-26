import json
import os
import torch
from openai import OpenAI
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer
client = OpenAI()()

device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(f"Using device: {device}")

# Sentence-BERTGPU
def generate_step(prompt):
    chat_completion = client.chat.completions.create(
        model="deepseek-v3",
        messages=[{"role": "user", "content": prompt}],
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
    total_length = 0
    for example_task in data["similar_task"]:
        steps = example_task['step']
        total_length += len(steps)
    predicted_length = total_length // 3
    print("",predicted_length)

    prompt = f"""Write a solution to this task:
### Task:{data["task"]}
The number of output steps is maximum:{predicted_length}
"""
    return prompt

def iterative_generate_pddl(task_description,data):
    """
    Iteratively generates PDDL planning steps by building upon each previous step.
    # Initialize an empty list for final steps"""
    final_steps=[]
        # Generate a prompt with the current steps
    prompt = generate_pddl_prompt_with_predicted_length(task_description,data)
        # Generate a new step using the model
    new_step = generate_step(prompt)

        # Add the new step to the list of steps
    final_steps.append(new_step)
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
data_list=[]
pddl_file_list = get_file_paths("../Instantiating_plan/pddl_to_text/instantiating_action_4o_plan_new_prompt")
for pddl_file in tqdm(pddl_file_list, desc=""):
    prompt_list = []
    file_name = os.path.basename(pddl_file)
    files_name = os.path.basename(pddl_file).replace(".json", "")
    pddl_list = read_json(pddl_file)
    for data in tqdm(pddl_list, desc=""):
        generated_prompt = generate_pddl_prompt_with_predicted_length(data)
        print(generated_prompt)
        nl_step = generate_step(generated_prompt)
        data["nl_step"] = nl_step
        prompt_list.append(data)
    data_list=data_list+prompt_list
similar_path = f"pddl_to_text"
if not os.path.exists(similar_path):
    os.makedirs(similar_path)
with open(f"{similar_path}/deepseek_v3.json", 'w', encoding='utf-8') as f:
    json.dump(data_list, f, ensure_ascii=False, indent=4)
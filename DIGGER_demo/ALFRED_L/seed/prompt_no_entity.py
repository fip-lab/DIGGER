import json
import os
from collections import defaultdict
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from tqdm import tqdm
from transformers import AutoModel, AutoTokenizer
import torch

# 
tokenizer = AutoTokenizer.from_pretrained("../../all-MiniLM-L6-v2")
model = AutoModel.from_pretrained("../../all-MiniLM-L6-v2")


# 
def generate_embedding(text):
    inputs = tokenizer(text, return_tensors="pt", padding=True, truncation=True, max_length=512)
    with torch.no_grad():
        outputs = model(**inputs)
        embedding = outputs.last_hidden_state[:, 0, :].squeeze().cpu().numpy()
    return embedding


#  JSON 
def load_data(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        return json.load(file)


# ，
def preprocess_database(data):
    embeddings = []
    for entry in data:
        task = entry['task']
        desc = entry.get('desc', [])
        combined_text = task + " " + " ".join(desc)
        embedding = generate_embedding(combined_text)
        embeddings.append(embedding)
    return embeddings


# 
def find_similar_tasks(query_task, query_desc, data, data_embeddings, k=1):
    query_text = query_task + " " + " ".join(query_desc)
    query_embedding = generate_embedding(query_text)
    similarities = cosine_similarity([query_embedding], data_embeddings).flatten()
    top_k_indices = np.argsort(similarities)[-k:][::-1]
    return [data[i] for i in top_k_indices]


#  prompt （）

def create_prompt_entity(q_data,data_dic):
    prompt = (
        """You are an a briliant AI planning assistant responsible for generating PDDL (Planning Domain Definition Language) actions for a given task. "
        "Your objective is to translate the task's steps into corresponding PDDL actions that capture the intent and logic of each step. "
        "Follow the example provided below and generate the appropriate PDDL actions based on the steps and their descriptions."
         The point of action is to consider descriptions, steps, and other states as AIDS.
         In this section, the entity states before and after each action will be provided to help define the PDDL effects and conditions. Each state includes attributes like location, condition, or readiness of objects involved.
Instructions for Generating PDDL Actions:
For each step, generate a corresponding PDDL action that follows these guidelines:
Action Name: Provide a concise and descriptive name for the action.
Parameters: List the objects, agents, or items involved in this action.
Preconditions: Define the necessary conditions that must be true before the action can be performed.
Effects: Specify the resulting changes or outcomes once the action is completed

Task: {{task}}
File Name: {{file_name}}
Steps:
Step 1: {{step_1}}
Step 2: {{step_2}}
Step 3: {{step_3}}
Step 4: {{step_4}}
Descriptions:
[{Descriptions}]
Entity State:
"""
     )
    for data_list in data_dic:
        prompt = prompt + "Example:\n"f"Suppose the task is {data_list['task']}.\n"
        "Here are the steps:\n"
        #  steps 
        for step in data_list['step']:
            prompt += f"- {step}\n"

        prompt += "\nDescriptions:\n"
        for desc in data_list['desc']:
            prompt += f"- {desc}\n"

        #  PDDL Actions 
        prompt += "\nPDDL Actions:\n"
        for action in data_list['action']:
            prompt += f"{action}\n"
    # 
    task_prompt = (
        "\nYour Task:\n"
        "Now, generate PDDL actions based on the following new task and steps:\n"
        f"Task: {q_data['task']}\n\n"
        "Steps:\n"
    )
    for step in q_data['steps_predictions']:
        task_prompt += f"- {step}\n"

    task_prompt += "\nDescriptions:\n"
    for desc in q_data['step']:
        task_prompt += f"- {desc}\n"
    complete_prompt = prompt + task_prompt
    complete_prompt=complete_prompt+"\nIf a step is irrelevant to the task or description, or appears to be wrong, modify it to be relevant to the step and generate task-specific PDDL actions.\n"+"Generate the PDDL actions using the format and structure shown in the example."
    return complete_prompt
# 
def file_path_list(folder_path):
    return [os.path.join(root, file) for root, dirs, files in os.walk(folder_path) for file in files]


# 
def list_subfolders(folder_path):
    return [os.path.join(folder_path, item) for item in os.listdir(folder_path) if
            os.path.isdir(os.path.join(folder_path, item))]


# 
database = load_data("../pddl_data_step/rag_example/rag_example_data.json")
database_embeddings = preprocess_database(database)

#cluster_data_list = list_subfolders("../data/train")

file_paths=["../entity/comet_data_similar_entity_end/train.json"]
prompt_dic_list=[]
for file_path in file_paths:
    filename = os.path.basename(file_path)
    with open(file_path, 'r', encoding="utf-8") as file:
        cluster_data_content = json.load(file)
        for data in tqdm(cluster_data_content, desc=f"Processing {filename}"):
            prompt_list = {}  #  prompt_list，
            query_task = data['task']
            query_desc = data['step']
            # 
            results = find_similar_tasks(query_task, query_desc, database, database_embeddings, k=1)  #  prompt
            prompt = create_prompt_entity(data, results)
            #  prompt 
            prompt_dic_list.append(prompt)

    # 
    save_directory = f"comet_data_similar_prompt_no_entity"
    if not os.path.exists(save_directory):
        os.makedirs(save_directory, exist_ok=True)

    #  prompt 
    new_file_path = os.path.join(save_directory, filename)
    with open(new_file_path, 'w', encoding='utf-8') as f:
        json.dump(prompt_dic_list, f, ensure_ascii=False, indent=4)

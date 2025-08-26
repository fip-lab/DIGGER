import json
import os

from openai import OpenAI
from tqdm import tqdm

client = OpenAI()


def gen_action(prompt_list):
    result=[]
    for prompt in tqdm(prompt_list, desc=""):
        chat_completion = client.chat.completions.create(
            model="gpt-4o",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.5
        )
        totol_completion_tokens = 0
        totol_prompt_tokens = 0
        totol_completion_tokens += chat_completion.usage.completion_tokens
        totol_prompt_tokens += chat_completion.usage.prompt_tokens
        generated_text = chat_completion.choices[0].message.content
        result.append(generated_text)
    return result
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

def read_json(file_path):
    with open(file_path, 'r',encoding="utf-8") as file:
        data_list = json.load(file)
    return data_list

floder_path='../seed/comet_data_similar_prompt_no_entity'
file_path=file_path_list(floder_path)
prompt_list = read_json(file_path[0])
for prompt in prompt_list:
    for p,v in prompt.items():
        print(p,v)
        action_list = gen_action(v)
        print(action_list)
        path="action_ger_no_entity"
        if not os.path.exists(path):
            os.makedirs(path)
        with open(f"{path}/{os.path.basename(p)}", 'w', encoding="utf-8") as file:
            json.dump(action_list, file, indent=4)
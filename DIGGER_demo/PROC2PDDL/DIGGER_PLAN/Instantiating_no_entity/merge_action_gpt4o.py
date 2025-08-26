import json
import os.path

from openai import OpenAI
from tqdm import tqdm

client = OpenAI()


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


file_path_list=file_path_list("merge_action_prompt/concept_data")

for file_path in file_path_list:
    gpt_result = []
    with open(file_path, 'r', encoding="utf-8") as file:
        prompt_list = json.load(file)
    for prompt in tqdm(prompt_list, desc="    "):
        chat_completion = client.chat.completions.create(
            model="gpt-4o",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7
        )
        totol_completion_tokens = 0
        totol_prompt_tokens = 0
        totol_completion_tokens += chat_completion.usage.completion_tokens
        totol_prompt_tokens += chat_completion.usage.prompt_tokens
        generated_text = chat_completion.choices[0].message.content
        gpt_result.append(generated_text)
    print(gpt_result)

    file = os.path.basename(file_path)
    file_name = os.path.basename(file_path).replace("_train.json", "")
    save_file_path=f"action_merge/concept_data/{file_name}/"
    if not os.path.exists(save_file_path):
        os.makedirs(save_file_path)
    with open(f"{save_file_path}/{file}", 'w', encoding="utf-8") as file:
        json.dump(gpt_result, file, indent=4)

def save_json(merge_dic,files):
    file=os.path.basename(files)
    file_name=os.path.basename(files).replace("_train.json","")
    file_path=f"merge_action/concept_data/{file_name}/"
    if not os.path.exists(file_path):
        os.makedirs(file_path)
    with open(file_path+f"{file}", 'w', encoding='utf-8') as file:
        json.dump(merge_dic,file,indent=4)
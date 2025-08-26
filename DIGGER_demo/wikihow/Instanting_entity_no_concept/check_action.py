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
def read_json(file_path):
    with open(file_path,'r',encoding="utf-8")as file:
        data=json.load(file)
    return data

def generate_result(prompt):
    gpt_result=[]
    chat_completion = client.chat.completions.create(
            model="gpt-4o",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7
        )
    generated_text = chat_completion.choices[0].message.content
    gpt_result.append(generated_text)
    print(gpt_result)
    return gpt_result

def generate_prompt(data_list):
    prompt=f"""
You are an expert in AI planning and PDDL (Planning Domain Definition Language).  
I will provide you with a set of PDDL action definitions, including ':parameters',' :precondition ', and ':effect'.
When commenting, please keep a description of what this action set does, and do not completely remove the description of the original action set.
### ** Your mission

1. ** Analyze and check PDDL action ** :
- Identify inconsistent or redundant variable types **(e.g., 'entity' vs. "Agent").
- Check for logical inconsistencies (e.g., missing preconditions, conflicting effects).
- Ensure effective and meaningful preconditions and effects.

2. ** Corrective action ** :
- Standardize variable types (for example, unify "entity" and "agent" into one type).
- Ensure that each action has logically valid preconditions and effects.
- Remove or fix contradictory or unnecessary conditions **.

3. ** Provide a correct set of PDDL actions ** :
- The final output should be a list of valid PDDL actions **.
- Does not include explanations or errors, only corrective actions.

### **PDDL action definition
{data_list}

### ** Output format
The final output should contain only the correct PDDL actions, formatted as a list of valid PDDL definitions.
    """
    return prompt
file_path_list=file_path_list("action_new/concept_data")
for file_path in tqdm(file_path_list,desc=""):
    print(file_path)
    data_list = read_json(file_path)
    prompt=generate_prompt(data_list)
    gpt_result=generate_result(prompt)

    file = os.path.basename(file_path)
    file_name = os.path.basename(file_path).replace("_train.json", "")

    save_file_path=f"action_check/concept_data/{file_name}/"
    if not os.path.exists(save_file_path):
        os.makedirs(save_file_path)
    with open(f"{save_file_path}/{file}", 'w', encoding="utf-8") as file:
        json.dump(gpt_result, file, indent=4)

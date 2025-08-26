import json
import os
import re

from openai import OpenAI
from tqdm import tqdm

client = OpenAI()()


def gen_action(prompt):
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
    return generated_text


def create_pddl_domain_prompt(action_list):
    prompt = (
        "You are a brilliant PDDL (Planning Domain Definition Language) domain generation AI.\n"
        "Your goal is to construct a comprehensive PDDL domain using the provided actions. Ensure that the domain includes the following:\n\n"

        "### Domain Construction Requirements:\n"
        "1. **Domain Name**: Choose a name that reflects the overall purpose of the domain.\n"
        "2. **Type Declarations**: Define the relevant object types (e.g., npc, location, water, source).\n"
        "3. **Predicate Definitions**: List all necessary predicates based on the parameters, preconditions, and effects of the actions.\n"
        "4. **Integrity & Structure**: Ensure logical consistency and preserve the structure of the original actions while combining those that share common semantics or functionality.\n\n"

        "### Example Task:\n"
        "#### Input:\n"
        "```pddl\n"
        ";; Merged actions: walk_to, walk_back_to_table\n"
        "(:action move_character_to_location\n"
        "    :parameters (?npc - npc ?l1 - location ?l2 - location)\n"
        "    :precondition (and (at ?npc ?l1) (connected ?l1 ?l2))\n"
        "    :effect (and (at ?npc ?l2) (not (at ?npc ?l1)))\n"
        ")\n\n"
        ";; Merged actions: get_water, collect_water\n"
        "(:action acquire_water\n"
        "   :parameters (?npc - npc ?loc - location ?water - water ?vendor - vendor)\n"
        "   :precondition (and (at ?npc ?loc)\n"
        "                      (or (has_water_source ?loc) (available ?vendor ?water)))\n"
        "   :effect (and (has ?npc ?water)\n"
        "                (or (not (available ?vendor ?water)) (not (water_available ?loc ?water))))\n"
        ")\n"
        "```\n\n"

        "#### Output:\n"
        "```pddl\n"
        "(define (domain location_and_water_management)\n\n"
        "  (:requirements :strips :typing)\n\n"
        "  (:types\n"
        "    npc player character person location object water source\n"
        "  )\n\n"
        "  (:predicates\n"
        "    (at ?npc - npc ?location - location)\n"
        "    (connected ?l1 - location ?l2 - location)\n"
        "    (is_kitchen ?loc - location)\n"
        "    (hydrated ?person - person)\n"
        "    (inventory ?npc - npc ?item - object)\n"
        "    (has_collected ?npc - npc ?water - water)\n"
        "    (water_available ?source - source ?water - water)\n"
        "  )\n\n"

        "  ;; Merged actions: walk_to, walk_back_to_table\n"
        "  (:action move_character_to_location\n"
        "      :parameters (?npc - npc ?l1 - location ?l2 - location)\n"
        "      :precondition (and (at ?npc ?l1) (connected ?l1 ?l2))\n"
        "      :effect (and (at ?npc ?l2) (not (at ?npc ?l1)))\n"
        "  )\n\n"

        "  ;; Merged actions: get_water, collect_water\n"
        "  (:action acquire_water\n"
        "     :parameters (?npc - npc ?loc - location ?water - water ?vendor - vendor)\n"
        "     :precondition (and (at ?npc ?loc)\n"
        "                        (or (has_water_source ?loc) (available ?vendor ?water)))\n"
        "     :effect (and (has ?npc ?water)\n"
        "                  (or (not (available ?vendor ?water)) (not (water_available ?loc ?water))))\n"
        "  )\n"
        ")\n"
        "```\n\n"

        "### Now, based on the provided action list, construct a comprehensive PDDL domain following these requirements:\n"
    )

    for idx in range(len(action_list)):
        prompt += f"{action_list[idx]}\n"

    return prompt


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

#file_path = 'action_name_merge_list/wikihow/Air_Purification_and_Cleaning_Methods.json'
sufolders_path=list_subfolders("action_ger")
sufolders_path_name="../data/train"
i=0
def extract_pddl(action_list):
    #  PDDL 
    for action in action_list:
        action_pattern = re.compile(r'(\(:action\s[\w_]+.*?)(?=\(:action|\Z)', re.DOTALL)
        matches = re.findall(action_pattern, action)

        # 
        return matches

for floder_path in tqdm(sufolders_path,desc=""):
    prompt_list = []
    step_list=[]
    file_name=floder_path.split("/")[-1]
    folders_path_name=f"{sufolders_path_name}/{file_name}/{file_name}_train.json"
    file_path=file_path_list(floder_path)
    step_file=read_json(folders_path_name)
    for step in step_file:
        step_list.append(step["step"])
    action_path=os.path.basename(file_path[0])
    data_list=read_json(file_path[0])
    action_list = extract_pddl(data_list)
    prompt_dic = create_pddl_domain_prompt(action_list)
    result=gen_action(prompt_dic)
    prompt_list.append(result)
    path = f"domain/{file_name}"
    if not os.path.exists(path):
        os.makedirs(path)
    with open(f"{path}/{action_path}", 'w', encoding="utf-8") as file:
        json.dump(prompt_list, file, indent=4)

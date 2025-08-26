import json
import os

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

def create_prompt(action_name,action_list):
    #
    prompt = f"""
You're a professional AI, and you're able to combine multiple PDDL actions into one universal action. The merged action should:

Objective:
Combine multiple PDDL actions into a single universal action that is adaptable to a variety of tasks, capable of capturing and transforming the entity's state. The merged action should:

Generality: Use abstract parameters to adapt to a variety of tasks, avoiding being limited to specific types of actions.
State Change: Each action must clearly describe the state change, gradually transforming the entity's state until the goal state is reached.
Core Logic: Retain the core logic of preconditions and effects without unnecessary complexity.
Avoid Redundancy: Merge actions with similar effects to ensure simplicity and efficiency.
Logical Consistency: The merged action should maintain reasonable preconditions and effects in different contexts.

Guidelines:
Generality: The merged action should apply to multiple tasks, especially those involving checking, modifying, or creating. Ensure the use of abstract parameters to increase applicability.
State Change: The preconditions and effects of each action should clearly reflect the change in state. Through a series of actions, progressively transform the entity's state until the goal state is reached.
Simplicity: Avoid redundancy and ensure the merged action is simple and efficient by removing unnecessary complexity.
Logical Consistency: Each action should maintain consistent logic across different tasks, ensuring that the preconditions and effects are clear and reasonable.

Examples of actions you are given:

Action name after merge: check

Action sets that need to be merged:
"(:action check_bestseller_list ;  Check the bestseller list for book recommendations\n  :parameters (? npc - person ? book - book) \n
:precondition (and (available ? npc) (not (checked_list ? npc ? book)))\n
:effect (and (checked_list ? npc ? book))\n)\n\n\n\n\n\n"

(:action listen_to_member_secret ;  assign a member to keep track of loans and listen to their suggestions\n
:parameters (? leader - player ? member - player ? bc - book_club)\n
:precondition (and (in ? leader ? bc) (in ? member ? bc) (not (loan_tracker ? member ? bc)))\n      :effect (loan_tracker ? member ? bc))



The actions after the merger are:
(:action check ;  Check a resource and update task status
:parameters (? npc - person ? item - object)
:precondition (and (available ? npc) (not (checked ? npc ? item)))
:effect (checked ? npc ? item))


Here are our tasks

Action name after merge:{action_name}


Action sets that need to be merged:
"""
    #
    for action in action_list:
        prompt += action + "\n"
    prompt=prompt+"The actions after the merger are:"

    return prompt

def save_json(merge_dic,files):
    file=os.path.basename(files)
    file_name=os.path.basename(files).replace("_train.json","")
    file_path=f"merge_action_prompt/concept_data/{file_name}/"
    if not os.path.exists(file_path):
        os.makedirs(file_path)
    with open(file_path+f"{file}", 'w', encoding='utf-8') as file:
        json.dump(merge_dic,file,indent=4)


def main(file_path):
    #      （     ）
    #
    with open(file_path, 'r', encoding="utf-8") as file:
        action_name_list = json.load(file)
    action_merge_prompt = []
    for key, value in action_name_list.items():
        #
        action_names = create_prompt(key, value)
        action_merge_prompt.append(action_names)
    #
    save_json(action_merge_prompt,file_path)


action_name_path = "merge_action/concept_data"
action_file_path=file_path_list(action_name_path)
for action_file in action_file_path:
    main(action_file)
import json
import re

def load_and_extract_actions(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        data_list = json.load(file)
    return data_list
def extract_action_parameters(pddl_text):
    action_pattern = r"\(:action ([\w_]+).*?:parameters \((.*?)\)"
    matches = re.findall(action_pattern, pddl_text, re.DOTALL)
    action_params = {}

    for action_name, parameters in matches:
        param_list = parameters.strip().split()
        param_objects = {}
        for i in range(0, len(param_list), 3):  #  name - type
            param_name = param_list[i]
            param_type = param_list[i + 2]
            param_objects[param_name] = param_type
        action_params[action_name] = param_objects

    return action_params

# 
dic_list=[]
pddl_action_list=load_and_extract_actions("../build_domain/action_ger/wikihow/cluster_10_train.json")
for pddl_actions in pddl_action_list:
    extracted_parameters = extract_action_parameters(pddl_actions)
    dic_list.append(extracted_parameters)
    print(extracted_parameters)

# 
parameters_actions_dic={}
parameters_actions=[]
for datta in dic_list:
    for action, params in datta.items():
        print(f"Action: {action}")
        for param, obj_type in params.items():
            parameters_actions_dic[obj_type]="";
print(parameters_actions_dic)
"""
You are a PDDL expert specializing in extracting and instantiating objects. Your goal is to:
1. Use the provided `Object Pool` as a reference to match object types (e.g., "person", "book", "location").
2. Extract all objects mentioned in the given sentences.
3. Assign the correct type to each object based on the `Object Pool`. If an object matches multiple types, choose the most appropriate one based on the context.
4. Output the instantiated objects in JSON format. The object name should include both its type and a unique identifier (e.g., "person1", "book1").
5. Ensure that all types in the `Object Pool` are considered, even if some types do not appear in the given sentences.

### Object Pool:
{
  "person": "",
  "book": "",
  "bookclub": "",
  "environment": "",
  "agent": "",
  "library": "",
  "deal": "",
  "club_member": "",
  "npc": "",
  "system": "",
  "covering_tracks": "",
  "track": "",
  "player": "",
  "book_panel": "",
  "secret_society": "",
  "book_club": "",
  "location": "",
  "book_forum": "",
  "stove_knob": "",
  "velveeta": "",
  "character": "",
  "user1": "",
  "pen1": "",
  "snack": "",
  "book_themed": "",
  "helmet": ""
}

### Input:
"task": "How to Choose a Book for a Book Club",
        "step": [
            "Look at a bestseller list.",
            "Ask for a recommendation.",
            "Visit a few expert websites dealing with book clubs and book reviews.",
            "Find out what other book clubs are reading.",
            "Pick a book you have already read and enjoyed.",
            "Pick a book that goes with the theme of your book club.",
            "Most importantly, don't stress yourself."
        ]
### Output:
Return the instantiated objects in JSON format:
"""
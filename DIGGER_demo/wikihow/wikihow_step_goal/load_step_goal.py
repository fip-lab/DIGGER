import csv
import json

file_path="dev-data-reformatted-v4.json"
def csv_to_list_of_dicts(file_path):
    with open(file_path, mode='r', encoding='utf-8',errors='ignore') as file:
        list_of_dicts=json.load(file)
    return list_of_dicts
def generate_prompt(task):
    prompt = f"""
    You are provided with a structured dataset that includes the goal of a task, steps to achieve the goal, and information about entities and their state changes. Your task is to generate a PDDL domain file and a PDDL problem file from this dataset.
Instructions:
You must output only the PDDL domain file and PDDL problem file, without any additional explanation or description.
- The PDDL domain file must include a `:types` section to declare the types of entities.
- The domain must define all necessary predicates and actions.
- Each action in the PDDL domain file should be simple and map directly to one of the task steps.
- The PDDL problem file must specify the initial state of the entities and the goal state after completing all steps.

Guidelines for PDDL domain file:
1. For each step in the task, create an action with preconditions (state before) and effects (state after).
2. Use the format `(action-name ?entity ?attribute)` for actions.
3. Define preconditions using the entity's state before the action.
4. Define effects using the entity's state after the action.

Guidelines for PDDL problem file:
1. The initial state should list all entities and their starting states (from the first step).
2. The goal state should be the final desired state of the entities (after all steps have been performed).
here is task:
{task}
1. Generate a PDDL domain file with full domain definition, including `:types`, predicates, and actions.
2. Ensure each action corresponds directly to a step in the task and remains simple.
3. Generate a PDDL problem file with the initial state and the final goal state.
4. Output **only** the PDDL domain file and PDDL problem file.

Now, generate the PDDL domain file and PDDL problem file.output:

    """
    return prompt

list_of_dicts=csv_to_list_of_dicts(file_path)

prompt_list=[]
for task,detail in list_of_dicts.items():
    prompt = generate_prompt(detail)
    prompt_list.append(prompt)
with open("prompt_list.json", 'w', encoding='utf-8') as file:
    json.dump(prompt_list,file,indent=4)
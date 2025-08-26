import json
import os
from openai import OpenAI
from tqdm import tqdm

client = OpenAI()()


def generate_step(prompt):
    chat_completion = client.chat.completions.create(
        model="o1-mini",
        messages=[{"role": "user", "content": prompt}],
        # temperature=0.5
    )
    generated_text = chat_completion.choices[0].message.content
    print(generated_text)
    return generated_text


def generate_pddl_prompt_with_predicted_length(data):
    """
    Generates a prompt for producing PDDL planning steps based on the task, domain, examples, and predicted length.
    """
    prompt = f"""
You are a highly skilled AI assistant specializing in translating PDDL (Planning Domain Definition Language) actions into clear and actionable natural language instructions. 
Each PDDL action describes a specific task, and your goal is to provide a step-by-step guide that explains the task in a way that's easy for anyone to follow.
### Instructions:
1. Translate each PDDL step into a concise, easy-to-follow instruction, using natural language that matches a clear WikiHow-style format.
2. Each instruction should begin with a verb and include specific details about the task, the agent performing the task, and the objects involved.
3. Use relatable language and refer to the objects in ways that align closely with the task’s goal. Ensure that the object references are understandable and relevant to the task.
4. Make sure the instructions are informative yet straightforward, offering enough context to fully explain each action.
#5. Please note that the generated natural language sentences should be concise and direct, avoid being overly long or complex, and ensure that they conform to WikiHow style.
6. Please follow the format exactly as shown to maintain consistency and clarity across all steps.

### Key Points:
- **Action**: Describe the task in an actionable way, starting with a verb.
- **Agent**: Identify the person or role performing the action, avoiding technical jargon (e.g., instead of 'npc' or 'player', use natural terms like 'you' or 'the person').
- **Object**: Focus on providing clear, relatable details about the objects or elements involved in the task.

Input:
task_description:
{data["task"]}

Below are PDDL steps describing tasks with agents and objects. Translate each PDDL action into a clear, step-by-step, natural language sentence that is easy to follow. Add context or details where needed to ensure clarity.

PDDL steps:
{data["steps"]}

### Output Format:
Please use the format below strictly:

**Task**: [task description]
**Steps in Natural Language**:
1. [Step 1 in natural language, based on the first PDDL step]. 
2. [Step 2 in natural language, based on the second PDDL step].
...
n. [Final step in natural language, based on the last PDDL step].

**Similar Task Example**:
Here is an example of a similar task with its corresponding steps. Use this as a guide to ensure consistency and clarity in your translations.

**Task**: {data["similar_task"][0]['task']}
**Steps in Natural Language**:
{', '.join(data["similar_task"][0]['step'])}

Now, please generate the Natural Language version of the PDDL steps, following the given format and focusing on clarity, detail, and relatability of the object terms.
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
pddl_file_list = get_file_paths("../instantiating_action_4o_plan")
for pddl_file in tqdm(pddl_file_list, desc="  "):
    prompt_list = []
    file_name = os.path.basename(pddl_file)
    files_name = os.path.basename(pddl_file).replace(".json", "")
    pddl_list = read_json(pddl_file)
    for data in tqdm(pddl_list, desc="  "):
        generated_prompt = generate_pddl_prompt_with_predicted_length(data)
        print(generated_prompt)
        nl_step = generate_step(generated_prompt)
        data["nl_step"] = nl_step
        prompt_list.append(data)

    similar_path = f"instantiating_action_4o_plan_new_prompt/{files_name}"

    if not os.path.exists(similar_path):
        os.makedirs(similar_path)
    with open(f"{similar_path}/{file_name}", 'w', encoding='utf-8') as f:
        json.dump(prompt_list, f, ensure_ascii=False, indent=4)
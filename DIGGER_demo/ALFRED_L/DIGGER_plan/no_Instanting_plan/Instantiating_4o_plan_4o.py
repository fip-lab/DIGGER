import json
import os
import torch
from openai import OpenAI
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

client = OpenAI()

device = 'cuda' if torch.cuda.is_available() else 'cpu'
#device='cpu'
print(f"Using device: {device}")

# Sentence-BERTGPU
model_name='../../../result_bart-no_llm_goal'
model = AutoModelForSeq2SeqLM.from_pretrained(model_name).to(device)
tokenizer = AutoTokenizer.from_pretrained(model_name)

def generate_predictions(inputs):
    # CUDA
    inputs = tokenizer(inputs, return_tensors="pt", padding=True, truncation=True).to(device)

    # 
    outputs = model.generate(
        **inputs,
        max_new_tokens=100,
        num_beams=5,
        early_stopping=True,
        no_repeat_ngram_size=2
    )

    # 
    decoded_output = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return decoded_output
def generate_step(prompt):
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
    print(generated_text)
    return generated_text
def generate_pddl_prompt_with_predicted_length(task_description, instantiating_action, examples, goal_state, max_steplen):
    """
    Generates a prompt for producing PDDL planning steps based on the task, domain, examples, and predicted length.
    """
    prompt = f"""
You are a brilliant AI specialist in PDDL (Planning Domain Definition Language), tasked with generating strictly formatted PDDL planning steps for a new task.

## Task Description
Define the task objectives. Select appropriate actions from the provided instantiated action set and combine them logically to generate a series of steps that achieve the goal.

# Action Selection and Combination Guidance
1. **Select actions that support mission completion:** Choose only those actions that directly contribute to achieving the goal.
2. **Ensure alignment with task requirements:** Each action must be consistent with the mission requirements and drive the task toward its objective.
3. **Arrange actions in logical sequence:** Order the actions according to the complexity of the task and the dependencies between them.
4. **Consider dependencies:** Some actions may require the result or condition of a previous action. Ensure these dependencies are respected.
5. **Dynamically adjust based on progress:** Modify the sequence as necessary based on the current status of the task.
6. **Deeply consider various planning forms:** Use your self-judgment to choose the most appropriate steps that truly satisfy the task requirements.
7. **Ensure appropriateness:** When choosing an action, always consider current conditions to guarantee that each step is appropriate.
8.**Operability and specificity of the steps:**Emphasize that each step should be as specific and actionable as possible. For example, require each step to clearly identify a tool or material. This ensures that the generated steps are more realistic and avoids actions that are too abstract or vague.
### Note:
The provided Goal_state is for reference only and does not necessarily represent the correct or unique target state. The generated planning steps must ensure logical coherence and valid state changes, but they do not have to force the final state to exactly match the reference.

# Output Requirements:
1. **Strict PDDL Format:** Output only in PDDL, with no natural language descriptions or action definitions.
2. **Step Structure:** Each step must include an action name and the corresponding parameters.

# Step Constraint:
The plan should contain a maximum of {max_steplen} steps (±1-2 steps). If the goal has been partially accomplished, the generated plan can be appropriately reduced in the number of steps. Each step should effectively change the state of the entity, be concise and actionable, and move the task toward the final goal.
### Task:
{task_description}

### Goal_state (Reference Only):
{goal_state}

### Action set:
{instantiating_action}

### Example Workflow:
1.By learning examples of similar tasks, understand how to generate target steps and refer to their generated steps.
2.Logically combine operations to build a complete PDDL plan, ensuring that the sequence of steps drives tasks toward the end goal.Examples for Reference:
"""
    for examples in examples[task_description]:
        task = examples['task']
        steps_pddl = "\n   ".join(examples.get("steps_predictions", []))
        steps = "\n   ".join(examples.get("step", []))
        # entity=example_task['similar_entity']
        prompt += f"\n**Task**: {task}\n**Steps in Natural Language**:\n{steps}" \
                  f"\n**Planning Steps to pddl**:\n{steps_pddl}\n"
    prompt = prompt + f"\n Now, generate the PDDL planning step for task: {task_description}." \
                  f"\nOutput results in strict PDDL format. The output should contain only PDDL steps, each including the action name, corresponding parameters, and state changes."
    return prompt

def iterative_generate_pddl(task_description, instantiating_action, examples, goal_state):
    """
    Iteratively generates PDDL planning steps by building upon each previous step.

    """
    total_length = 0
    for example_task in examples[task_description]:
        steps = example_task['step']
        total_length += len(steps)
    predicted_length = total_length // 3
    prompt = generate_pddl_prompt_with_predicted_length(task_description, instantiating_action, examples, goal_state,max_steplen=predicted_length)
    print(prompt)
    new_step = generate_step(prompt)
    print(f"Generated Step : {new_step}")
    print(new_step)
    return new_step


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
class_name_path=get_file_paths("../Instanting/Instanting/similar_task")
for class_name in class_name_path:
    print(class_name)
    i=0
    file_name=os.path.basename(class_name)                      #
    instantiating_action=f"../Instanting/action_check/concept_data/action_data.json/action_data.json"
    data_list=read_json("../../data/test.json")
    similar_list = read_json(class_name)
    domain_list = read_json(instantiating_action)[0]
    print(instantiating_action)

    prompt_list = []
    for data in tqdm(similar_list, desc="Testing Iterative Generation"):
        task_description = next(iter(data))
        goal_state = generate_predictions('<GOAL>' + task_description + "<SEP>")
        # PDDL
        final_steps = iterative_generate_pddl(task_description, domain_list, data, goal_state)
        for d in data_list:
            if task_description==d["task"]:
                step=d["desc"]
        # prompt
        prompt_list.append({
            "step":step,
            "task": task_description,
            "goal_state": goal_state,
            "steps": final_steps,
            "similar_task": data[task_description]
        })
        i=i+1

    similar_path = f"instantiating_action_4o_plan/{file_name}"

    if not os.path.exists(similar_path):
        os.makedirs(similar_path)
    with open(f"{similar_path}/{os.path.basename(class_name)}", 'w', encoding='utf-8') as f:
        json.dump(prompt_list, f, ensure_ascii=False, indent=4)

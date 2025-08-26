import json
import os
import shutil
import subprocess


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
# 
def plan(floder_path):
        output_folder = f'plan/{os.path.basename(floder_path)}'
        # 
        if not os.path.exists(output_folder):
            os.makedirs(output_folder)
        problem_file=floder_path+"/problem.pddl"
        domain_file=floder_path+"/domain.pddl"
        plan_file = f'{os.path.basename(problem_file)}_plan.txt'
        plan_file_path = os.path.join(output_folder, plan_file)
        #  FastDownward
        fastdownward_command = [
            '../gpt_pddl/Alfred-partially-specified-tasks/downward/fast-downward.py',
            domain_file,
            problem_file,
            "--search", "astar(hmax())"
        ]
        #  FastDownward
        try:
            result = subprocess.run(fastdownward_command, check=True, stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
            print("Fast Downward Output:")
            print(result.stdout.decode())

            # 
            if os.path.exists("sas_plan"):
                shutil.move("sas_plan", plan_file_path)

            if result.stderr:
                print("Fast Downward Errors:")
                print(result.stderr.decode())

        except subprocess.CalledProcessError as e:

            print(f"Error executing Fast Downward:\n{e.stderr.decode()}")

            print(f"Full command output:\n{e.stdout.decode()}")

        # 
        if os.path.exists(plan_file_path):
            print(f"Plan file saved successfully at {plan_file_path}")
        else:
            print("Plan file was not generated.")
def create_prompt(folder_path):
    # 
    problem_file = folder_path + "/problem.pddl"
    domain_file = folder_path + "/domain.pddl"
    step_file = folder_path + "/step.json"

    #  PDDL 
    def read_pddl(file_path):
        with open(file_path, 'r', encoding="utf-8") as file:
            content = file.read()
        return content

    #  JSON 
    def read_json(file_path):
        with open(file_path, 'r', encoding="utf-8") as file:
            content = json.load(file)
        return content

    #  domain.pddl  problem.pddl 
    domain_content = read_pddl(domain_file)
    problem_content = read_pddl(problem_file)

    #  step.json 
    step_data = read_json(step_file)
    prompt=f"{step_data}+{domain_content}+{problem_content}"+"，domain，，"
    return prompt
file_path_list=list_subfolders("wikihow_plan")

for file_path in file_path_list:
        plan(file_path)

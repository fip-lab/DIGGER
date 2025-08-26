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
folder_path = 'proc2pddl_data'
subfolders = list_subfolders(folder_path)
for subfolder in subfolders:
    problem_file_list=[]
    path_name=os.path.basename(subfolder)
    domain_file=subfolder+"/domain.pddl"
    print(domain_file)
    file_list = file_path_list(subfolder)
    for file in file_list:
        if "problem" in file:
            problem_file_list.append(file)
    output_folder = f'plan/{subfolder}'
    # 
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    print(problem_file_list)
    for problem_file in problem_file_list:
        print(problem_file)
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
            result = subprocess.run(fastdownward_command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            #print("Fast Downward Output:")
            #print(result.stdout.decode())

            # 
            if os.path.exists("sas_plan"):
                shutil.move("sas_plan", plan_file_path)

            if result.stderr:
                print("Fast Downward Errors:")
                print(result.stderr.decode())


        except subprocess.CalledProcessError as e:

            print(f"Error executing Fast Downward:\n{e.stderr.decode()}")

            print(f"Full command output:\n{e.output.decode()}")

        # 
        if os.path.exists(plan_file_path):
            print(f"Plan file saved successfully at {plan_file_path}")
        else:
            print("Plan file was not generated.")
import csv
import json
import os
import re


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
def clean_task(task):
    cleaned_text = re.sub(r'[^A-Za-z]', ' ', task)
    # 
    cleaned_text = re.sub(r'\s+', ' ', cleaned_text).strip()
    return cleaned_text

# nl_list=["no_Instantiating_plan","Instanting_no_step_plan","instanting_entity_no_concept_plan","Instantiating_plan"]
nl_list=["deepseek_v3.json","gpt4.json","gpt4o.json"]
# nl_list=get_file_paths("other_plan/pddl_to_text")
for file in nl_list:
    # file_path_list=get_file_paths(f"{file}/pddl_to_text/instantiating_action_4o_plan_new_prompt")
    # data_list=[]
    # for file_path in file_path_list:
    #     data_list = data_list+read_json(file_path)
    data_list=read_json(f"other_plan/pddl_to_text/{file}")
    # Create a list of dictionaries for task and nl_step
    nl_lists = [{"task": data["task"], "nl_step": data["nl_step"]} for data in data_list]
    nl_lists = nl_lists[:10]
    print(nl_lists)
    file_path_name = os.path.basename(file).replace(".json","")
    for nl in nl_lists:
        print(nl["task"])
    file_path_name=file
    # Write to CSV file
    csv_file_path = f"nl_list"
    if not os.path.exists(csv_file_path):
        os.makedirs(csv_file_path)
    with open(f"{csv_file_path}/{file_path_name}.csv", 'w', newline='', encoding="utf-8") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=["task", "nl_step"])
        writer.writeheader()
        writer.writerows(nl_lists)

    print(f"CSV file saved at: {csv_file_path}")


with open("other_plan/pddl_to_text/clap.json",'r',encoding="utf-8")as file:
    data_list=json.load(file)
# Create a list of dictionaries for task and nl_step]
nl_list=[]
for data in data_list:
    if "concept_knowledge" not in "".join(data["clap_step"]):
        nl_list.append({"task": data["task"], "step": data["clap_step"]})
    else:
        nl_list.append({"task": data["task"], "step":[]})
# Write to CSV file
csv_file_path = "nl_list/clap.csv"
with open(csv_file_path, 'w', newline='', encoding="utf-8") as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=["task", "step"])
    writer.writeheader()
    writer.writerows(nl_list)

print(f"CSV file saved at: {csv_file_path}")

org_data=read_json(f"other_plan/pddl_to_text/open_pred_data.json")
# Create a list of dictionaries for task and nl_step
nl_lists = [{"task": data["title"], "nl_step": data["pred_step"]} for data in org_data]
file_path_name = "open_pred_data"
csv_file_path = f"nl_list"
if not os.path.exists(csv_file_path):
    os.makedirs(csv_file_path)
with open(f"{csv_file_path}/{file_path_name}.csv", 'w', newline='', encoding="utf-8") as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=["task", "nl_step"])
    writer.writeheader()
    writer.writerows(nl_lists)

import pandas as pd
import glob

# Excel
with pd.ExcelWriter("combined_output.xlsx") as writer:
    # csv
    csv_files = glob.glob("nl_list/*.csv")

    # CSV，Sheet
    for file in csv_files:
        # CSV
        df = pd.read_csv(file)
        # Sheet
        sheet_name = file.split("/")[-1].replace(".csv", "")  #
        # Sheet
        df.to_excel(writer, sheet_name=sheet_name, index=False)

print("CSVcombined_output.xlsx，Sheet。")

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

# # nl_list=["no_Instanting_plan","no_step_Instanting_plan","no_entity_Instanting_plan","plan_Instanting"]
# nl_list=get_file_paths("DIGGER_plan/other_plan/pddl_to_text")
# for file in nl_list:
#     # data_list = read_json(f"DIGGER_plan/{file}/pddl_to_text/instantiating_action_4o_plan_new_prompt/test.json")
#     data_list = read_json(file)
#     # Create a list of dictionaries for task and nl_step
#     nl_lists = [{"task": data["task"], "nl_step": data["nl_step"]} for data in data_list]
#     nl_lists = nl_lists[:10]
#     file_path_name = os.path.basename(file).replace(".json","")
#     # Write to CSV file
#     csv_file_path = f"nl_list"
#     if not os.path.exists(csv_file_path):
#         os.makedirs(csv_file_path)
#     with open(f"{csv_file_path}/{file_path_name}.csv", 'w', newline='', encoding="utf-8") as csvfile:
#         writer = csv.DictWriter(csvfile, fieldnames=["task", "nl_step"])
#         writer.writeheader()
#         writer.writerows(nl_lists)
#
#     print(f"CSV file saved at: {csv_file_path}")
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

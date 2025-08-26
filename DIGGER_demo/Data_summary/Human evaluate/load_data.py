import json
import os
import pandas as pd


def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list


def list_subfolders(folder_path):
    subfolders = []
    for item in os.listdir(folder_path):
        item_path = os.path.join(folder_path, item)
        if os.path.isdir(item_path):
            subfolders.append(item_path)
    return subfolders


#
file_path_list = file_path_list("new_file")
score_list = []

#       
for file_path in file_path_list:
    name_list = {}
    file_name = os.path.basename(file_path).replace(".xlsx", "")
    name_list[file_name] = []

    excel_data = pd.ExcelFile(file_path)
    sheet_names = excel_data.sheet_names

    #                    
    average_scores = {}
    average_pass_rates = {}
    sheet_lengths = {}

    for sheet_name in sheet_names:
        df = excel_data.parse(sheet_name)

        #              
        sheet_lengths[sheet_name] = len(df)

        #          
        score_columns = df.select_dtypes(include=['number']).columns

        #
        average_scores[sheet_name] = df[score_columns].mean().mean()

        #       'Unnamed: 2', 'Unnamed: 4', 'Unnamed: 6'
        pass_columns = ['Unnamed: 2', 'Unnamed: 4', 'Unnamed: 6']
        existing_pass_columns = [col for col in pass_columns if col in df.columns]

        #            
        if existing_pass_columns:
            pass_rates = [(df[col] == '√').mean() for col in existing_pass_columns]
            average_pass_rates[sheet_name] = sum(pass_rates) / len(pass_rates)

    #                 
    result_dict = {
        sheet_name: {
            'Average Score': average_scores[sheet_name],
            'Average Pass Rate': average_pass_rates.get(sheet_name, None),
            'Sheet Length': sheet_lengths[sheet_name]
        }
        for sheet_name in sheet_names
    }
    name_list[file_name].append(result_dict)
    score_list.append(name_list)
    print(result_dict)

#       JSON
with open("score_list.json", 'w', encoding="utf-8") as file:
    json.dump(score_list, file, indent=4, ensure_ascii=False)

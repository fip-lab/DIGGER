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
def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
def read_json_read(file_path):
    data_dic=read_json(file_path)
    for key,value in data_dic.items():
        data_dic[key]=round(data_dic[key], 3)
    return data_dic
get_file_path=list_subfolders("result")
weight_result_list=[]
length_dict={"ALFRED_L":69,"OPENPI_plan":6,"proc2pddl_plan":9,"wikihow_plan":42}
for file_path in get_file_path:
    all_data_list=[]
    save_path=file_path.split("/")[-1]
    file_path=file_path_list(file_path)
    for file in file_path:
        dict_temp = {}
        files = os.path.basename(file).replace(".json", "")
        length = length_dict[files]
        data = read_json(file)
        data["length"] = length
        dict_temp[files] = data
        all_data_list.append(dict_temp)
    print(all_data_list)
    all_metrics = set()  # 使用 set 来去除重复的指标名称
    for plan in all_data_list:
        for plan_name, metrics in plan.items():
            # 遍历每个计划中的每个指标，排除 'length' 键
            all_metrics.update([metric for metric in metrics.keys() if metric != 'length'])

    # 使用获取到的所有指标初始化 weighted_sums
    weighted_sums = {metric: 0 for metric in all_metrics}

    # 初始化 total_length 为 0
    total_length = 0

    # 遍历每个计划并计算加权和
    for plan in all_data_list:
        for plan_name, metrics in plan.items():
            length = metrics['length']
            total_length += length
            for metric, value in metrics.items():
                if metric != 'length':
                    weighted_sums[metric] += value * length

    # 计算加权平均
    # 计算加权平均并保留两位小数
    weighted_averages = {metric: round(weighted_sums[metric] / total_length, 3) for metric in weighted_sums}

    # 输出加权平均
    print(weighted_averages)
    weight_result_list.append({save_path:weighted_averages})
    with open(f"weight_result/{save_path}.json", "w", encoding="utf-8") as file:
        json.dump(weighted_averages, file, indent=4)


weight_result_list.append({"clap":read_json_read("../../other_plan/evaluate/evaluate_result/clap.json")})
weight_result_list.append({"org_step":read_json_read("../../other_plan/evaluate/evaluate_result/org_step.json")})


df = pd.DataFrame([plan[list(plan.keys())[0]] for plan in weight_result_list])

# Set the index to be the plan names
df.index = [list(plan.keys())[0] for plan in weight_result_list]
df.to_csv('plan_metrics.csv')

# Display the table
with open(f"weight_result.json", "w", encoding="utf-8") as file:
    json.dump(weight_result_list, file, indent=4)
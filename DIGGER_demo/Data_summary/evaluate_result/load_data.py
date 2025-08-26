import json
import os


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

all_data_list=[]
#         
wikihow_dic={}
wikihow_dic["wikihow"]=[]

file_path_list_name = file_path_list("../../evaluate_pred/evaluate_result")
data_list={}
for file_path in file_path_list_name:
    file_path_name=os.path.basename(file_path)
    data_list[file_path_name]={}
    data=read_json(file_path)
    data["length"]=42
    data_list[file_path_name]=data
wikihow_dic["wikihow"].append(data_list)
print(wikihow_dic)

wikihow_dic["ALFRED-L"]=[]

file_path_list_name = file_path_list("../../load_test_data/AFLRED-L/DIGGER_plan/evaluate/evaluate_result")
data_list={}
for file_path in file_path_list_name:
    file_path_name=os.path.basename(file_path)
    data_list[file_path_name]={}
    data=read_json(file_path)
    data["length"]=69
    data_list[file_path_name]=data
wikihow_dic["ALFRED-L"].append(data_list)

wikihow_dic["openpi"]=[]

file_path_list_name = file_path_list("../../load_test_data/openpi/DIGGER_plan/evaluate/evaluate_result")
data_list={}
for file_path in file_path_list_name:
    file_path_name=os.path.basename(file_path)
    data_list[file_path_name]={}
    data=read_json(file_path)
    data["length"]=6
    data_list[file_path_name]=data
wikihow_dic["openpi"].append(data_list)

wikihow_dic["prc2pddl"]=[]

file_path_list_name = file_path_list("../../load_test_data/prc2pddl/DIGGER_plan/evaluate/evaluate_result")
data_list={}
for file_path in file_path_list_name:
    file_path_name=os.path.basename(file_path)
    data_list[file_path_name]={}
    data=read_json(file_path)
    data["length"]=9
    data_list[file_path_name]=data
wikihow_dic["prc2pddl"].append(data_list)
all_data_list.append(wikihow_dic)
print(all_data_list)
with open("score_data.json",'w',encoding="utf-8")as file:
    json.dump(all_data_list,file,indent=4)
import json


def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content
all_list=[]
score_list=read_json("score_list.json")
for score in score_list:
    for key,value in score.items():
        all_list.append({key:value[0]["plan_Instanting"]})
print(all_list)
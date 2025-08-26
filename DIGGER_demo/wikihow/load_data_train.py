import json
import os


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

train_path=get_file_paths("data/train")
test_path=get_file_paths("data/test")
train_data=[]
test_data=[]
for path in train_path:
    train_data=train_data+read_json(path)
for path in test_path:
    test_data=test_data+read_json(path)
for train in train_data:
    for test in test_data:
        if(train["task"]==test["task"]):
            print(train["task"])
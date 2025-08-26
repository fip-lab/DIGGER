
import json
import os

from tqdm import tqdm

import json
import os
from datasets import load_dataset
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer
import torch
os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'

# 
test_dataset = load_dataset('json', data_files='ordering_an.json', split='train')
print(test_dataset)

model_name="result_bart-1000_no_llm"
model = AutoModelForSeq2SeqLM.from_pretrained(model_name).to('cuda')
tokenizer = AutoTokenizer.from_pretrained(model_name)

# 
def generate_predictions(inputs):
    #  inputs  cuda 
    inputs = tokenizer(inputs, return_tensors="pt", padding=True, truncation=True).to('cuda')

    # 
    outputs = model.generate(
        **inputs,
        max_new_tokens=100,
        num_beams=5,  # Beam search 
        early_stopping=True,  # 
        no_repeat_ngram_size=2  #  n-grams
    )

    # 
    decoded_output = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return decoded_output

# 
pre_list = []
predictions = []
for example in tqdm(test_dataset,desc=""):
    pre_dic = {}
    pre_dic['task'] = example['task']
    pre_dic['step'] = []
    pre_dic['steps_predictions'] = []  # 
    for step in example['step']:
        #  step 
        pre_dic['step'].append(step)
        pred = generate_predictions(step)
        predictions.append(pred)
        #print(":", step)
        #print(":", pred)

        # 
        pre_dic['steps_predictions'].append(pred)
    pre_list.append(pre_dic)
    # ，
    # 
    file_path = f"{pre_dic['file_name']}.json"
    with open(file_path, 'w') as file:
        json.dump(pre_list, file, indent=4)
#  JSON """
def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list


file_path = file_path_list("comet_data")
print(file_path)
count=0
file_path_name=""
for file in file_path:
    with open(file, 'r') as file:
        data = json.load(file)
        if len(data) > count:
            count=len(data)
            file_path_name=file
print(count)
print(file_path_name)
list_temp=[]
with open('data_merge.json', 'r') as file:
    data_list = json.load(file)
for data_name in tqdm(data,desc=""):
    for data_org in data_list:
        if data_name['step']==data_org['steps'] and data_name['cluster_label']==data_org['cluster_label']:
            if 'task' in data_org.keys():
                data_name['task']=data_org['task']
            else:
                data_name['task'] = data_org['title']
    list_temp.append(data_name)
with open('comet_data_no_llm.json', 'w') as file:
    json.dump(list_temp, file, indent=4)


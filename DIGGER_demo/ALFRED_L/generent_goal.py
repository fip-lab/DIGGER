import json
import os
from datasets import load_dataset
from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer
import torch
os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'

# 
#model_name="comet-bart-ai2-model"
#model_name="result_bart"
model_name="../result_bart-no_llm_goal"
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
predictions = []
#folder="comet_data_all_llm/cluster_use_data"
file_list=file_path_list("comet_data_all_llm")
for files in file_list:
    pre_list = []
    print(files)
    filename = os.path.basename(files)
    with open(files, 'r', encoding="utf-8") as file:
        dataset = json.load(file)
        for example in tqdm(dataset, desc=""):
            pre_dic = {}
            pre_dic['cluster_label'] = example["cluster_label"]
            cluster_label = example["cluster_label"]
            pre_dic['task'] = example['task']
            pre_dic['step'] = example["step"]
            pre_dic['steps_predictions'] = example["steps_predictions"]  # 
            steps = " ".join(example.get("steps_predictions", []))
            pre_dic['goal_state']=generate_predictions('<GOAL>'+pre_dic['task']+"<SEP>"+steps)
            pre_list.append(pre_dic)
            directory = f"comet_data_all_llm_goal/{filename}"
                # ，
            if not os.path.exists(directory):
                    os.makedirs(directory)
                # 
            file_path = f"{directory}/{filename}"

                # 
                    # ，
            with open(file_path, 'w') as file:
                    json.dump(pre_list, file, indent=4)
            #  JSON """
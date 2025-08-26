import json
import os

import requests
from collections import defaultdict

from tqdm import tqdm
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

model_name="../../comet-bart-ai2-model"
model = AutoModelForSeq2SeqLM.from_pretrained(model_name).to('cpu')
tokenizer = AutoTokenizer.from_pretrained(model_name)

# 
def generate_predictions(inputs):
    #  inputs  cuda 
    inputs = tokenizer(inputs, return_tensors="pt", padding=True, truncation=True).to('cpu')

    # 
    outputs = model.generate(
        **inputs,
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

def clean_data_concept(concept,rel):
    query = "{} {}".format(concept, rel)
    concept_data = generate_predictions(query)
    str = query + concept_data
    return str

def get_conceptnet_data(concept):
    data_list = []
    relations = ["ObjectUse", "MadeUpOf", "HasProperty", "CapableOf"]  # 

    # ，
    for rel in relations:
        data_list.append(clean_data_concept(concept, rel))

    return data_list

def load_data(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        return json.load(file)



def main():
    file_path=file_path_list("../../entity_data/similar_entity_data")
    for file in tqdm(file_path,desc=""):
        data_list=load_data(file)
        new_data_list=[]
        for data in tqdm(data_list, desc=""):
            for key, value in data.get("similar_entity", {}).items():
                comet_data = get_conceptnet_data(key)
                data["similar_entity"][key]["comet_knowledge"]=comet_data
            new_data_list.append(data)
        file_name=os.path.basename(file)
        filenames=f"entity_data/similar_entity_data/{file_name}"
        if not os.path.exists(filenames):
            os.makedirs(filenames)
        with open(f"{filenames}/{file_name}",'w',encoding="utf-8") as file:
            json.dump(new_data_list,file,indent=4)
main()
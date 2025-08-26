import json
import os

import requests
from collections import defaultdict

from tqdm import tqdm


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

def get_conceptnet_data(concept):
    print(concept)
    url = f"https://api.conceptnet.io/c/en/{concept}"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        return data
    else:
        print(f"Error: {response.status_code}")
        return None


def extract_best_relationships(data):
    concept_knowledge=[]
    if data:
        #  defaultdict 
        best_relationships = defaultdict(lambda: None)

        # 
        for edge in data.get('edges', []):
            weight = edge.get('weight', float('-inf'))  # 
            surface_text = edge.get('surfaceText', 'N/A')
            start_label = edge['start'].get('label', 'N/A')
            end_label = edge['end'].get('label', 'N/A')
            relation = edge['rel'].get('label', 'N/A')  # 
            if weight>2:
                # 
                if best_relationships[relation] is None or weight > best_relationships[relation]['weight']:
                    best_relationships[relation] = {
                        'start_label': start_label,
                        'end_label': end_label,
                        'surface_text': surface_text,
                        'weight': weight,
                        'relation': relation
                    }
        if not best_relationships is None:
            # 
            for relation, rel_data in best_relationships.items():
                concept_knowledge.append(rel_data["surface_text"])
    return concept_knowledge
def load_data(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        return json.load(file)



def main():
    file_path=file_path_list("comet_data_similar_entity_end")
    for file in tqdm(file_path,desc=""):
        data_list=load_data(file)
        new_data_list=[]
        for data in tqdm(data_list, desc=""):
            for key, value in data.get("similar_entity", {}).items():
                concept_data = get_conceptnet_data(key)
                concept_list=extract_best_relationships(concept_data)
                data["similar_entity"][key]["concept_knowledge"]=concept_list
            new_data_list.append(data)
        with open(file,'w',encoding="utf-8") as file:
            json.dump(new_data_list,file,indent=4)


main()
import json
import os

with open('entity_name.json', 'r', encoding="utf-8") as file:
    entity_list = json.load(file)

with open('dev-data-reformatted-v4.json', 'r', encoding="utf-8") as file:
    state_list = json.load(file)
# 

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
def search_goal_state(avw_dict_list):
    #  entity_list ： value[0][0]  entity_name
    entity_name_map = {}
    for key, entities in entity_list.items():
        for entity in entities:
            for entity_name, label_list in entity.items():
                entity_name_map[key] = entity_name  #  key  entity_name
    #print(entity_name_map)
    #  state_list ： entity_name  states
    state_map = {}
    for label, data in state_list.items():
        for state in data.get("states", []):
            entity_name = state.get("entity")
            if entity_name:
                state_map[entity_name] = state  #  entity_name  state
    #  avw_dict_list
    #print(state_map)
    state_avw_dict_list = []
    for avw_dict in avw_dict_list:
        temp_dict = avw_dict
        all_after_states = {}
        for key, value in avw_dict.get("similar_entity", {}).items():
            #  value[0][0]  entity_name
            entity_key = value
            if entity_key in entity_name_map:
                entity_name = entity_name_map[entity_key]

                #  state
                if entity_name in state_map:
                    state = state_map[entity_name]
                    # print(state["entity"])  #  entity
                    all_after_states[key] = {}
                    all_after_states[key][state["entity"]] = []
                    for step, changes in state['answers'].items():
                        for change in changes:
                            # 'after'
                            after_state = change.get('after', None)
                            if after_state:
                                all_after_states[key][state["entity"]].append({
                                    'attribute': change['attribute'],
                                    'before': change["before"],
                                    'after': after_state
                                })
                    #print(all_after_states)
                    temp_dict["similar_entity"] = all_after_states
                    #print(temp_dict)
        state_avw_dict_list.append(temp_dict)
    return state_avw_dict_list



file_path=["comet_data_similar_entity/train.json"]
for files in file_path:
    filename = os.path.basename(files)
    with open(files, 'r', encoding="utf-8") as file:
        avw_dict_list = json.load(file)
        state_avw_dict_list = search_goal_state(avw_dict_list)
        directory = f"comet_data_similar_entity_end"
        # ，
        if not os.path.exists(directory):
            os.makedirs(directory)
        #  JSON 
        new_file_path = f"{directory}/{filename}"
        with open(new_file_path, 'w', encoding='utf-8') as f:
            json.dump(state_avw_dict_list, f, ensure_ascii=False, indent=4)
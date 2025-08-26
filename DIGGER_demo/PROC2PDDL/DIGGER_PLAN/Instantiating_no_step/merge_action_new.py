import os
import re
import json
from collections import defaultdict
from scipy.spatial.distance import cosine
import spacy
from nltk.corpus import verbnet

#    spaCy
nlp = spacy.load("en_core_web_sm")



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

#    PDDL
def extract_pddl(text):
    """
       PDDL    。
    """
    action_pattern = re.compile(r'(\(:action\s[\w_]+.*?)(?=\(:action|\Z)', re.DOTALL)
    return re.findall(action_pattern, text)

#
def extract_action_names(actions):
    """
                  。
    """
    action_dict = {}
    for action in actions:
        name_match = re.search(r':action\s+([\w_]+)', action)
        if name_match:
            action_name = name_match.group(1)
            action_dict[action_name] = action
    #print("            ",action_dict)
    return action_dict

#       PDDL
def load_and_extract_actions(file_path):
    """
              PDDL   。
    """
    with open(file_path, 'r', encoding='utf-8') as file:
        data_list = json.load(file)

    actions_dict = {}
    for data in data_list:
        action_blocks = extract_pddl(data)
        print(action_blocks)
        if action_blocks:
            extracted_actions = extract_action_names(action_blocks)
            actions_dict.update(extracted_actions)
    return actions_dict
def save_json(merge_dic,files):
    file=os.path.basename(files)
    file_name=os.path.basename(files).replace("_train.json","")
    file_path=f"merge_action/concept_data/{file_name}/"
    if not os.path.exists(file_path):
        os.makedirs(file_path)
    with open(file_path+f"{file}", 'w', encoding='utf-8') as file:
        json.dump(merge_dic,file,indent=4)

#
def group_verbs_by_classes(verbs_with_classes):
    """
           。
    """
    class_to_verbs = defaultdict(list)
    for verb, classes in verbs_with_classes.items():
        for cls in classes:
            class_to_verbs[cls].append(verb)
    return class_to_verbs

#
def calculate_similarity(verb, category):
    """
                   。
    """
    verb_doc = nlp(verb)
    category_doc = nlp(category)
    return 1 - cosine(verb_doc.vector, category_doc.vector)

#
def choose_closest_category(verbs_to_categories):
    """
                 。
    """
    selected_categories = {}

    for verb, categories in verbs_to_categories.items():
        best_category = None
        best_similarity = -1

        for category in categories:
            category_clean = re.sub(r'[^a-zA-Z]+', '', category)
            similarity = calculate_similarity(verb, category_clean)
            if similarity > best_similarity:
                best_similarity = similarity
                best_category = category

        selected_categories[verb] = best_category

    return selected_categories

#
def merge_verbs_and_tasks(action_name_count, actions_name_lg, action_name_merge, actions):
    """
                    ，       ，          。
    """
    merged_data = {}
    merged_data_no_action = {}

    print(action_name_count)
    for class_verb, verb_list in action_name_merge.items():
        #
        max_verb = max(verb_list, key=lambda verb: action_name_count.get(verb, 0))
        action_list = []

        #             （     ）
        for verb in verb_list:
            action_list.extend([
                actions.get(task)
                for task, verb_lg in actions_name_lg.items()
                if verb_lg == verb
            ])

        merged_data[max_verb] = action_list
        merged_data_no_action[max_verb] = verb_list

    return merged_data, merged_data_no_action

#
def handle_unknown_verbs(unknown_verbs, actions_name_lg, actions):
    """
             ，         。
    """
    unknown_data = {}
    for unknown_verb in unknown_verbs:
        action_list = [
            actions.get(task)
            for task, verb_lg in actions_name_lg.items()
            if verb_lg == unknown_verb
        ]
        unknown_data[unknown_verb] = action_list
    return unknown_data

#
def main(file_path):
    """
         。
    """
    #
    actions = load_and_extract_actions(file_path)
    #
    actions_name_lg = {}
    action_name_count = {}
    action_name = {}

    for key, value in actions.items():
        #
        result = re.sub(r'_', ' ', key)
        name = result.split(" ")
        actions_name_lg[key] = name[0]

        #    VerbNet
        categories = verbnet.classids(name[0]) or ["unknown"]
        action_name[name[0]] = categories
        #
        action_name_count[name[0]] = action_name_count.get(name[0], 0) + 1

    print(action_name)
    #
    class_to_verbs = group_verbs_by_classes(action_name)
    print(class_to_verbs)
    #
    selected_categories = choose_closest_category(action_name)
    print(selected_categories)
    #
    action_name_merge = defaultdict(list)
    unknown_verbs = []

    for key, value in selected_categories.items():
        if value != 'unknown':
            matches = re.findall(r"\w+-(\d+)", value)
            if matches:  #
                match = matches[0]
                action_name_merge[match].append(key)
        else:
            unknown_verbs.append(key)

    #
    merged_data, merged_data_no_action = merge_verbs_and_tasks(
        action_name_count, actions_name_lg, action_name_merge, actions
    )

    #
    unknown_data = handle_unknown_verbs(unknown_verbs, actions_name_lg, actions)
    merged_data.update(unknown_data)


    save_json(merged_data,file_path)
    #
    print("Merged Data (with actions):", json.dumps(merged_data, indent=4))
    print("Merged Data (no actions):", json.dumps(merged_data_no_action, indent=4))

#
#file_name_path=list_subfolders("../build_end_domain/action")
file_path_list=file_path_list("../action_ger_no_step")
for file_path in file_path_list:
    main(file_path)

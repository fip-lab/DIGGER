from collections import defaultdict

import spacy
import json
import os
import re
import nltk
from scipy.spatial.distance import cosine
from nltk.corpus import verbnet
nlp = spacy.load("en_core_web_sm")
#  PDDL 
def extract_pddl(text):
    #  PDDL 
    action_pattern = re.compile(r'(\(:action\s[\w_]+.*?)(?=\(:action|\Z)', re.DOTALL)
    matches = re.findall(action_pattern, text)

    # 
    return matches


def extract_action_names(actions):
    action_dict = {}
    for action in actions:
        # 
        name_match = re.search(r':action\s+([\w_]+)', action)
        if name_match:
            action_name = name_match.group(1)
            action_dict[action_name] = action
    return action_dict


def load_and_extract_actions(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        data_list = json.load(file)
    actions_dict = {}
    for data in data_list:
        action_blocks = extract_pddl(data)
        if action_blocks:
            # 
            extracted_actions = extract_action_names(action_blocks)
            actions_dict.update(extracted_actions)

    return actions_dict
def group_verbs_by_classes(verbs_with_classes):
    class_to_verbs = defaultdict(list)
    for verb, classes in verbs_with_classes.items():
        for cls in classes:
            class_to_verbs[cls].append(verb)
    return class_to_verbs


def calculate_similarity(verb, category):
    # spaCy
    verb_doc = nlp(verb)
    category_doc = nlp(category)
    # 
    return 1 - cosine(verb_doc.vector, category_doc.vector)


# 
def choose_closest_category(verbs_to_categories):
    selected_categories = {}

    for verb, categories in verbs_to_categories.items():
        best_category = None
        best_similarity = -1

        # 
        for category in categories:
            category_clean = re.sub(r'[^a-zA-Z]+', '', category)
            similarity = calculate_similarity(verb, category_clean)
            if similarity > best_similarity:
                best_similarity = similarity
                best_category = category

        selected_categories[verb] = best_category

    return selected_categories


#  `load_and_extract_actions` 
file_path = 'action/wikihow/cluster_412_train.json'
actions = load_and_extract_actions(file_path)
print(actions)


# 
actions_name_lg = {}
action_name_count = {}
action_name = {}

# 
for key, value in actions.items():
    # 
    result = re.sub(r'_', ' ', key)
    name = result.split(" ")

    # 
    actions_name_lg[key] = name[0]

    #  VerbNet 
    categories = verbnet.classids(name[0]) or ["unknown"]
    action_name[name[0]] = categories

    # 
    action_name_count[name[0]] = action_name_count.get(name[0], 0) + 1

# 
print("Action Name Count:")
print(action_name_count)
print("\nAction Name (VerbNet Categories):")
print(action_name)
class_to_verbs = group_verbs_by_classes(action_name)
print(actions_name_lg)

selected_categories = choose_closest_category(action_name)

action_name_merge={}
unknown_list_verb=[]
for key, value in selected_categories.items():
    if(value!='unknown'):
        pattern = r"\w+-(\d+)"  # -，
        matches = re.findall(pattern, value)  # 
        match = matches[0]
        if match not in action_name_merge:
            action_name_merge[match] = []  # ，
        action_name_merge[match].append(key)  #  key 
    else:
        unknown_list_verb.append(key)
        continue
print(action_name_merge)


merged_data = {}
merged_data_no_action={}
# 
category_to_verbs = {}
for class_verb,verb_list in action_name_merge.items():
    action_list=[]
    max_count=0
    max_verb=""
    for verb in verb_list:
        verb_count = action_name_count.get(verb, 0)  # 
        if(verb_count>max_count):
            max_count=verb_count
            max_verb=verb
        for task, verb_lg in actions_name_lg.items():
            if(verb_lg==verb):
                action_value = actions.get(task)
                action_list.append(action_value)
    merged_data[max_verb]=action_list
    merged_data_no_action[max_verb] = verb_list
for unknown_verb in unknown_list_verb:
    action_list = []
    for task, verb_lg in actions_name_lg.items():
        if (verb_lg == unknown_verb):
            action_value=actions.get(task)
            action_list.append(action_value)
    merged_data[unknown_verb] = action_list
    merged_data_no_action[unknown_verb] = verb_list
print(merged_data)
print(merged_data_no_action)


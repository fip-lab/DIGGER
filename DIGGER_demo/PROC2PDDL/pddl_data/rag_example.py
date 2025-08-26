import json
import os
import re

from tqdm import tqdm
from transformers import BertTokenizer, BertModel
import torch
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
#  BERT 
tokenizer = BertTokenizer.from_pretrained('../../all-MiniLM-L6-v2')
model = BertModel.from_pretrained('../../all-MiniLM-L6-v2').to('cuda')
# 
def extract_actions_with_numbers(action_string):
    # 
    pattern = r"\(:action (\w+)\s*;?\s*([\d, ]*)"
    action_data = re.findall(pattern, action_string)

    # ，
    return {action: [int(num) for num in numbers.split(',') if num.strip()] for action, numbers in action_data}

    # [i]
def extract_references_as_dict(text):
    #  [i] ，
    pattern = r"(.*?)\[(\d+)\]"
    matches = re.findall(pattern, text)

    def remove_number_prefix(sentence):
        # 
        return re.sub(r"^\d+\.\s*", '', sentence).strip()

    # 
    return {int(num): remove_number_prefix(sentence) for sentence, num in matches}
def action_references(actions_dict,sentences_dict):
    action_to_sentences = {}
    for action, indices in actions_dict.items():
        # action
        action_to_sentences[action] = [sentences_dict[i] for i in indices]
    return action_to_sentences
def match_actions_to_sentences(actions, action_to_sentences, sentence_dict):
    result = {}
    for action in actions:
        # ， 'chop_wood'  'chop_wood person jungle wood'
        action_type = action.split(' ')[0]

        # 
        if action_type in action_to_sentences:
            sentence_ids = action_to_sentences[action_type]

            # 
            sentences = [sentence_dict[sentence_id] for sentence_id in sentence_ids if sentence_id in sentence_dict]

            # 
            result[action] = sentences

    return result


def extract_actions_as_list(pddl_text):
    #  :action ， .*? ，
    #  (:action ， ) 
    action_pattern = re.compile(r'(\(:action\s[\w_]+.*?)(?=\(:action|\Z)', re.DOTALL)

    #  action 
    actions = action_pattern.findall(pddl_text)

    #  action ，
    extracted_actions = [action.strip() for action in actions]

    #  action 
    for action in extracted_actions:
        print(action)

    return extracted_actions
# 
def sentence_to_steps_mapping(dictionary):
    # ， key， value
    sentence_to_steps = {}

    for step, sentences in dictionary.items():
        for sentence in sentences:
            # ，
            if sentence not in sentence_to_steps:
                sentence_to_steps[sentence] = []
            # 
            if step not in sentence_to_steps[sentence]:
                sentence_to_steps[sentence].append(step)

    return sentence_to_steps
def extract_floder_name(file_path):
    #  split  '/' 
    file_name = file_path.split('/')[-1]  # 
    #  "problem-"  ".pddl_plan.txt"
    #action_name = file_name.replace("submission_", "")
    return file_name
def extract_plan_name(file_path):
    #  split  '/' 
    file_name = file_path.split('/')[-1]  # 
    #  "problem-"  ".pddl_plan.txt"
    problem_name=file_name.replace("_plan.txt","")
    plan_name = file_name.replace("problem-", "").replace(".pddl_plan.txt","")
    return plan_name,problem_name
def list_subfolders(folder_path):
    subfolders = []
    # 
    for item in os.listdir(folder_path):
        item_path = os.path.join(folder_path, item)
        # 
        if os.path.isdir(item_path):
            subfolders.append(item_path)
    return subfolders

def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list


def read_file(file_path, encoding="utf-8"):
    """"""
    with open(file_path, 'r', encoding=encoding) as file:
        return file.read()


def extract_plan_lines(plan_file):
    """ plan ，"""
    plan_lines = []
    with open(plan_file, 'r', encoding="utf-8") as file:
        lines = file.readlines()
        lines = [line.replace('(', '').replace(')\n', '') for line in lines[:-1]]  # 
        plan_lines.extend(lines)
    return plan_lines


def action_sentences(folder_path, plan_file):
    """"""
    print(folder_path)

    # 
    folder_file_path = file_path_list(folder_path)

    # 
    sentences_data = next(read_file(f"{folder_file}", 'utf-8') for folder_file in folder_file_path if
                          f"{folder_path}/wikihow-" in folder_file)
    action_data = read_file(f"{folder_path}/action_step_map.txt")
    domain = read_file(f"{folder_path}/domain.pddl")

    # 
    plan_lines = extract_plan_lines(plan_file)
    actions_dict = extract_actions_with_numbers(action_data)
    domain_action = extract_actions_as_list(domain)
    sentences_dic = extract_references_as_dict(sentences_data)

    # 
    action_to_sentences = action_references(actions_dict, sentences_dic)
    plan_sentences = {}
    plan_sentences["action"]=[]
    # 
    for action in action_to_sentences.keys():
        for plan in plan_lines:
            if action in plan:
                plan_sentences[plan] = action
    #  domain 
    for action in domain_action:
        for plan in plan_lines:
            if plan_sentences.get(plan) and plan_sentences[plan] in action:
                plan_sentences["action"].append(action)
    plan_sentences["action"]=list(set(plan_sentences["action"]))
    print(plan_sentences)
    action_len_s=len(plan_sentences)
    # 
    matched_results = match_actions_to_sentences(plan_lines, actions_dict, sentences_dic)
    return matched_results,plan_sentences,action_len_s


#  BERT 
def get_sentence_embedding(sentence):
    inputs = tokenizer(sentence, return_tensors='pt', padding=True, truncation=True, max_length=64).to('cuda')
    with torch.no_grad():
        outputs = model(**inputs)
    #  token  ()
    embeddings = outputs.last_hidden_state.mean(dim=1).squeeze().cpu().numpy()  #  CPU  NumPy 
    return embeddings


def preprocess_pddl(pddl_str):
    # Remove lines starting with ';;' (comments)
    pddl_str = re.sub(r';;.*', '', pddl_str)
    # Remove non-ASCII characters
    pddl_str = re.sub(r'[^\x00-\x7F]+', '', pddl_str)
    return pddl_str

def tokenize(s):
    return re.findall(r'\(|\)|[^\s()]+', s)

def parse(tokens):
    if len(tokens) == 0:
        raise SyntaxError('Unexpected EOF')
    token = tokens.pop(0)
    if token == '(':
        L = []
        while tokens[0] != ')':
            L.append(parse(tokens))
            if len(tokens) == 0:
                raise SyntaxError('Unexpected EOF')
        tokens.pop(0)  # Remove ')'
        return L
    elif token == ')':
        raise SyntaxError('Unexpected )')
    else:
        return token

def find_goal(parsed):
    if isinstance(parsed, list):
        for item in parsed:
            if isinstance(item, list) and len(item) >= 2 and item[0] == ':goal':
                return item[1]
            else:
                result = find_goal(item)
                if result is not None:
                    return result
    return None

def extract_goal_conditions(pddl_problem):
    with open(pddl_problem,'r',encoding="utf-8") as file:
        pddl_content=file.read()
    clean_pddl = preprocess_pddl(pddl_content)

    # Tokenize and parse the PDDL content
    tokens = tokenize(clean_pddl)
    parsed = parse(tokens)
    goal_content = find_goal(parsed)
    print(goal_content)
    if goal_content[0] == 'and':
        conditions = goal_content[1:]
        conditions=reconstruct_expr(conditions)
    else:
        conditions = [goal_content]
        conditions=reconstruct_expr(conditions)
    return conditions
def reconstruct_expr(expr):
    if isinstance(expr, list):
        return '(' + ' '.join(map(reconstruct_expr, expr)) + ')'
    else:
        return expr








sentence_action_list = []
folder_path_list = list_subfolders("pddl_data")
#folder_path_list=["pddl_data/115168608"]
action_len=0
for folder_path in tqdm(folder_path_list,desc="RAG"):
    file_name = extract_floder_name(folder_path)
    plan_path = f"plan/proc2pddl_data/submission_{file_name}"
    plan_file_path = file_path_list(plan_path)

    for plan_file in plan_file_path:
        plan_name,problem_name = extract_plan_name(plan_file)
        matched_results, plan_sentences,action_len_s = action_sentences(folder_path, plan_file)
        #action_len=action_len_s+action_len
        problem_path=f"{folder_path}/problems/{problem_name}"
        goal_list=extract_goal_conditions(problem_path)
        # 
        selected_sentences = {}
        action_dic = {
            "task": plan_name,
            "step": [],
            "desc": [],
            "action": plan_sentences["action"],
            "goal_state":goal_list
        }

        for step, sentences in matched_results.items():
            action_dic["step"].append(step)

            # 
            step_embedding = get_sentence_embedding(step)

            # 
            sentence_embeddings = [get_sentence_embedding(sentence) for sentence in sentences if
                                   get_sentence_embedding(sentence).size != 0]

            if len(sentence_embeddings) == 0:
                continue

            try:
                # 
                sentence_embeddings = np.array(sentence_embeddings)
                similarities = cosine_similarity([step_embedding], sentence_embeddings).flatten()

                # 
                best_sentence_index = np.argmax(similarities)
                best_sentence = sentences[best_sentence_index]

                # 
                selected_sentences[step] = best_sentence

            except Exception as e:
                print(f"Error in computing similarity for step {step}: {e}")

        #  action_dic
        for step, best_sentence in selected_sentences.items():
            action_dic["desc"].append(best_sentence)
        action_dic["desc"]=list(set(action_dic["desc"]))
        #  action_dic 
        sentence_action_list.append(action_dic)
    print(action_len)
#  JSON 
with open("rag_all_data.json", 'w', encoding="utf-8") as file:
    json.dump(sentence_action_list, file, indent=4)
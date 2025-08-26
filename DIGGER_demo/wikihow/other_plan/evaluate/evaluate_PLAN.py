"""import json
import re

# 
with open("clap.txt", 'r', encoding="utf-8") as file:
    text_data = file.readlines()

task_list = []
for text in text_data:
    if "how to" in text:
        # 
        tasks = text.split("how to")
        tasks = ["how to" + task.strip() for task in tasks if task.strip()]

        # 
        task_description = tasks[0].split(".")[0] + "."
        steps = tasks[0].split(".")[1:]  # ，

        #  "Step" 
        clean_steps_org = [re.sub(r'^\s*Step\d*:?\s*', '', step).strip() for step in steps if step.strip()]

        # 
        steps_clap = tasks[1].split(".")[1:]  # ，

        clean_steps_clap = [re.sub(r'^\s*Step\d*:?\s*', '', step).strip() for step in steps_clap if step.strip()]
        task_list.append({"task": task_description, "steps": clean_steps_org, "clap_step": clean_steps_clap})

# 
for task in task_list:
    print(f": {task['task']}")
    print(":")
    for step in task["steps"]:
        print(step)
    print("Clap :")
    for step in task["clap_step"]:
        print(step)
    print("\n")

# JSON
with open("clap.json", "w", encoding="utf-8") as file:
    json.dump(task_list, file, indent=4, ensure_ascii=False)

print(":", task_list)"""
import json
import os
import re
import nltk
from nltk.translate.bleu_score import sentence_bleu, SmoothingFunction
from nltk.translate.meteor_score import meteor_score
from rouge import Rouge
from pycocoevalcap.cider.cider import Cider
from tqdm import tqdm

os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'
# 
# pip install nltk rouge pycocoevalcap

#  bert-score
# pip install bert-score

from bert_score import score as bert_score
model_name="../roberta-large"
def compute_bertscore(references, hypothesis):
    P, R, F1 = bert_score(hypothesis, references,model_type="roberta-large", lang='en', rescale_with_baseline=True)
    return {
        'BERTScore_P': P.mean().item(),
        'BERTScore_R': R.mean().item(),
        'BERTScore_F1': F1.mean().item()
    }

def read_json(file_path):
    with open(file_path, 'r', encoding="utf-8") as file:
        content = json.load(file)
    return content

def clean_data(nl_step):
    match = re.search(r"\*\*Steps in Natural Language\*\*:\n(.*)", nl_step, re.DOTALL)
    if match:
        steps = match.group(1).strip().split("\n")
        # （）
        steps = [re.sub(r'^\d+\.\s*', '', step) for step in steps]
        return steps
    return [nl_step]

# 
def tokenize_sentence(sentence):
    return nltk.word_tokenize(sentence)

#  BLEU 
def compute_bleu(references, hypothesis):
    # 
    if isinstance(references[0], str):
        references = [nltk.word_tokenize(reference) for reference in references]
    if isinstance(hypothesis, str):
        hypothesis = nltk.word_tokenize(hypothesis)

    #  BLEU ， method1
    bleu1 = sentence_bleu(references, hypothesis, weights=(1, 0, 0, 0), smoothing_function=SmoothingFunction().method1)
    bleu2 = sentence_bleu(references, hypothesis, weights=(0.5, 0.5, 0, 0),
                          smoothing_function=SmoothingFunction().method1)
    bleu3 = sentence_bleu(references, hypothesis, weights=(0.33, 0.33, 0.33, 0),
                          smoothing_function=SmoothingFunction().method1)
    bleu4 = sentence_bleu(references, hypothesis, weights=(0.25, 0.25, 0.25, 0.25),
                          smoothing_function=SmoothingFunction().method1)

    return bleu1, bleu2, bleu3, bleu4

#  METEOR 
def compute_meteor(references, hypothesis):
    # Ensure both references and hypothesis are tokenized lists
    references_tokenized = [nltk.word_tokenize(reference) for reference in references]
    hypothesis_tokenized = nltk.word_tokenize(hypothesis)

    return meteor_score(references_tokenized, hypothesis_tokenized)


#  ROUGE-L 
#  ROUGE-L 
def compute_rouge_f1(hypothesis, references):
    rouge = Rouge()
    #  hypothesis  references 
    if isinstance(references, list):
        references = " ".join(references)
    if isinstance(hypothesis, list):
        hypothesis = " ".join(hypothesis)

    scores = rouge.get_scores(hypothesis, references)
    return {
        'ROUGE-1': scores[0]['rouge-1']['f'],
        'ROUGE-2': scores[0]['rouge-2']['f'],
        'ROUGE-L': scores[0]['rouge-l']['f']
    }


#  CIDEr 
#  CIDEr 
def compute_cider(references, hypothesis):
    gts = {}  # 
    res = {}  # 

    # 
    all_references = references  # 

    for i in range(len(hypothesis)):
        res[i] = [hypothesis[i]]  # 
        gts[i] = all_references    # 

    #  CIDEr 
    scorer = Cider()

    #  CIDEr 
    score, scores = scorer.compute_score(gts, res)

    print("CIDEr Score:", score)
    return score


# 
# 
def evaluate_text(references, hypothesis):
    # 
    if isinstance(references, str):
        references = [references]
    #  BLEU-n
    bleu1, bleu2, bleu3, bleu4 = compute_bleu(references, hypothesis)

    #  METEOR
    meteor = compute_meteor(references, hypothesis)

    #  ROUGE F1 
    rouge_f1_scores = compute_rouge_f1(hypothesis, references)

    #  BERTScore
    bert_scores = compute_bertscore(references, [hypothesis])

    # ， ROUGE F1 
    return {
        'BLEU-1': bleu1,
        'BLEU-2': bleu2,
        'BLEU-3': bleu3,
        'BLEU-4': bleu4,
        'METEOR': meteor,
        'ROUGE-1-F1': rouge_f1_scores['ROUGE-1'],
        'ROUGE-2-F1': rouge_f1_scores['ROUGE-2'],
        'ROUGE-L-F1': rouge_f1_scores['ROUGE-L'],  #  F1 
        'BERTScore_P': bert_scores['BERTScore_P'],
        'BERTScore_R': bert_scores['BERTScore_R'],
        'BERTScore_F1': bert_scores['BERTScore_F1'],
    }
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


def compute_average_scores(scores_list):
    # 
    total_scores = {}
    #sorted_data_desc = sorted(scores_list, key=lambda x: x["average_scores"]["METEOR"], reverse=True)
    #print(sorted_data_desc)
    # ，0
    for score_key in scores_list[0].keys():
        total_scores[score_key] = 0

    # ， total_scores
    for scores in scores_list:
        for key, value in scores.items():
            total_scores[key] += value

    # 
    avg_scores = {key: value / len(scores_list) for key, value in total_scores.items()}
    return avg_scores

all_scores = []

data_list=read_json("../pddl_to_text/clap.json")
for pre_data in tqdm(data_list,desc=""):
    score_choose = []
    # 
    pre_step = " ".join(pre_data["steps"])
    org_step = " ".join(pre_data["clap_step"])
    # cider = compute_cider(org_data["step"], nl_step_data)
    if org_step:
        if "concept_knowledge" not in org_step:
            # 
            print(pre_step)
            print(org_step)
            scores = evaluate_text(org_step, pre_step)
            # pre_data["ROUGE-L"]=scores["ROUGE-L"]
            score_choose.append(scores)
            all_scores.append(scores)
            average_scores = compute_average_scores(score_choose)
            print("", average_scores)
    else:
        score={
            'BLEU-1': 0,
            'BLEU-2': 0,
            'BLEU-3': 0,
            'BLEU-4': 0,
            'METEOR': 0,
            'ROUGE-1-F1': 0,
            'ROUGE-2-F1': 0,
            'ROUGE-L-F1': 0,  #  F1 
            'BERTScore_P': 0,
            'BERTScore_R': 0,
            'BERTScore_F1': 0,
        }
        all_scores.append(score)
    # average_scores = compute_average_scores(score_choose)
#choose_data(all_scores)
average_scores = compute_average_scores(all_scores)
with open("evaluate_result/clap.json","w",encoding="utf-8")as file:
    json.dump(average_scores,file,indent=4)
print("", average_scores)

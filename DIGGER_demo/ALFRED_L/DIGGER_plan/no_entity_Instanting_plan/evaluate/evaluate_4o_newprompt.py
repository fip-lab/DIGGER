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
model_name="../../../roberta-large"
def compute_bertscore(references, hypothesis):
    P, R, F1 = bert_score(hypothesis, references, model_type="roberta-large", lang='en', rescale_with_baseline=True,
                          device='cpu')
    # P, R, F1 = bert_score(hypothesis, references,model_type="roberta-large", lang='en', rescale_with_baseline=True)
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
file_path_list=get_file_paths("../pddl_to_text/instantiating_action_4o_plan_new_prompt")
data_list=[]
for file_path in file_path_list:
    data=read_json(file_path)
    data_list=data+data_list
for pre_file in tqdm(data_list,desc=""):
    org_data=pre_file["step"]
    pre_data =pre_file["nl_step"]
    score_choose = []
    nl_step_data = clean_data(pre_data)
    if nl_step_data:
        scores = evaluate_text(" ".join(org_data), " ".join(nl_step_data))
        score_choose.append(scores)
        all_scores.append(scores)
    average_scores = compute_average_scores(score_choose)
    print("", average_scores)
average_scores = compute_average_scores(all_scores)
if not os.path.exists("evaluate_result"):
    os.makedirs("evaluate_result")
with open("evaluate_result/4o_new_prompt.json","w",encoding="utf-8")as file:
    json.dump(average_scores,file,indent=4)
print("", average_scores)
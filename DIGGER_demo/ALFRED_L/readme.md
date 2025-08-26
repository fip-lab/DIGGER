# WikiHow Task Processing Workflow

This document outlines the detailed steps for processing AFRLED-L tasks, from data preparation to model instantiation and evaluation, with a clear execution sequence.

## 1. Execute Dataset Partitioning Step

First, execute the following script for dataset partitioning:
- Run `[Partition_dataset.py](Partition_dataset.py)`.

Enter the **[pddl_data]** and **[pddl_data_step]* directories:
- Run `[domain_rag_example.py])`.
- Run `[generent_goal.py]`.
- Run `[generent_step.py]`.
- Supplement **step_pddl** and **goal_date**.

## 2. Execute Seed Steps

Start with **Seed** and execute the initial steps, supplementing entity attributes:
- Run `[glove_word.py]`.
- Run `[search-state.py]`.
- Run `[search_similar.py]`.

## 3. Supplement ConceptNet

Run `[ConceptNet.py]` to supplement ConceptNet.

## 4. Execute Prompt Generation

Enter Seed and run the following scripts to generate prompts:
- Run `[prompt-*.py]`.

## 5. Build Action

In **DIGGER-plan**, execute the following operations to build the Action:
- Run `action_ger.py` to build the corresponding **action**.

## 6. Execute Instantiation

In the **[Instanting]** directory under **new-Instanting**, execute the scripts in the following order:
- `merge-action-new.py`
- `merge_action_4o.py`
- `new_action.py`
- `check_action.py`

## 7. Execute Similar Tasks

Enter the **Instantiating** phase and execute the following:
1. Run `similar_task.py`.
2. Then, run `similar.py`.

## 8. Automatic Instantiation

Use the following scripts for automatic instantiation:
- Run `[similar.py]`.
- Run `[similar_task.py]`.
- Run `auto-instanting_gpt4o.py`.

## 9. Execute Final Instantiation Plan

Enter the **[Instantiting_plan]** directory and execute:
- `Instanting_4o_plan_4o.py`.

## 10. PDDL to Text

Use the following script to convert PDDL to text:
- Run `pddl_to_text_new_prompt.py`.

## 11. Evaluation

Enter the **evaluate** folder and execute the evaluation step:
- Run `evaluate_4o_newprompt.py`.

### 12. Ablation Study

The same steps apply to the ablation study.

### 13. Other Model Generation

Enter the **[other_plan]** directory and execute the generation operations sequentially.

### 14. LLM Evaluation

Enter the **llm-evaluate** folder and sequentially execute `llm_*.py` for large model evaluation.

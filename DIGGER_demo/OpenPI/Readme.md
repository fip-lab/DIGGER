# WikiHow Task Processing Workflow

This document outlines the steps for processing OpenPI tasks, from data preparation to model instantiation and evaluation, with a detailed execution sequence.

## 1. Execute Dataset Partitioning Step

First, execute the following script for dataset partitioning:
- Run `[Partition_dataset.py].

Enter the **[pddl_data_step](pddl_data_step)** directory:
- Run `[domain_rag_example.py]`.
- Run `[generent_goal.py]`.
- Run `[generent_step.py]`.
- Supplement **step_pddl** and **goal_date**.

## 2. Execute Steps in [entity]Seed

Start with **Seed** and execute the initial steps, supplementing entity attributes:
- Run `[glove_word.py]`.
- Run `[search-state.py]`.
- Run `[search_similar.py]`.

## 3. Supplement ConceptNet

Run `[ConceptNet.py]` to supplement ConceptNet.

## 4. Generate Prompt in Seed

Run `[prompt-*.py]` to generate the prompt.

## 5. Build Action

In **DIGGER-plan**, execute the following operations to build the Action:
- Run `action_ger.py` to build the corresponding **action**.

## 6. Execute Instantiation in [Instanting]new-Instanting

Execute the scripts in the following order:
- `merge-action-new.py`
- `merge_action_4o.py`
- `new_action.py`
- `check_action.py`
2. **Global List Processing**:
   - `similar_task.py`
   - `similar.py`
   - `global_entity.py`

## 7. Execute Similar Tasks

Enter the **Instantiating** phase:
1. Run `similar_task.py`.
2. Then run `similar.py`.

## 8. Automatic Instantiation

Use the following scripts for automatic instantiation:
- Run `[similar.py]`.
- Run `[similar_task.py]`.
- Run `auto-instanting_gpt4o.py`.

## 9. Execute Final Instantiation Plan

Enter the **[plan_Instanting]Instantiating** directory and execute:
- `Instanting_4o_plan_4o.py`.

## 10. PDDL to Text

Use the following script to convert PDDL to text:
- Run `pddl_to_text_new_prompt.py`.

## 11. Evaluation

Enter the **evaluate** folder and execute the evaluation step:
- Run `evaluate_4o_newprompt.py`.

### 12. Ablation Study

Execute the ablation study in a similar manner.

### 13. Other Model Generation

Enter the **[other_plan]** directory and generate sequentially.

### 14. LLM Evaluation

Enter the **llm-evaluate** folder and sequentially execute `llm_*.py` for large model evaluation.

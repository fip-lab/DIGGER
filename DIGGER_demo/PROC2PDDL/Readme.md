# PROC2PDDL Task Processing Workflow Documentation

## Overview
This document presents a comprehensive workflow for processing PROC2PDDL tasks, detailing the complete pipeline from dataset preparation to model evaluation. The structured process ensures efficient task transformation and analysis.

## Workflow Phases

### 1. Data Preparation Phase
**Objective**: Prepare and partition the initial dataset

1. **Dataset Partitioning**:
   - Execute `Partition_dataset.py` to divide the dataset

2. **PDDL Data Generation**:
   - Run `domain_rag_example.py` for domain-specific examples
   - Generate goals using `generate_goal.py`
   - Create steps with `generate_step.py`
   - Supplement PDDL representations for steps and goals

### 2. Entity Processing
**Objective**: Enhance entity representations

- **Entity Attribute Enhancement**:
  - Execute `glove_word.py` for word embeddings
  - Run `search-state.py` for state analysis
  - Process `search_similar.py` for similarity identification

### 3. Knowledge Graph Integration
- Execute `ConceptNet.py` to incorporate ConceptNet knowledge graph data

### 4. Prompt Engineering
- Generate system prompts using `prompt-*.py` scripts

### 5. Action Construction
**Objective**: Build executable actions in DIGGER-plan

- Execute `action_ger.py` to construct corresponding actions

### 6. Instantiation Process
**Objective**: Create concrete task instances

1. **Action Processing**:
   - `merge-action-new.py`
   - `merge_action_4o.py`
   - `new_action.py`
   - `check_action.py`

2. **Global List Processing**:
   - `similar_task.py`
   - `similar.py`
   - `global_entity.py`

### 7. Task Similarity Analysis
**Objective**: Identify and process similar tasks

- Execute `similar_task.py` and `similar.py` in Instanting phase

### 8. Automated Instantiation
- Run `similar.py` and `similar_task.py` for similarity analysis
- Execute `auto-instanting_gpt4o.py` for automatic instance generation

### 9. Final Instantiation Plan
- Run `Instantiing_4o_plan_4o.py` in Instantiting_plan directory

### 10. PDDL Conversion
- Execute `pddl_to_text_new_prompt.py` to convert PDDL to natural language

## Evaluation Framework

### 11. Primary Evaluation
- Execute `evaluate_4o_newprompt.py` in evaluate folder

### 12. Ablation Studies
- Conduct controlled experiments following similar evaluation procedure

### 13. Alternative Model Generation
- Process generation tasks in `other_plan` directory

### 14. LLM-based Evaluation
- Execute `llm_*.py` scripts in llm-evaluate folder for comprehensive assessment

## Execution Notes
- Maintain strict script execution order within each phase
- Verify output quality between stages
- Document any parameter adjustments for reproducibility
- Pay special attention to directory paths when moving between phases
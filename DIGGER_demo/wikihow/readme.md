# WikiHow Task Processing Workflow Documentation

## Overview
This document provides a structured workflow for processing WikiHow tasks, covering the complete pipeline from data preparation to model evaluation. The process is organized into logical phases with clear execution sequences.

## Workflow Phases

### 1. Data Preparation and Clustering
**Objective**: Organize and cluster the initial dataset

1. **Cluster Data Step**:
   - Execute `kmeans_bert.py` for text clustering
   - Run `load_data.py` to load processed data

2. **Step and Goal Generation**:
   - Generate goals using `generate_goal.py`
   - Create steps with `generate_step.py`
   - Supplement PDDL representations for steps and goals

### 2. Seed Processing
**Objective**: Enhance initial data with additional attributes

- **Entity Attribute Enhancement**:
  - Execute `qianruxiangliang.py` for vector embedding
  - Run `search-state.py` for state analysis
  - Process `search_similar.py` for similarity identification

### 3. Knowledge Graph Integration
- Execute `ConceptNet.py` to incorporate ConceptNet knowledge graph data

### 4. Prompt Engineering
- Generate system prompts using `prompt-*.py` scripts

### 5. Action Construction
**Objective**: Build executable actions

- Execute `action_ger.py` to construct corresponding actions

### 6. Instantiation Process
**Objective**: Create concrete task instances

1. **Action Merging**:
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

1. Execute `similar_task.py` and `similar.py` in Instanting phase
2. **Domain Prediction**:
   - `find_similar_task.py`
   - `similar_task.py` in predic_domain

### 8. Automated Instantiation
- Execute `auto-instanting_gpt4o.py` for automatic instance generation

### 9. Final Instantiation Plan
- Run `Instantiing_4o_plan_4o.py` to complete the instantiation process

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
- Execute `llm_*.py` scripts in llm-evaluate folder for large language model assessmen
# train_bart_multitask.py

import json
import os
import numpy as np
import torch
from rouge import Rouge
from torch.utils.data import ConcatDataset
from transformers import (
    AutoTokenizer,
    BartForConditionalGeneration,
    Trainer,
    TrainingArguments,
    DataCollatorForSeq2Seq,
)
from datasets import Dataset, DatasetDict
from steo_Dataset import GoalGenerationDataset, StepTranslationDataset
from sklearn.model_selection import train_test_split

# Initialize device
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

# Initialize tokenizer
tokenizer = AutoTokenizer.from_pretrained('../comet-bart-ai2-model')

# Add special tokens
special_tokens = {'additional_special_tokens': ['<GOAL>', '<STEP>', '<SEP>']}
num_added_toks = tokenizer.add_special_tokens(special_tokens)
print(f"Added {num_added_toks} special tokens.")

# Initialize the model
model = BartForConditionalGeneration.from_pretrained('../comet-bart-ai2-model')
model.resize_token_embeddings(len(tokenizer))
model.to(device)

# Define the compute_metrics function for ROUGE (optional)
# If you decide to keep it, ensure it's compatible with separate evaluations

# Define the preprocessing function
def preprocess_function(batch):
    """
    Preprocesses the dataset by tokenizing inputs and targets.
    """
    inputs = batch['input_text']
    targets = batch['target_text']

    model_inputs = tokenizer(
        inputs,
        max_length=32,
        padding='max_length',
        truncation=True,
    )

    # Tokenize targets
    with tokenizer.as_target_tokenizer():
        labels = tokenizer(
            targets,
            max_length=32,
            padding='max_length',
            truncation=True,
        )

    # Replace padding token id's in labels by -100
    labels['input_ids'] = [
        [(label if label != tokenizer.pad_token_id else -100) for label in labels_example]
        for labels_example in labels['input_ids']
    ]

    model_inputs['labels'] = labels['input_ids']

    return model_inputs

if __name__ == "__main__":
    # Function to read JSON files
    def read_json(file_path):
        with open(file_path, 'r', encoding="utf-8") as file:
            return json.load(file)

    # Read data from separate JSON files
    step_translation_data = read_json("step_data.json")
    goal_data = read_json("goal_state.json")

    print(f"Loaded {len(step_translation_data)} step translation samples.")
    print(f"Loaded {len(goal_data)} goal generation samples.")

    # Split each dataset into train, validation, and test sets
    step_train, step_temp = train_test_split(step_translation_data, test_size=0.2, random_state=42)
    step_val, step_test = train_test_split(step_temp, test_size=0.5, random_state=42)

    goal_train, goal_temp = train_test_split(goal_data, test_size=0.2, random_state=42)
    goal_val, goal_test = train_test_split(goal_temp, test_size=0.5, random_state=42)

    print(f"Step Translation - Train: {len(step_train)}, Val: {len(step_val)}, Test: {len(step_test)}")
    print(f"Goal Generation - Train: {len(goal_train)}, Val: {len(goal_val)}, Test: {len(goal_test)}")

    # Create Dataset instances with task-specific prefixes
    step_train_dataset = StepTranslationDataset(step_train)
    step_val_dataset = StepTranslationDataset(step_val)
    step_test_dataset = StepTranslationDataset(step_test)

    goal_train_dataset = GoalGenerationDataset(goal_train)
    goal_val_dataset = GoalGenerationDataset(goal_val)
    goal_test_dataset = GoalGenerationDataset(goal_test)

    # Optionally, check a few samples to ensure correctness
    print("Sample Step Translation Train Example:", step_train_dataset[0])
    print("Sample Goal Generation Train Example:", goal_train_dataset[0])

    oversampled_goal_train_dataset = ConcatDataset([goal_train_dataset] * 5)  # 
    combined_train_dataset = ConcatDataset([step_train_dataset, oversampled_goal_train_dataset])
    oversampled_goal_val_dataset = ConcatDataset([goal_val_dataset] * 5)
    combined_val_dataset = ConcatDataset([step_val_dataset, oversampled_goal_val_dataset])
    # Combine training and validation datasets for each task
    #combined_train_dataset = ConcatDataset([step_train_dataset, goal_train_dataset])
    #combined_val_dataset = ConcatDataset([step_val_dataset, goal_val_dataset])

    # Convert training and validation datasets to HuggingFace Datasets
    def convert_to_hf_dataset(concat_dataset):
        """
        Converts a PyTorch ConcatDataset to a HuggingFace Dataset.
        """
        all_input_texts = []
        all_target_texts = []

        for dataset in concat_dataset.datasets:
            for i in range(len(dataset)):
                sample = dataset[i]
                all_input_texts.append(sample['input_text'])
                all_target_texts.append(sample['target_text'])

        return Dataset.from_dict({
            'input_text': all_input_texts,
            'target_text': all_target_texts,
        })

    # Convert training and validation datasets
    hf_train_dataset = convert_to_hf_dataset(combined_train_dataset)
    hf_val_dataset = convert_to_hf_dataset(combined_val_dataset)

    # Tokenize training and validation datasets
    tokenized_train = hf_train_dataset.map(
        preprocess_function,
        batched=True,
        remove_columns=['input_text', 'target_text'],
        desc="Tokenizing Training Set"
    )

    tokenized_val = hf_val_dataset.map(
        preprocess_function,
        batched=True,
        remove_columns=['input_text', 'target_text'],
        desc="Tokenizing Validation Set"
    )

    # Create a DatasetDict for training and validation
    dataset = DatasetDict({
        'train': tokenized_train,
        'validation': tokenized_val
    })

    # Initialize data collator
    data_collator = DataCollatorForSeq2Seq(tokenizer, model=model)

    # Define training arguments
    training_args = TrainingArguments(
        output_dir='./results_bart_multitask',  # Output directory
        eval_strategy="epoch",                  # Updated parameter
        per_device_train_batch_size=8,          # Batch size for training
        per_device_eval_batch_size=8,           # Batch size for evaluation
        learning_rate=1e-4,  #  1e-6
        num_train_epochs=3,                     # Number of training epochs
        weight_decay=0.01,                      # Weight decay
        save_strategy="epoch",                  # Save checkpoints every epoch
        logging_dir='./logs_bart_multitask',    # Directory for logs
        logging_steps=10,                       # Log every 10 steps
        load_best_model_at_end=False,           # Disabled since compute_metrics is not used
        # Removed metric_for_best_model and greater_is_better
    )

    # Initialize the Trainer
    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_train,
        eval_dataset=tokenized_val,
        tokenizer=tokenizer,
        data_collator=data_collator,
        # compute_metrics=compute_metrics  # Removed since not needed
    )

    # Train the model
    trainer.train()

    # Evaluate on the validation set
    eval_results = trainer.evaluate()
    print(f"Validation Loss: {eval_results['eval_loss']}")

    # Save the trained model and tokenizer
    trainer.save_model("result_bart-no_llm_goal")
    tokenizer.save_pretrained("result_bart-no_llm_goal")
    print("Final model and tokenizer saved.")
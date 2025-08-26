# goal_Dataset.py

import torch
from torch.utils.data import Dataset

class StepTranslationDataset(Dataset):
    def __init__(self, data, tokenizer, max_len=128):
        self.data = data
        self.tokenizer = tokenizer
        self.max_len = max_len
        self.task_type = 'step'

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        input_text = self.data[idx]["Input"]
        output_text = self.data[idx]["Output"]

        # 
        input_text = "<STEP> " + input_text

        # 
        input_encoding = self.tokenizer(
            input_text, padding='max_length', truncation=True, max_length=self.max_len, return_tensors='pt'
        )
        output_encoding = self.tokenizer(
            output_text, padding='max_length', truncation=True, max_length=self.max_len, return_tensors='pt'
        )

        # 
        labels = output_encoding['input_ids'].squeeze()
        labels[labels == self.tokenizer.pad_token_id] = -100  # 

        return {
            'input_ids': input_encoding['input_ids'].squeeze(),
            'attention_mask': input_encoding['attention_mask'].squeeze(),
            'labels': labels,
            'task_type': self.task_type,
            'reference': output_text  # 
        }

class GoalGenerationDataset(Dataset):
    def __init__(self, data, tokenizer, max_len=128):
        self.data = data
        self.tokenizer = tokenizer
        self.max_len = max_len
        self.task_type = 'goal'

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        goal_text = self.data[idx]["goal"]
        steps = " ".join(self.data[idx]["step"])  # 
        goal_state = self.data[idx]["goal_state"]

        # 
        goal_text = "<GOAL> " + goal_text

        # ，
        output_text = steps + " <SEP> " + goal_state

        # 
        goal_encoding = self.tokenizer(
            goal_text, padding='max_length', truncation=True, max_length=self.max_len, return_tensors='pt'
        )

        # （ + ）
        output_encoding = self.tokenizer(
            output_text, padding='max_length', truncation=True, max_length=self.max_len, return_tensors='pt'
        )

        # 
        labels = output_encoding['input_ids'].squeeze()
        labels[labels == self.tokenizer.pad_token_id] = -100  # 

        return {
            'input_ids': goal_encoding['input_ids'].squeeze(),
            'attention_mask': goal_encoding['attention_mask'].squeeze(),
            'labels': labels,
            'task_type': self.task_type,
            'reference': output_text  # 
        }

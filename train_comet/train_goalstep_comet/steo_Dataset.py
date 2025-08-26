# goal_Dataset.py

from torch.utils.data import Dataset

class StepTranslationDataset(Dataset):
    def __init__(self, data, task_prefix='<STEP>'):
        self.data = data
        self.task_prefix = task_prefix

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        sample = self.data[idx]
        input_text = sample.get("Input", "")
        output_text = sample.get("Output", "")

        # Add task-specific prefix
        input_text = f"{self.task_prefix} {input_text}"

        return {
            'input_text': input_text,
            'target_text': output_text
        }

class GoalGenerationDataset(Dataset):
    def __init__(self, data, task_prefix='<GOAL>'):
        self.data = data
        self.task_prefix = task_prefix

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        sample = self.data[idx]
        goal_text = sample.get("goal", "")
        steps = " ".join(sample.get("step", []))  # Combine steps into a single string
        goal_state = sample.get("goal_state", "")

        # Add task-specific prefix
        input_text = f"{self.task_prefix} {goal_text} <SEP> {steps} "

        # Combine steps and goal state with a special separator
        target_text = f" {goal_state}"

        return {
            'input_text': input_text,
            'target_text': target_text
        }

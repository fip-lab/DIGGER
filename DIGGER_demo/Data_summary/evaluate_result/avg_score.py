import json
import pandas as pd

# Load JSON file
with open("score_data.json", 'r', encoding="utf-8") as file:
    score_data = json.load(file)

# Initialize dictionary to store weighted results for each model
weighted_results = {}

# Iterate over each dataset in the JSON data
for task in score_data:
    for task_name, models in task.items():
        model_data = models[0]  # Each dataset's model data is in the first item of the list

        for model_name, values in model_data.items():
            length = values["length"]

            # Initialize model entry if not already in weighted_results
            if model_name not in weighted_results:
                weighted_results[model_name] = {'Weighted Scores': {}, 'Total Length': 0}

            # Accumulate weighted scores for each metric and the total length
            for metric, score in values.items():
                if metric != "length":  # Exclude length from calculations here
                    # Initialize metric if not present
                    if metric not in weighted_results[model_name]['Weighted Scores']:
                        weighted_results[model_name]['Weighted Scores'][metric] = 0

                    # Add weighted score
                    weighted_results[model_name]['Weighted Scores'][metric] += score * length

            # Add the length for calculating the average later
            weighted_results[model_name]['Total Length'] += length

# Calculate the weighted average for each metric per model
final_results = {
    model_name: {metric: round(total / weighted_results[model_name]['Total Length'], 3)
                 for metric, total in scores['Weighted Scores'].items()}
    for model_name, scores in weighted_results.items()
}

# Convert the final results to a DataFrame
final_results_df = pd.DataFrame(final_results).T

# Display the DataFrame
print(final_results_df)

# Optionally save the result to a CSV file
output_file = "combined_weighted_scores.csv"
final_results_df.to_csv(output_file)
print(f"Results saved to {output_file}")

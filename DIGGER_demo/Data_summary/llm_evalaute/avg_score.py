import json
import pandas as pd

#    JSON
with open("load_data/score_data.json", 'r', encoding="utf-8") as file:
    score_data = json.load(file)

weighted_results = {}

#
for task in score_data:
    for task_name, models in task.items():
        model_data = models[0]  #

        for model_name, values in model_data.items():
            win_per = values["win_per"]
            length = values["length"]

            #
            if model_name not in weighted_results:
                weighted_results[model_name] = {'Weighted Win Sum': 0, 'Total Length': 0}

            #      win_per
            weighted_results[model_name]['Weighted Win Sum'] += win_per * length
            weighted_results[model_name]['Total Length'] += length

#
final_results = {
    model_name: round(data['Weighted Win Sum'] / data['Total Length'], 3)
    for model_name, data in weighted_results.items()
}

#
final_results_df = pd.DataFrame.from_dict(final_results, orient='index')

#
print(final_results_df)
with open("score_data.json",'w',encoding="utf-8")as file:
    json.dump(final_results,file,indent=4)

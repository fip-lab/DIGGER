import json
import pandas as pd

#    JSON   
with open("score_list.json", 'r', encoding="utf-8") as file:
    score_data = json.load(file)

#          
weighted_results = {}

#            
for task in score_data:
    task_name = list(task.keys())[0]  #        
    task_data = task[task_name][0]
    for d in task_data.values():#           
       task_length = d['Sheet Length']  #         

    #           
    for model_name, model_data in task_data.items():
        #              
        avg_score = model_data["Average Score"]
        avg_pass_rate = model_data["Average Pass Rate"]

        #                 
        if model_name not in weighted_results:
            weighted_results[model_name] = {'Weighted Score Sum': 0, 'Weighted Pass Rate Sum': 0, 'Total Length': 0}

        #           
        weighted_results[model_name]['Weighted Score Sum'] += avg_score * task_length
        weighted_results[model_name]['Weighted Pass Rate Sum'] += avg_pass_rate * task_length
        weighted_results[model_name]['Total Length'] += task_length
    print(task_length)

#             
final_results = {
    model_name: {
        'Weighted Average Score': round(data['Weighted Score Sum'] / data['Total Length'], 3),
        'Weighted Average Pass Rate': round(data['Weighted Pass Rate Sum'] / data['Total Length'], 3)
    }
    for model_name, data in weighted_results.items()
}

#        DataFrame     
final_results_df = pd.DataFrame.from_dict(final_results, orient='index')

#     
print(final_results_df)

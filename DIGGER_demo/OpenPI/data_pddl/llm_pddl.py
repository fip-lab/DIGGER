import json

from openai import OpenAI
from tqdm import tqdm

client = OpenAI()
gpt_result=[]
"""with open('prompt_list.json','r',encoding="utf-8") as file:
    prompt_list=json.load(file)"""
with open('prompt_wikihow_txt.json','r',encoding="utf-8") as file:
    prompt_list=json.load(file)
for prompt in tqdm(prompt_list,desc="："):
    chat_completion = client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": prompt}]
    )
    totol_completion_tokens = 0
    totol_prompt_tokens = 0
    totol_completion_tokens += chat_completion.usage.completion_tokens
    totol_prompt_tokens += chat_completion.usage.prompt_tokens
    generated_text = chat_completion.choices[0].message.content
    print(generated_text)
    gpt_result.append(generated_text)
print(gpt_result)
with open("wikihow_plan_txt_result.json",'w',encoding="utf-8")as file:
    json.dump(gpt_result,file,indent=4)
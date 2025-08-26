import os
import torch
from tqdm import tqdm
from transformers import AutoTokenizer, AutoModelForCausalLM
import json
import re

# 
torch.cuda.empty_cache()
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
os.environ['PYTORCH_CUDA_ALLOC_CONF'] = 'max_split_size_mb:128'

#  tokenizer
tokenizer = AutoTokenizer.from_pretrained("codellama/CodeLlama-7b-Instruct-hf")
model = AutoModelForCausalLM.from_pretrained("codellama/CodeLlama-7b-Instruct-hf", torch_dtype=torch.float16,
                                             device_map="auto")

# 
pddl_data = [
    "gotolocation agent1 garbagecan1 desk1",
    "pickupobjectnoreceptacle agent1 alarmclock1 desk1",
    "gotolocation agent1 desk1 sofa1",
    "putobjectinreceptacle agent1 alarmclock1 sofa1"
]


# 
def postprocess_text(text):
    # ，
    cleaned_text = text.split("Output:")[-1].strip()  #  Output 
    return cleaned_text


# 
output_data = []

for pddl_action in tqdm(pddl_data, desc="Processing PDDL actions"):
    # 
    prompt_text = (
        f"According to these words to write a sentence, the requirement is not more than 15 words, can be less than 15 words, but the overall output can only be written that sentence, other information do not output\n"
        f"Input: {pddl_action}\n"
        "Output:"
    )

    input_ids = tokenizer.encode(prompt_text, return_tensors="pt").to(device)
    attention_mask = torch.ones(input_ids.shape, device=device)
    max_gen_len = 150
    prompt_len = input_ids.shape[-1]

    # 
    generated_ids = model.generate(
        input_ids,
        attention_mask=attention_mask,
        max_length=prompt_len + max_gen_len,
        pad_token_id=tokenizer.eos_token_id,
        num_return_sequences=1,
        temperature=0.7,
        top_p=0.9,
        no_repeat_ngram_size=2
    )

    generated_text = tokenizer.decode(generated_ids[0], skip_special_tokens=True)

    # 
    cleaned_output = postprocess_text(generated_text)
    output_data.append({
        "pddl_action": pddl_action,
        "natural_language_description": cleaned_output
    })

#  JSON 
output_json = json.dumps(output_data, indent=4)

# 
print(output_json)

# 
with open("generated_output.json", "w") as f:
    f.write(output_json)

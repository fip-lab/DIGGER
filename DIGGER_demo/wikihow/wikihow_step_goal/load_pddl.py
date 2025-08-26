import json
import os

def find_matching_paren(text, start):
    """
    
    """
    stack = []
    for i in range(start, len(text)):
        if text[i] == '(':
            stack.append('(')
        elif text[i] == ')':
            stack.pop()
            if not stack:
                return i + 1  # 
    return -1

def extract_pddl(text):
    # 
    domain_start = text.find("(define (domain")
    if domain_start == -1:
        print("")
        return
    domain_name_start = domain_start + len("(define (domain")
    domain_name_end = text.find(")", domain_name_start)
    domain_name = text[domain_name_start:domain_name_end].strip()

    # 
    domain_path = os.path.join("wikihow_plan", domain_name)
    if not os.path.exists(domain_path):
        os.makedirs(domain_path)

    # 
    domain_end = find_matching_paren(text, domain_start)
    domain_content = text[domain_start:domain_end]

    # 
    problem_start = text.find("(define (problem")
    if problem_start == -1:
        print(f": {domain_name}")
        return
    problem_end = find_matching_paren(text, problem_start)
    problem_content = text[problem_start:problem_end]

    # 
    domain_filename = os.path.join(domain_path, "domain.pddl")
    problem_filename = os.path.join(domain_path, "problem.pddl")

    # 
    with open(domain_filename, 'w') as domain_file:
        domain_file.write(domain_content)

    # 
    with open(problem_filename, 'w') as problem_file:
        problem_file.write(problem_content)

    print(f": {domain_filename}")
    print(f": {problem_filename}")
    return domain_path
# JSON
with open("pddl_result.json", 'r', encoding="utf-8") as json_file:
    data_list = json.load(json_file)
with open("dev-data-reformatted-v4.json", 'r', encoding="utf-8") as file:
    step_list = json.load(file)
count=1
for data in data_list:
    domain_path=extract_pddl(data)
    with open(f"{domain_path}/step.json", 'w', encoding="utf-8") as file:
        json.dump(step_list[f"{count}"],file,indent=4)
    count=count+1

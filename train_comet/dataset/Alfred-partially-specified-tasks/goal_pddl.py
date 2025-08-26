import os
import re
import random
from collections import defaultdict

def parse_pddl_file(pddl_file):
    with open(pddl_file, 'r') as file:
        content = file.read()
    # 
    pattern = r'\((\w+) - (\w+)\)'
    objects_dict = dict(re.findall(pattern, content))

    # 
    location_dict = {}
    lines = content.strip().split("\n")
    for line in lines:
        match = re.search(r'\(objectAtLocation (\w+) (\w+)\)', line)
        if match:
            object_name = match.group(1)
            location = match.group(2)
            location_dict[object_name] = location

    return objects_dict, location_dict


def generate_goal_state_9(init_state):
    objects = list(init_state.keys())
    obj1=objects[0]
    obj2=objects[1]
    obj3=objects[2]
    #  obj2 ， obj1 
    obj2_location = init_state[obj2]
    obj1_location=init_state[obj1]
    # 
    goal_state_9 = [
        f"(objectAtLocation {obj2} {obj2_location})",  # obj2 
        f"(objectAtLocation {obj1} {obj2_location})"  # obj1  obj2 
    ]
    goal_state_22 = [
        f"(objectAtLocation {obj2} {obj1_location})",  # obj2 
    ]
    return obj1, obj2, goal_state_9,obj3

def generate_goal_state_10(init_state):
    objects = list(init_state.keys())
    loct_dict=defaultdict(list) #,[]
    obj1_location=""     #，
    for objs,loc in init_state.items():#
        loct_dict[loc].append(objs)
    for loc in loct_dict.keys():
        if len(loct_dict[loc])==2:
            obj1_location=loc
            for i in loct_dict[loc]:              #
                objects.remove(i)
            continue
    obj1=objects[0]                 #
    obj2=objects[1]
    #  obj2 ， obj1 
    # 
    goal_state_10 = [
        f"(objectAtLocation {obj1} {obj1_location})",  # 
    ]
    return obj1,goal_state_10,obj2,obj1_location
def generate_goal_state_11(init_state):
    objects = list(init_state.keys())
    loct_dict=defaultdict(list) #,[]
    obj1_location=""     #，
    for objs,loc in init_state.items():#
        loct_dict[loc].append(objs)
    for loc in loct_dict.keys():
        if len(loct_dict[loc])==3:
            print(loc)
            print(loct_dict[loc])
            obj1_location=loc
            for i in loct_dict[loc]:              #
                objects.remove(i)
            continue
    obj1=objects[0]                 #
    obj2=objects[1]
    #  obj2 ， obj1 
    # 
    goal_state_11 = [
        f"(objectAtLocation {obj1} {obj1_location})",  # 
    ]
    return obj1,goal_state_11,obj2,obj1_location
def generate_goal_state_12(init_state):
    objects = list(init_state.keys())
    loct_dict=defaultdict(list) #,[]
    obj1_location=""     #，
    max_count=0          #
    for objs,loc in init_state.items():#
        loct_dict[loc].append(objs)
    for loc in loct_dict.keys():
        if len(loct_dict[loc])>max_count:
            max_count=len(loct_dict[loc])
            obj1_location=loc
    print(loct_dict[obj1_location])
    for i in loct_dict[obj1_location]:              #
        objects.remove(i)
    obj1=objects[0]                 #
    obj2=objects[1]
    #  obj2 ， obj1 
    # 
    goal_state_12 = [
        f"(objectAtLocation {obj1} {obj1_location})",  # 
    ]
    return obj1,goal_state_12,obj2,obj1_location


#，，。。
def generate_goal_state_13(obejcts,init_state):
    obj_list=[]
    reobj_dict = defaultdict(list)  # , []
    obj_dict=defaultdict(list)
    obj1_location = ""  # ，
    reobj1_location=""  #
    max_len=0           #
    # 
    for obj, loc in init_state.items():
        obj_dict[loc].append(obj)
        if obejcts[obj]=="receptacle" and obejcts[loc] == "receptacle":
            reobj_dict[loc].append(obj)
    #print(reobj_dict)
    for reobj,reobj_list in reobj_dict.items():                 #object
        for reobj_name in reobj_list:
            obj_dict[reobj].remove(reobj_name)
            obj_dict[reobj]=obj_dict[reobj]+obj_dict[reobj_name]
        if len(obj_dict[reobj]) >max_len:
            max_len=len(obj_dict[reobj])
            obj1_location=reobj
            reobj1_location=reobj_list[0]
    """print(obj_dict)
    print(obj1_location)
    print(reobj1_location)
    print(init_state)"""
    for robj,obj in init_state.items():
        if obejcts[robj] == "object":
            obj_list.append(robj)
    #print(obj_list)
    for obj in obj_dict[obj1_location]:
        obj_list.remove(obj)
    obj1 = obj_list[0]  # 
    obj2 = obj_list[1]  #
    #print(obj2)
    #  obj2 ， obj1 
    goal_state_13 = [
        f"(objectAtLocation {obj1} {obj1_location})",  # 
        f"(not (objectAtLocation {obj1} {reobj1_location}))"      #
    ]

    return obj1, goal_state_13,obj2,obj1_location,reobj1_location

def generate_goal_state_14(obejcts,init_state):    #
    obj_list=[]
    reobj_dict = defaultdict(list)  # , []
    obj_dict=defaultdict(list)
    obj1_location = ""  # ，
    reobj1_location=""  #1
    reobj2_location = ""  # 2
    max_len=0           #
    obj_top=""          #
    # 
    print(init_state)
    for obj, loc in init_state.items():
        obj_dict[loc].append(obj)
        if obejcts[obj]=="receptacle_object" and obejcts[loc] == "receptacle":            #
            for a,b in init_state.items():
                if obejcts[a]=="receptacle_object" and obj==b:                    #,
                    reobj_dict[loc].append(obj)
                    reobj_dict[b].append(a)
                    reobj1_location=obj
                    reobj2_location=a
                    obj1_location=loc
    print(reobj_dict)
    print(reobj1_location,reobj2_location)
    #print(obj_dict)
    #print(obj1_location)
    #print(reobj1_location)
    #print(init_state)
    for robj,obj in init_state.items():
        if obejcts[robj] == "object":
            obj_list.append(robj)
    print(obj_list)
    for obj in obj_dict[reobj2_location]:
        obj_top=obj
        obj_list.remove(obj)
    print(obj_list)
    obj1 = obj_list[0]  # 
    obj2 = obj_list[1]  #
    #  obj2 ， obj1 
    # 
    goal_state_14 = [
        f"(objectAtLocation {obj1} {obj1_location})",  # 
        f"(objectAtLocation {obj_top} {obj1_location})" ,#
        f"(not (objectAtLocation {obj1} {reobj1_location}))" ,     #
        f"(not (objectAtLocation {obj1} {reobj2_location}))",
        f"(not (objectAtLocation {obj_top} {reobj1_location}))",
        f"(not (objectAtLocation {obj_top} {reobj2_location}))"
    ]
    print(goal_state_14)
    return obj1, goal_state_14,obj2,obj1_location,reobj1_location
def generate_goal_state_22(init_state):
    objects = list(init_state.keys())
    obj1=objects[0]
    obj2=objects[1]
    obj3=objects[2]
    #  obj2 ， obj1 
    obj1_location=init_state[obj1]
    # 
    goal_state_22 = [
        f"(objectAtLocation {obj2} {obj1_location})",  # obj2 
    ]
    return obj1, obj2, goal_state_22,obj3
def write_pddl_problem(problem_name, objects, init_state, goal_state,location):
    output_folder="problem_new/problem_9"
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    with open(f"{output_folder}/{problem_name}.pddl", "w") as file:
        file.write(f"(define (problem {problem_name})\n")
        file.write("  (:domain put_task)\n")  # 
        file.write("  (:objects\n")
        #file.write("agent1 - agent")
        for obj, typ in objects.items():
            file.write(f"    {obj} - {typ}\n")
        file.write("  )\n\n")
        file.write("  (:init\n")
        file.write(f"    (atLocation agent1 {location})\n")
        for obj, loc in init_state.items():
            file.write(f"    (objectAtLocation {obj} {loc})\n")
        file.write("  )\n\n")

        file.write("  (:goal\n")
        file.write("    (and\n")
        for goal in goal_state:
            file.write(f"      {goal}\n")
        file.write("    )\n")
        file.write("  )\n")
        file.write(")\n")
def file_path_list(folder_path):
    file_path_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_path_list.append(file_path)
    return file_path_list

def main(pddl_file,count):
    objects, init_state = parse_pddl_file(pddl_file)

    print("Objects:")
    for obj, typ in objects.items():
        print(f"{obj} - {typ}")

    print("\nInitial State:")
    for obj, loc in init_state.items():
        print(f"{obj} at {loc}")

    obj1, obj2,goal_state,obj3 = generate_goal_state_9(init_state)
    problem_name_9 = f"put_{obj1}_next_to_{init_state[obj2]}_Do_not_move_{obj2}_{count}"   #9
    #obj1,goal_state,obj2,location= generate_goal_state_10(init_state)    #10
    #problem_name_10=f"move_{obj1}_to_{location}_with_two_object_{count}"
    #obj1,goal_state,obj2,location= generate_goal_state_11(init_state)    #11
    #problem_name_11=f"move_{obj1}_to_{location}_with_three_object_{count}"
    #obj1,goal_state,obj2,location= generate_goal_state_12(init_state)    #12
    #problem_name_12=f"move_{obj1}_to_{location}_with_more_object_{count}"
    #obj1,goal_state,obj2,location,reobj_location= generate_goal_state_13(objects,init_state)    #13
    #problem_name_13=f"put_{obj1}_on_the_{location}_Do_not_put_it_in_{reobj_location}_{count}"
    #obj1, goal_state, obj2, location, reobj_location= generate_goal_state_14(objects, init_state)  # 14
    #problem_name_14 = f"put_{obj1}_on_the_{location}_Do_not_put_it_in_{reobj_location}_{count}"
    #obj1, obj2,goal_state,obj3 = generate_goal_state_22(init_state)
    #problem_name_22 = f"put_{obj2}_to_{init_state[obj1]}_{count}"   #22
    goal_state_str="\n".join(goal_state)
    #，
    print(init_state)
    location_init=init_state[obj2]
    print(f"\nGenerated Goal State:\n{goal_state_str}")
    print(f"\nProblem Name: {problem_name_9}")
    write_pddl_problem(problem_name_9, objects, init_state, goal_state,location_init)


if __name__ == "__main__":
    init_file_list=file_path_list('golden_init/scene9')
    count=1
    for init_file in init_file_list:
        if ".json" not in init_file:
            print(init_file)
            main(init_file,count)
            count=count+1


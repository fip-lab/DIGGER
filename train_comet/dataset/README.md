## Alfred Partially Specified Tasks

`For Alfred Partially Specified Tasks, there was initially no proper problem documentation and natural language description`

`There are only different initial states in different scenarios`

`I studied different tasks in different scenarios, and further constructed problem files suitable for different scenarios, and then successfully ran them and got the planning results.`

The data set includes the data from the original data set, as well as my process of processing the data and raising questions to the successful construction plan;

First, build different problem files for different scenarios in `python goal_pddl.py`;

Then plan the build planning step by using fast downward, `python plan.py`

Execute` python load_goall.py `to build the training set of comet-Goal for comet training

Execute `python text-to-plan.py` through the model to generate a correspondence between the planning step and the natural language form

# For Proc2PDDL

There are 27 fields in the original text, and each field has corresponding domain files and problem files. However, we found that the planning success rate was not high during the planning, so we made modifications manually, and finally 81 tasks could be successfully executed.

In this dataset, `proc2pddl_plan.py` is executed for planning, and `load_goal.py` is used to build the training set of comet-goal

`rag_example.py `can contribute to building a training set for comet-step

# For OpenPI

Originally, OpenpI had only entity and natural language statements. I translated 55 pieces of data into PDDL form using natural language and entity plus a large model (GPT-4o). 

Finally, I built 55 fields and successfully planned on 55 fields, with one planning task for each field.

`llm_pddl.py` is a domain file that uses GPT-4o to build Pddl. 

Our plan runs `fast downward `in the planner;

`load_goal_comet.py i`s for training comets-goal;

`wikihow_plan_text.py `is for training comet-step
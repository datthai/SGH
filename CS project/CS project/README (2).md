# SGH

**How to run a project with a benchmark strategy **

In the directory ...\CS-AUT\software\PROCSS_SIMULATION\process\codes\ there is a model code 
decision_engine.sas (100% acceptance), which should be modified by the student. This code refers to 
directory of subdirectories ...\CS-AUT\software\PROCSS_SIMULATION\process\calibration\, in which 
there are configuration files of built models, which the students should also replace with new ones 
built by them. In each folder of the model there is the most important code called scoring_code.sas, 
which by the %include statement is included in the code decision_engine.sas. In this code, the entire 
processed month is scored with four models, adding not only the values of scores, but also the 
probability values of modelled events. Finally, the final datastep at the end of this code calculates the 
correct rules by defining the final acceptance decisions and the reasons for the rejects. 
The whole process starts with the batch.bat file from the directory ...\CS
AUT\software\PROCSS_SIMULATION\codes\. The batch command refers to the code 
all_contents.sas. The final report with financial indicators is made in the folder ...\CS
AUT\software\PROCSS_SIMULATION\process\reports\ and is named profit_1975_1987.html. 

**How to calibrate models for PD and PR and how to determine cut-off 
points  **

If all models are already built, there can be more than four. Each model, with its code 
scoring_code.sas, should be copied to the appropriate subdirectory in the directory ...\CS
AUT\software\PROCSS_SIMULATION\process\calibration\. The folder also contains the code 
calibration.sas, which shows how to determine the probabilities of modelled events and how to 
determine the appropriate cut-off points on a standard strategy. Many codes should be commented 
on here. The basic idea of determining the PD or PR parameter is to run the appropriate logistic 
procedure with the outest = beta option, and then copy from the beta dataset their values to the 
formula with the exp() function in the appropriate place. Setting cut-off points is an interesting 
challenge. You can approach this task with one or two products. In the second case, the rank 
procedure is used and various groups of applications are analysed for the first and second product 
based on probability parameters. 

**Model construction and documentation **

The model should be built on a properly selected sample. Always build on data from the period 1975
87 (condition in SAS 4GL '197501'<=period<='198712'), and on properly selected product criteria 
(type product='css' or product='ins') and decision (decision='A'). In case of Python the same criteria 
should be used. ABT variables are built only on the basis of information about accepted customer 
applications in the process, and thus only on approved credit histories by our process, this may cause 
a bias of estimation and model building that takes place on a portfolio that was otherwise accepted. 
Each processed strategy creates a set of abt_app.sas7bdat in the directory ...\CS
AUT\software\PROCSS_SIMULATION\process\data\, which should then be copied to the appropriate 
modelling directory, e.g. to ...\CS-AUT\software\ASB_SAS\inlib\ or to …\CS
AUT\software\ASB_PYTHON\. The selection of the initial strategy for building the model is one of the 
tasks of this stage. 
The final model with its parameterization files and reports should be copied to many appropriate 
places: 
1. Copy the correct files to the processing directory of the new strategy, i.e. in case of PD INS 
model, to ...\CS-AUT\software\PROCSS_SIMULATION\process\calibration\model_ins_risk\. 
2. Copy to the appropriate structures as in the directory ...\CS
AUT\materials_all\example_of_project_documentation\. 
3. Modify the file model_documentation_PD_INS.xlsx, which is the defence material from the 
folder ...\sas_cs_en\project\example_of_project_documentation\example_of_model\ or use 
a proper Python code to get the same documentation form like in case of building by Python, 
see directory …\CS
AUT\materials_all\example_of_project_documentation\example_of_model_PYTHON\.

**Strategy building and documentation **

At the beginning, you need to collect all models, place the codes for scoring in the appropriate 
folders and perform calibration. Then define the correct rules and save them in the 
decision_engine.sas code. The rule "998 not active customer" must not be changed. Rules may be 
time-dependent, may be more or less complicated, as long as they are based on available 
information at the time of application, i.e. based on data from ABT and probabilities from models. 
After starting processing, copy the result files to the directory as in the example ...\CS
AUT\materials_all\example_of_project_documentation\example_of_strategy\ 

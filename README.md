#### Course Project for Getting and Cleaning Data course

#####This is the description how the R script achives the course Project's goal, and creates two described data sets. (Specification step 4 and 5)

- used package: dplyr
- functins: run_analysis, load_data, create_save_result:

**run_analysis** 
 
- parameterless function
- Responsibility: Results a dataset what was the target of the specification step 4 through the 1-4 steps. 
- Dependency (calling) chain: load_data

**load_data**: 

- function with one parameters: *data_type*: string, can be "test" or "train" 
- Responsibility: Load, combine and label the dataset in the given subset. 
- Presumption: the input data files are in the same folder structure as in the specification zip.
- Dependency (calling) chain: NA

**create_save_result**

- function with two parameters:
  - *data*: input dataset in an appropriate form (see specification step 4, the output of the run_analysis) 
  - *filename*: the output file name 
- Responsibility: Create a dataset due to the specification step 5 and save it to the given file, the location is the setted working directory.
- Dependency (calling) chain: run_analysis

**usage example**
- source("run_analysis.R")
- create_save_result(run_analysis(),"getdata_010_courseproject.txt")

 

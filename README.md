README

--------------------------------------------------------------------
Cleaning and Tidying Data Course Project
01 April 2017
---------------------------------------------------------------------


As part of the course project for Cleaning and Tidying Data, a set of files collected by SMARTLAB was given to students to tidy and manipulate.
The original data files contained a set of measurements using an accelerometer and gyrometer  acros 561 variables, for 30 different subjects for 6 different activities.
Repeated measurements were made for different subjects for each activity. The data was originally placed in two different files. As per instructions the two different sets of data , test and train have been combined.

The combined data set was further reduced to give the two following txt files. 

In the file 'Data_set_mean_std_variables.txt' , all the 'mean' and 'standard deviations' of the different variables have been recorded for each subject for each activity. The activity label, which is a number is present
along with the name of the activity, in the column 'activity_name'. Each of the column names identify which variable measurement is being recorded (eg. tBodyForceAccmeasurement X) , and which particular manipulations 
has been performed 'mean' for the mean and 'std' for the standard deviation. This file is the result of Step 3 and 4. 


In the file 'Data_set_mean_of_activity_and_subject.txt', all of the data in the previous file, was averaged across each subject for each activity. the first column describes for which subject, and the second for which activity, 
the average is being performed. This file is the final result of Step 5


For ease of use, csv files have also been provided

__________________________________________________________________________________

How the code works

__________________________________________________________________________________


The code first reads in the datasets for the 'train' and 'test' files for the variables and the subject. The code reads in the 'features.txt' file then
to assign column names to all the variables. The subject column and activity column are assigned their own names. A final row bind is perfoemd to join the two sets.
The activity labels assigned to each activity number is also read in at this stage


In Step 2 a search is perfoemd for coumn labels with std or mean in them, and a new data frame with only these variables is created

In Step 3, a new column with activity names is created using the original assignment created in step 1.

Step 4 has been taken care of in Step 1 itself, by the assignment of the column names

In Step 5, the data frame is melted along the subject id and the activity name. An average is then perfomed of all other variables along this list and then produced

In Step 6, both data frames are outputted, the end result after Step 4 (Data_set_mean_std_variables.txt) and the result after Step 5 (Data_set_mean_of_activity_and_subject.txt). 

csv analogues of the txt files are also generated




README file for the project of Getting and cleaning data 
=========================================================

This repo link contains the following
1. R script run_analysis.R
2. Code book which gives details of all the variables in the tidy data (final data after running the R script)

R script details:
------------------

The R script run_analysis.R accomplishes the following:
   1.Merges the training and the test sets to create one data set.
   2.Extracts only the measurements on the mean and standard deviation for each measurement. 
   3.Uses descriptive activity names to name the activities in the data set
   4.Appropriately labels the data set with descriptive variable names. 
   5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and 

Assumptions made by the R script
---------------------------------

1. All the data that is required has already been downloaded and is present in the working directory in the same folder structure as
provided in the project assignment assignment instructions. That is the data needs to be downloaded from the following link and unzipped 
using any suitable method

        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

   The script is run from the working directory where the UCI HAR Dataset folder is accessible.

2. The dplyr package and its dependants are installed and available.
       -----

How to reconstruct the data frame from the output txt file uploaded in the assignment
--------------------------------------------------------------------------------------

Though this is not relevant for the github link, it relates to the assignment. Hence, duplicating this information.

Use the following commands to get the tidy dataframe from the text file uploaded


    > mydata<- read.table("./myoutput.txt",header-TRUE,stringsAsFactors-F,fill-T)
    > head(mydata)


Code Book details:
-------------------
Codebook provides details on how the raw data was transformed to get the final tidy data.


 




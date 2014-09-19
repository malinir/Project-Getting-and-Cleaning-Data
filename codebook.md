Code Book.md

Data set for Human activity recognition using smartphones
==========================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


The raw data available at the following link had 561 features the readings for which were stored in the X files. (Xtrain and Xtest).
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
This project assignment involved getting the average value for the mean and standard deviation measurements for each of the subject per activity.



The task of getting average values of each feature measurement for a specific subject-activity pair involved the following steps:

Step 1> Combining the training set and the test set to form one large dataset.(xtrain + xtest)
------

    merged data= xtrain + xtest

    ------------------
    |                |
    |   Xtrain       |
    ------------------
    |   Xtest        |
    ------------------


Step 2> Selecting only the required columns after naming the columns based on the feaure.txt
-------


    subset(merged data)=66 columns selected out of (Xtrain + Xtest)

    --------------                ----------------------
    |Feature info|               |Feature info          |
    --------------                ----------------------
    |            |               | Merged data of test  |
    |   Xtrain   |   ========>   | and training         |
    --------------               |                      |    
    |   Xtest    |               ------------------------
    --------------


Step 3> Combining the subject and activity data to the merged data set.
------
    ________________________________
    |Feature info|Subject |Activity|
    --------------------------------
    |            |        |        |
    |   Merged   |subtrain|acttrain|
    -------------------------------|
    |   Data     |subtest |acttest |
    --------------------------------

    

   
Step 4> Naming the activity labels appropriately to indicate the action like walking, standing etc.
------

Step 5> Grouping based on the subject and activity and getting the average values of each of the feature.
-------



   ----------------------------------------------------------------
   | Subject|Activity|Feature1 avg| Feature2Avg|...|Feature 66 avg|
   ---------------------------------------------------------------
   | 1      |STANDING|   xxxx     |    yyyy    |   |              |  
   | :      |        |            |            |   |              |
   ----------------------------------------------------------------



Feature Selection 
------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
anotherlow pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
 fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Out of all the 561 variables available, only 66 variables have been selected as required by the project assignment. These 66 variables are the mean and 
standard deviation. The angle related and mean frequency related variables have been left out from the raw dataset.

Variables for this project
--------------------------

Given below are all the variables (68 columns with Subject and Activity) that are present in the final data set. The subject and activity together form the key.


 1    Subject 
 2    Activity 
 3    Avg-tBodyAcc-mean()-X
 4    Avg-tBodyAcc-mean()-Y 
 5    Avg-tBodyAcc-mean()-Z 
 6    Avg-tGravityAcc-mean()-X 
 7    Avg-tGravityAcc-mean()-Y 
 8    Avg-tGravityAcc-mean()-Z 
 9    Avg-tBodyAccJerk-mean()-X 
 10   Avg-tBodyAccJerk-mean()-Y 
 11   Avg-tBodyAccJerk-mean()-Z 
 12   Avg-tBodyGyro-mean()-X 
 13   Avg-tBodyGyro-mean()-Y 
 14   Avg-tBodyGyro-mean()-Z 
 15   Avg-tBodyGyroJerk-mean()-X 
 16   Avg-tBodyGyroJerk-mean()-Y 
 17   Avg-tBodyGyroJerk-mean()-Z 
 18   Avg-tBodyAccMag-mean() 
 19   Avg-tGravityAccMag-mean() 
 20   Avg-tBodyAccJerkMag-mean() 
 21   Avg-tBodyGyroMag-mean() 
 22   Avg-tBodyGyroJerkMag-mean() 
 23   Avg-fBodyAcc-mean()-X 
 24   Avg-fBodyAcc-mean()-Y 
 25   Avg-fBodyAcc-mean()-Z 
 26   Avg-fBodyAccJerk-mean()-X 
 27   Avg-fBodyAccJerk-mean()-Y 
 28   Avg-fBodyAccJerk-mean()-Z 
 29   Avg-fBodyGyro-mean()-X 
 30   Avg-fBodyGyro-mean()-Y 
 31   Avg-fBodyGyro-mean()-Z 
 32   Avg-fBodyAccMag-mean() 
 33   Avg-fBodyBodyAccJerkMag-mean() 
 34   Avg-fBodyBodyGyroMag-mean() 
 35   Avg-fBodyBodyGyroJerkMag-mean() 
 36   Avg-tBodyAcc-std()-X 
 37   Avg-tBodyAcc-std()-Y 
 38   Avg-tBodyAcc-std()-Z 
 39   Avg-tGravityAcc-std()-X 
 40   Avg-tGravityAcc-std()-Y 
 41   Avg-tGravityAcc-std()-Z 
 42   Avg-tBodyAccJerk-std()-X 
 43   Avg-tBodyAccJerk-std()-Y 
 44   Avg-tBodyAccJerk-std()-Z 
 45   Avg-tBodyGyro-std()-X 
 46   Avg-tBodyGyro-std()-Y 
 47   Avg-tBodyGyro-std()-Z 
 48   Avg-tBodyGyroJerk-std()-X 
 49   Avg-tBodyGyroJerk-std()-Y 
 50   Avg-tBodyGyroJerk-std()-Z 
 51   Avg-tBodyAccMag-std() 
 52   Avg-tGravityAccMag-std() 
 53   Avg-tBodyAccJerkMag-std() 
 54   Avg-tBodyGyroMag-std() 
 55   Avg-tBodyGyroJerkMag-std() 
 56   Avg-fBodyAcc-std()-X 
 57   Avg-fBodyAcc-std()-Y 
 58   Avg-fBodyAcc-std()-Z 
 59   Avg-fBodyAccJerk-std()-X 
 60   Avg-fBodyAccJerk-std()-Y 
 61   Avg-fBodyAccJerk-std()-Z 
 62   Avg-fBodyGyro-std()-X 
 63   Avg-fBodyGyro-std()-Y 
 64   Avg-fBodyGyro-std()-Z 
 65   Avg-fBodyAccMag-std() 
 66   Avg-fBodyBodyAccJerkMag-std() 
 67   Avg-fBodyBodyGyroMag-std() 
 68   Avg-fBodyBodyGyroJerkMag-std() 

Explanation of the variables:
===============================

Subject: Identification of each of the subject. Ranging from 1 to 30.
Activity: Identification of the activity that each of the subject performed. Values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Avg-tBodyAcc-mean()-X: For a subject-activity pair, average value of the mean time domain body acceleration signal from the X plane.

The details of each of the measurement is provided above in the feature selection section. 
 
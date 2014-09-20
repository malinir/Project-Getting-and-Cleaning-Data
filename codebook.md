
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
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.]

This project assignment involved getting the average value for the mean and standard deviation measurements for each of the subject per activity.

The task of getting average values of each feature measurement for a specific subject-activity pair involved the following steps:
The idea for the diagrams below have been picked from the following discussion forum thread
   [https://class.coursera.org/getdata-007/forum/thread?thread_id=49]


Step 1. Combining the training set and the test set to form one large dataset.(xtrain + xtest). 
        A simple row binding was done on the training and test sets to get the merged set. This set does not include the activity and subject.


    merged data= xtrain + xtest

    ------------------
    |                |
    |   Xtrain       |
    ------------------
    |   Xtest        |
    ------------------


Step 2. Selecting only the required columns after naming the columns based on the feaure.txt. 
        The feature names were read into a vector and the merged data set was named based on the values of the vector.
        A subset of this data was taken based on the column name containing a mean or a std (standard deviation).



    subset(merged data)=66 columns selected out of (Xtrain + Xtest)

    --------------                ----------------------
    |Feature info|               |Feature info          |
    --------------                ----------------------
    |            |               | Merged data of test  |
    |   Xtrain   |   ========>   | and training         |
    --------------               |                      |    
    |   Xtest    |               ------------------------
    --------------


Step 3. Combining the subject and activity data to the merged data set.
        

    --------------------------------
    |Feature info|Subject |Activity|
    --------------------------------
    |            |        |        |
    |   Merged   |subtrain|acttrain|
    -------------------------------|
    |   Data     |subtest |acttest |
    --------------------------------

    

   
Step 4. Naming the activity labels appropriately to indicate the action like walking, standing etc.
        A vector with the activity names was used to read in and fill all the relevant details.

Step 5. Naming the column variables suitably. As part of this step, the following were done
        1. Remove the ()
        2. Remove the -
        3. All the variables were prefixed with Avg to indicate average since it represents the average value for a subject activity pair.
     Note: The variable names were not changed to lower case since changing everything to lower case reduced the readability. 



Step 6. Grouping based on the subject and activity and getting the average values of each of the feature.


   ------------------------------------------------------------
   | Subject|Activity|Feature1 avg| Feature2avg|Feature 66 avg|
   ------------------------------------------------------------
   | sub1   |STANDING|   Value1   |    value2  |              |  
   | sub2   |SITTING |   value3   |    value4  |              |
   |        |        |            |            |              |
   ------------------------------------------------------------



Feature Selection 
------------------
The database refers to the original dataset that was provided for the project. 
The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
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
The variables were renamed to exclude special characters like () and - and an "Avg" to indicate average has been prefixed.

Variables for this project
--------------------------

Given below are all the variables (68 columns with Subject and Activity) that are present in the final data set. The subject and activity together form the key.


 1.	Subject
 2.	Activity
 3.	AvgtBodyAccmeanX
 4.	AvgtBodyAccmeanY
 5.	AvgtBodyAccmeanZ
 6.	AvgtGravityAccmeanX
 7.	AvgtGravityAccmeanY
 8.	AvgtGravityAccmeanZ
 9.	AvgtBodyAccJerkmeanX
 10.	AvgtBodyAccJerkmeanY
 11.	AvgtBodyAccJerkmeanZ
 12.	AvgtBodyGyromeanX
 13.	AvgtBodyGyromeanY
 14.	AvgtBodyGyromeanZ
 15.	AvgtBodyGyroJerkmeanX
 16.	AvgtBodyGyroJerkmeanY
 17.	AvgtBodyGyroJerkmeanZ
 16.	AvgtBodyAccMagmean
 17.	AvgtGravityAccMagmean
 18.	AvgtBodyAccJerkMagmean
 19.	AvgtBodyGyroMagmean
 20.	AvgtBodyGyroJerkMagmean
 21.	AvgfBodyAccmeanX
 22.	AvgfBodyAccmeanY
 23.	AvgfBodyAccmeanZ
 24.	AvgfBodyAccJerkmeanX
 25.	AvgfBodyAccJerkmeanY
 26.	AvgfBodyAccJerkmeanZ
 27.	AvgfBodyGyromeanX
 28.	AvgfBodyGyromeanY
 29.	AvgfBodyGyromeanZ
 30.	AvgfBodyAccMagmean
 31.	AvgfBodyBodyAccJerkMagmean
 32.	AvgfBodyBodyGyroMagmean
 33.	AvgfBodyBodyGyroJerkMagmean
 34.	AvgtBodyAccstdX
 35.	AvgtBodyAccstdY
 36.	AvgtBodyAccstdZ
 37.	AvgtGravityAccstdX
 38.	AvgtGravityAccstdY
 39.	AvgtGravityAccstdZ
 40.	AvgtBodyAccJerkstdX
 41.	AvgtBodyAccJerkstdY
 42.	AvgtBodyAccJerkstdZ
 43.	AvgtBodyGyrostdX
 44.	AvgtBodyGyrostdY
 45.	AvgtBodyGyrostdZ
 46.	AvgtBodyGyroJerkstdX
 47.	AvgtBodyGyroJerkstdY
 48.	AvgtBodyGyroJerkstdZ
 49.	AvgtBodyAccMagstd
 50.	AvgtGravityAccMagstd
 51.	AvgtBodyAccJerkMagstd
 52.	AvgtBodyGyroMagstd
 53.	AvgtBodyGyroJerkMagstd
 54.	AvgfBodyAccstdX
 55.	AvgfBodyAccstdY
 56.	AvgfBodyAccstdZ
 59.	AvgfBodyAccJerkstdX
 60.	AvgfBodyAccJerkstdY
 61.	AvgfBodyAccJerkstdZ
 62.	AvgfBodyGyrostdX
 63.	AvgfBodyGyrostdY
 64.	AvgfBodyGyrostdZ
 65.	AvgfBodyAccMagstd
 66.	AvgfBodyBodyAccJerkMagstd
 67.	AvgfBodyBodyGyroMagstd
 68.	AvgfBodyBodyGyroJerkMagstd

Explanation of the variables:
-----------------------------

1. Subject: Identification of each of the subject. Ranging from 1 to 30.
2. Activity: Identification of the activity that each of the subject performed. Values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3. AvgtBodyAccmeanX: For a subject-activity pair, average value of the mean time domain body acceleration signal from the X plane.
4. AvgtGravityAccstdY:For a subject-activity pair, average value of standard deviations for the gravitational component of the accelaration signal in the Y plane.
5. AvgfBodyAccJerkmeanZ: For a subject-activity pair, average value of means of the jerk signals in the frequency domain measured along the Z plane.

The details of all other variables can be explained based on the explanation for the above variables. Details of each of the measurement is provided above in the 
feature selection section. 
 
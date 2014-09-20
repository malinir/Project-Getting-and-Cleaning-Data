## Run analysis script which is supposed to do the following
## Merge the training and data set to create one data set
## Extracts the measurements only on the mean and standard deviation
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the dataset with descriptive variable names
## creates independent tidy data set with the average of each variable 
## for each activity and each subject

## Assume that the data is available in the directory
## Step 0: Read all the text files and get the basic data frame up

## Read the text files and get the dataframes up
 library(dplyr)
 xtrain<- read.table("./UCI HAR Dataset/train/x_train.txt", header=FALSE,stringsAsFactors=F,fill=T)
 ytrain<- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE,stringsAsFactors=F,fill=T)
 subtrain<- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE,stringsAsFactors=F,fill=T)

## Read the text files in the test set and get the dataframes up

 xtest<- read.table("./UCI HAR Dataset/test/x_test.txt", header=FALSE,stringsAsFactors=F,fill=T)
 ytest<- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE,stringsAsFactors=F,fill=T)
 subtest<- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE,stringsAsFactors=F,fill=T)

## Step 1 of the project: 
## Merges the training and the test set to create on data set 
## Now that we have both the test and training data we can merge them using
## rbind
 mergdata<- rbind(xtrain, xtest)
 
## Step2 of the project:
## Extract only the mean and std values of the measurements
## can use dplyr package
 
## read the features.txt file first so that we can name the columns appropritely
 featdata<- read.table("./UCI HAR Dataset/features.txt", header=FALSE,stringsAsFactors=F,fill=T)

## We have the merged data with the names of all the columns as v1,v2 etc.
## Why not name them appropriately from the file features.txt since the
## select function needs the columns to be named.
 names(mergdata)<- featdata$V2
 mergdatanew<- tbl_df(mergdata)
 mergdatanew<- select(mergdatanew,contains("mean()"),matches("std()"),
                      -matches("meanFreq"),-contains("angle"))
 

## Step 3 of the project
## Uses descriptive activity names to name the activities in the dataset
## So far our merged data only contains the columns related to the data
## The subject and the activity are not present, we will need to add
## a new column with the y_train and y_test data
## Just used a simple method of replacing all the activity labels with the
## character strings
## Note that the order of rbinding should be the same as for rbinding the x files
 activitydata<- rbind(ytrain,ytest)
 subjectdata<-rbind(subtrain,subtest)
 activityname<- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING",
                 "STANDING","LAYING")
 mergdatanew<-mutate(mergdatanew,Subject=subjectdata$V1,
                    Activity=activityname[activitydata$V1])
 
## Doing this just to reorder the columns to show the Subject and Activity first
 mergdatanew<- select(mergdatanew,Subject,Activity,contains("mean"),contains("std"))

## Step 4 and 5 of the project
## Naming the column variables to remove the () and -
## There may be more elegant ways of doing this, but at this point in time,
## I am sticking to this method 
## Grouping by the subject and activity and calculating the mean of each 
## of the variables 
## Using the chaining function and using the summarise_each
 
 names(mergdatanew)<- gsub("fBody","AvgfBody",names(mergdatanew))
 names(mergdatanew)<- gsub("tGravity","AvgtGravity",names(mergdatanew))
 names(mergdatanew)<- gsub("tBody","AvgtBody",names(mergdatanew))
 names(mergdatanew)<- gsub("-","",names(mergdatanew))
 names(mergdatanew)<- gsub("\\()","",names(mergdatanew))
 
 tidydata<-mergdatanew%>%group_by(Subject,Activity)%>%summarise_each(funs(mean))
 
 print(tidydata)


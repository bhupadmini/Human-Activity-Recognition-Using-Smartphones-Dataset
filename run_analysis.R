###########################################################################################################################
## 
## The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
## The goal is to prepare tidy data that can be used for later analysis.
## You will be graded by your peers on a series of yes/no questions related to the project.
## You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository
## with your script for performing the analysis, and 3) a code book that describes the variables,
## the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
## You should also include a README.md in the repo with your scripts.
## This repo explains how all of the scripts work and how they are connected.
## 
## One of the most exciting areas in all of data science right now is wearable computing - see for example
## this article
## . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
## The data linked to from the course website represent data collected from the accelerometers from
## the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
## 
##   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## 
## Here are the data for the project:
## 
##   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## 
## You should create one R script called run_analysis.R that does the following.
## 
### Merges the training and the test sets to create one data set.
### 
### Extracts only the measurements on the mean and standard deviation for each measurement.
### 
### Uses descriptive activity names to name the activities in the data set
### 
### Appropriately labels the data set with descriptive variable names.
### 
### From the data set in step 4, creates a second, independent tidy data set with
### the average of each variable for each activity and each subject.

###########################################################################################################################
library(reshape2)
library(dplyr)

# unzip the zip file to the folder
unzip("./data/UCI HAR Dataset.zip", exdir="./data/", unzip="internal")

# test and train folder path
testfolderPath <- "./data/UCI HAR Dataset/test"
trainfolderPath <- "./data/UCI HAR Dataset/train"

#### Read the following files into data.frame
#### features.txt, activity_labels.txt, subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt, y_test.txt

features <- read.table("./data/UCI HAR Dataset/features.txt")
activityLables <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# train dataset
subjectTrainData <- read.table(paste(trainfolderPath,"subject_train.txt",sep="/"))
XTrainData <- read.table(paste(trainfolderPath,"X_train.txt",sep="/"))
yTrainData <- read.table( paste(trainfolderPath,"y_train.txt",sep="/"))

# test dataset
subjectTestData <- read.table(paste(testfolderPath,"subject_test.txt",sep="/"))
XTestData <- read.table(paste(testfolderPath,"X_test.txt",sep="/"))
yTestData <- read.table (paste(testfolderPath,"y_test.txt",sep="/"))

# column variables for the above Datasets
colnames(activityLables) <- c("activityId", "activityType")
colnames(subjectTrainData) <- c("subjectId")
colnames(subjectTestData) <- c("subjectId")
colnames(XTrainData) <- features$V2
colnames(XTestData) <- features$V2

colnames(yTrainData) <- c("activityId")
colnames(yTestData) <- c("activityId")

# Bind the columns of Subject, X, y of train and test data into a single dataset
TrainData <- cbind(subjectTrainData, XTrainData, yTrainData)
TestData <- cbind(subjectTestData, XTestData, yTestData)

# Merges the training and the test sets to create one data set. - Step 1
Test_Train_Data <- rbind(TestData, TrainData)

# Extract only mean and Standard deviation for each measurement from the merged data - Step 2

mean_std_data <- Test_Train_Data[grepl("-mean\\(", colnames(Test_Train_Data)) | 
                                    grepl("-std\\(", colnames(Test_Train_Data)) | 
                                    grepl("subjectId", colnames(Test_Train_Data)) |
                                    grepl("activityId", colnames(Test_Train_Data))]

# Uses descriptive activity names to name the activities in the data set - Step 3
mean_std_data <- merge(activityLables, mean_std_data, by="activityId")

# Appropriately labels the data set with descriptive variable names. - Step 4
cols_meanstddata <- colnames(mean_std_data)

cols_meanstddata <- gsub("\\()","",cols_meanstddata)
cols_meanstddata <- gsub("BodyBody", "Body", cols_meanstddata)
cols_meanstddata <- gsub("mean", "Mean", cols_meanstddata)
cols_meanstddata <- gsub("std", "STD", cols_meanstddata)
cols_meanstddata <- sub("-","",cols_meanstddata)
cols_meanstddata <- gsub(" $","", cols_meanstddata)
cols_meanstddata <- gsub("^ ", "", cols_meanstddata)

colnames(mean_std_data) <- cols_meanstddata

### get the distinct subjectId from the dataset
number_of_subjects <- mean_std_data %>% distinct(subjectId)

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject. - Step 5

tidyDataSet <- select(mean_std_data, -activityId)

## remove front and rear spaces in the dataset values
gsub("^ ","",tidyDataSet)
gsub(" $","", tidyDataSet)

## melt the dataset with measurements as column variables for each subjectId and activityType
AvgData <- melt(tidyDataSet, id = c("activityType", "subjectId"))

## Tidy the dataset
FinalDataSet <- dcast(AvgData, activityType + subjectId ~ variable, mean)

## Write the tidy dataset into a .txt file
write.table(FinalDataSet, "./data/UCI HAR Dataset/FinalTidyAvgMeanData.txt")

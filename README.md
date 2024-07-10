Human Activity Recognition Using Smartphones Dataset
Version 1.0
===================================================================================================
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Universit?  degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Polit?cnica de Catalunya (BarcelonaTech). Vilanova i la Geltr? (08800), Spain
activityrecognition '@' smartlab.ws 
===================================================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
- A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://www.youtube.com/watch?v=XOEN9W05_4A

For more information about this dataset please contact: activityrecognition '@' smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Other Related Publications:
===========================
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz.  Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care.   Volume 19, Issue 9. May 2013

[3] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

[4] Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Catal?. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  

==================================================================================================
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra. November 2013.

==================================================================================================

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

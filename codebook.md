---
title: "CodeBook.md"
author: "Sohail"
date: "2023-08-21"
output: html_document
---
## Original Source of the data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of the R script

the file named 'run_analysis.r' contains all the steps as required as described in the problem definition.

1. Getting the data from the original source provided.

2. Extration of features and relevant data into appropriate variables

   activity_lables: extracted from activity_labels.txt which are the set of activities for which the measurements were recorded.
   
   features were extracted from the features.txt file in the downloaded data. features of accelerometer and    gyroscope data.
   
   subject_train: contains training data of 21 out of 30 subjects for which data was recorded.
   x_train: the recorded features' data for training dataset
   y_train: the recorded labels of activities performed by the subjects for the training datset.
   
   subject_test: contains testing data of 9 out of 30 subjects for testing purpose.
   x_test: the recorded features' data for testing dataset.
   y_test: the recorded labels of activities performed by the subjects for testing dataset.
   
3. Merging the training & testing datasets.

   x_merged: contains the merged data of x_train and x_test.
   y_merged: contains the merged data of y_train and y_testd.
   subject_merged: contains the training and testing subjects.
  
   merged_dataset: contains combines all the merged vaiables (x_merged, y_merged, subject_merged) into one dataset.

4. 'data' contains the mean and standard diviation data extracted by subsetting merged_dataset thus resulting in a dataset with columns subject, code, mean and standard diviation for each measurement.

5. Descriptive names for the activities in the dataset 'data' were subsituted in place of the acitivity codes.

6. Definition of descriptive variable names using a predefined vector of complete words to replace the short form versions of the original dataset. For example: in all column names,
   column name 'code' replaced with 'Activity'
   All 'acc' words replaced with 'Accelerometer' word
   all 'gyro' words replaced with 'Gyroscope' word
   All 'BodyBody' words replaced with 'Body' word
   All 'Mag' words replaced with 'Magnitude' word
   All words starting with 'f' replaced with 'Frequency' word
   All words starting with 't' replaced with 'Time' word.
   
7. Finally, an independent dataset containing average of each variable for each activity of each subject is derived and termed 'tidy_avg_data'
  This is achieved by grouping the 'data' on activity and subject and then sumarizing the resultant dataset by taking mean of each variable.
  tidy_avg_data is written to FinalData.txt file.

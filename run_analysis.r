run_analysis<-function()
{
  library(dplyr)
  #checking to see if the file exist alreayd
  
  filename<-"dataset.zip"
  if (!file.exists(filename)){
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, filename, method="curl")
  }  
  
  # Checking to see whether the folder exists
  if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
  }
  
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
  
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  
  #merging the training and testing datsets into one dataset
  
  x_merged <- rbind(x_train, x_test)
  y_merged <- rbind(y_train, y_test)
  subject_merged <- rbind(subject_train, subject_test)
  merged_dataset <- cbind(x_merged,y_merged,subject_merged)
  
  #extracting measurements on mean and SD for each measurement
  
  data<-select(merged_dataset,subject,code,contains("mean"),contains("std"))
  
  #getting the activity labels
  data$code<-activity_labels[data$code,2]
  
  #updating the activity labels to descriptive labels
  #vector of descriptive names
  desc_names<-c("Accelerometer","Gyroscope","Body", "Magnitude","Time","Frequency","TimeBody","Mean","STD_Diviation","Angle","Gravity")
  
  #replacing old names with descriptive names
  names(data)[2] = "activity"
  names(data)<-gsub("Acc", desc_names[1], names(data))
  names(data)<-gsub("Gyro", desc_names[2], names(data))
  names(data)<-gsub("BodyBody", desc_names[3], names(data))
  names(data)<-gsub("Mag", desc_names[4], names(data))
  names(data)<-gsub("^t", desc_names[5], names(data))
  names(data)<-gsub("^f", desc_names[6], names(data))
  names(data)<-gsub("tBody", desc_names[7], names(data))
  names(data)<-gsub("-mean()", desc_names[8], names(data), ignore.case = TRUE)
  names(data)<-gsub("-std()", desc_names[9], names(data), ignore.case = TRUE)
  names(data)<-gsub("-freq()", desc_names[6], names(data), ignore.case = TRUE)
  names(data)<-gsub("angle", desc_names[10], names(data))
  names(data)<-gsub("gravity", desc_names[11], names(data))
  
  #the independent average measurements dataset
  
  tidy_avg_data<-group_by(data,subject,activity)
  tidy_avg_data<-summarize_all(tidy_avg_data,list(mean))
  
  write.table(tidy_avg_data,"FinalData.txt",row.names = FALSE)
  
  
  
}
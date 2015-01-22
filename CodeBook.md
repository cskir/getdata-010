---
title: "CodeBook.md"
author: "Csaba Király"
output: html_document
---

#####This Code Book describes the variables, the data, and the transformation steps which helped to achieve the desired objective.

**The output data**

The source of the data comes from an activity recognition experiment.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The smartphone recorded several data, (aka features) and this contains a subset of them, and an aggregation. 

Each row identifies an aggregation for each subject who performed the activity and an activity type. 

The key columns are:

- "subject" 
- "activity" 

The aggregated value is the average of all mean type and standard deviation type features:

- "tBodyAcc-mean()-X" 
- "tBodyAcc-mean()-Y" 
- "tBodyAcc-mean()-Z" 
- "tGravityAcc-mean()-X" 
- "tGravityAcc-mean()-Y" 
- "tGravityAcc-mean()-Z" 
- "tBodyAccJerk-mean()-X" 
- "tBodyAccJerk-mean()-Y" 
- "tBodyAccJerk-mean()-Z" 
- "tBodyGyro-mean()-X" 
- "tBodyGyro-mean()-Y"
- "tBodyGyro-mean()-Z"
- "tBodyGyroJerk-mean()-X" 
- "tBodyGyroJerk-mean()-Y" 
- "tBodyGyroJerk-mean()-Z" 
- "tBodyAccMag-mean()" 
- "tGravityAccMag-mean()" 
- "tBodyAccJerkMag-mean()" 
- "tBodyGyroMag-mean()" 
- "tBodyGyroJerkMag-mean()" 
- "fBodyAcc-mean()-X" 
- "fBodyAcc-mean()-Y" 
- "fBodyAcc-mean()-Z" 
- "fBodyAccJerk-mean()-X" 
- "fBodyAccJerk-mean()-Y" 
- "fBodyAccJerk-mean()-Z" 
- "fBodyGyro-mean()-X" 
- "fBodyGyro-mean()-Y" 
- "fBodyGyro-mean()-Z" 
- "fBodyAccMag-mean()" 
- "fBodyBodyAccJerkMag-mean()" 
- "fBodyBodyGyroMag-mean()" 
- "fBodyBodyGyroJerkMag-mean()" 
- "tBodyAcc-std()-X" 
- "tBodyAcc-std()-Y" 
- "tBodyAcc-std()-Z" 
- "tGravityAcc-std()-X" 
- "tGravityAcc-std()-Y" 
- "tGravityAcc-std()-Z" 
- "tBodyAccJerk-std()-X" 
- "tBodyAccJerk-std()-Y" 
- "tBodyAccJerk-std()-Z" 
- "tBodyGyro-std()-X" 
- "tBodyGyro-std()-Y" 
- "tBodyGyro-std()-Z" 
- "tBodyGyroJerk-std()-X" 
- "tBodyGyroJerk-std()-Y" 
- "tBodyGyroJerk-std()-Z" 
- "tBodyAccMag-std()" 
- "tGravityAccMag-std()" 
- "tBodyAccJerkMag-std()" 
- "tBodyGyroMag-std()" 
- "tBodyGyroJerkMag-std()" 
- "fBodyAcc-std()-X" 
- "fBodyAcc-std()-Y" 
- "fBodyAcc-std()-Z" 
- "fBodyAccJerk-std()-X" 
- "fBodyAccJerk-std()-Y" 
- "fBodyAccJerk-std()-Z" 
- "fBodyGyro-std()-X" 
- "fBodyGyro-std()-Y" 
- "fBodyGyro-std()-Z" 
- "fBodyAccMag-std()" 
- "fBodyBodyAccJerkMag-std()" 
- "fBodyBodyGyroMag-std()" 
- "fBodyBodyGyroJerkMag-std()"

**The clean up process:**

The original data set were partitioned into  2 sets (test and train data). The feautures, the subjects and the activitiy data were separately, and referred only by ids. The labels were in separate files also.

Steps:

 1. Combine the subjects, the activities and the features into one dataset per subsets (test and train), and add appropriate labels for the columns
 2. Merge the two results of the step 1
 3. Select the targetted (mean, std) features
 4. Substitute the activity codes with descriptive activity names 
 5. Group the data by subject and activity (respectively) and create the average of the extracted features
 
#INTRO
This is the codebook for the project of the course "getting and cleaning data" on coursera. The purpose of this project is to collect, work with, and clean a data set. 

#STUDY DESIGN
First of all, I would like to repeat the procedure of the experiments in order to have a thorough understanding of raw data, as well as the different variables. The experiments were made among 30 persons(subjects). They are supposed to perform 6 activities as mentioned in "activity_labels.txt". Each time a measurement takes place, it will be recorded in a vector which forms the original data set. The obtained measurement records were randomly partitioned in the "test" and "train" repositories. In test repo, for example, there are three txt files as well as a "inertial signals" sub-repository. 
1. "subject_test.txt" contains the subject information in correspondence to the different measurements. The range here is [1, 30] as there are 30 volunteers in total. 
2. "y_test.txt" is about activities made among these 30 persons. They are coded in [1, 6] which is connected with "activity_labels.txt" with the help of index numbers. 
3. "X_test.txt" is the test set which contains the same number of row with two files above. It has 561 columns/variables and I will talk about it later in the next part. 
4. What we have to here is to merge the information of these three data sets here. In order to have a clear view of which activity is performed, you may need to join "activity_labels.txt".
5. As to the sub-repository "Inertial Signals", it is not that useful in the short term, but if you want to take out a control process or something, you may need to go a step further. 

#561 features variables
To understand the features variables, it is necessary to keep in mind how the electrical engineers take out their experiments. In fact, all of datasets come from the accelerometer and gyroscope. Each measurement produces the 3-axial time-domain raw signals which will be separated into gravity and body signals. For each gravity and body signals, the magnitude was calculated using the euclidean norm. Body signals, from both accelerometer and gyroscope, were derived in time to get jerk signals, namely, the acceleration of acceleration. At last, a FFT was applied to certains signals in order to study their frequency domain signals. For all the signals indicated above, a set of variables, such as mean, energy and entropy, are estimated. Additionally, angle variables are obtained as well in the experiments. Here, what interest us the most, are mean and standard deviation variables. ps: in preparation of this part, I have noticed that a certain variables in the "features.txt" may not be well named, for instance : fBodyBodyAccJerkMag, fBodyBodyGyroMag and fBodyBodyGyroJerkMag.

#code book
For your information, the variables concerning angles are finally excluded from the tidy data set. Here are informations about the final 68 variables. If you take "meanFreq" into consideration, you must have more than 68. 
1. action : describes the activity of each measurement
2. subject : the corresponding person who contributes to the result
3. The other 66 variables are presented below in form of table

| FULLNAME_VAR                | BASIC_FEATURES       | METHODS | AXIAL |
|-----------------------------|----------------------|---------|-------|
| tBodyAcc-mean()-X           | tBodyAcc             | mean()  | X     |
| tBodyAcc-mean()-Y           | tBodyAcc             | mean()  | Y     |
| tBodyAcc-mean()-Z           | tBodyAcc             | mean()  | Z     |
| tBodyAcc-std()-X            | tBodyAcc             | std()   | X     |
| tBodyAcc-std()-Y            | tBodyAcc             | std()   | Y     |
| tBodyAcc-std()-Z            | tBodyAcc             | std()   | Z     |
| tGravityAcc-mean()-X        | tGravityAcc          | mean()  | X     |
| tGravityAcc-mean()-Y        | tGravityAcc          | mean()  | Y     |
| tGravityAcc-mean()-Z        | tGravityAcc          | mean()  | Z     |
| tGravityAcc-std()-X         | tGravityAcc          | std()   | X     |
| tGravityAcc-std()-Y         | tGravityAcc          | std()   | Y     |
| tGravityAcc-std()-Z         | tGravityAcc          | std()   | Z     |
| tBodyAccJerk-mean()-X       | tBodyAccJerk         | mean()  | X     |
| tBodyAccJerk-mean()-Y       | tBodyAccJerk         | mean()  | Y     |
| tBodyAccJerk-mean()-Z       | tBodyAccJerk         | mean()  | Z     |
| tBodyAccJerk-std()-X        | tBodyAccJerk         | std()   | X     |
| tBodyAccJerk-std()-Y        | tBodyAccJerk         | std()   | Y     |
| tBodyAccJerk-std()-Z        | tBodyAccJerk         | std()   | Z     |
| tBodyGyro-mean()-X          | tBodyGyro            | mean()  | X     |
| tBodyGyro-mean()-Y          | tBodyGyro            | mean()  | Y     |
| tBodyGyro-mean()-Z          | tBodyGyro            | mean()  | Z     |
| tBodyGyro-std()-X           | tBodyGyro            | std()   | X     |
| tBodyGyro-std()-Y           | tBodyGyro            | std()   | Y     |
| tBodyGyro-std()-Z           | tBodyGyro            | std()   | Z     |
| tBodyGyroJerk-mean()-X      | tBodyGyroJerk        | mean()  | X     |
| tBodyGyroJerk-mean()-Y      | tBodyGyroJerk        | mean()  | Y     |
| tBodyGyroJerk-mean()-Z      | tBodyGyroJerk        | mean()  | Z     |
| tBodyGyroJerk-std()-X       | tBodyGyroJerk        | std()   | X     |
| tBodyGyroJerk-std()-Y       | tBodyGyroJerk        | std()   | Y     |
| tBodyGyroJerk-std()-Z       | tBodyGyroJerk        | std()   | Z     |
| tBodyAccMag-mean()          | tBodyAccMag          | mean()  |       |
| tBodyAccMag-std()           | tBodyAccMag          | std()   |       |
| tGravityAccMag-mean()       | tGravityAccMag       | mean()  |       |
| tGravityAccMag-std()        | tGravityAccMag       | std()   |       |
| tBodyAccJerkMag-mean()      | tBodyAccJerkMag      | mean()  |       |
| tBodyAccJerkMag-std()       | tBodyAccJerkMag      | std()   |       |
| tBodyGyroMag-mean()         | tBodyGyroMag         | mean()  |       |
| tBodyGyroMag-std()          | tBodyGyroMag         | std()   |       |
| tBodyGyroJerkMag-mean()     | tBodyGyroJerkMag     | mean()  |       |
| tBodyGyroJerkMag-std()      | tBodyGyroJerkMag     | std()   |       |
| fBodyAcc-mean()-X           | fBodyAcc             | mean()  | X     |
| fBodyAcc-mean()-Y           | fBodyAcc             | mean()  | Y     |
| fBodyAcc-mean()-Z           | fBodyAcc             | mean()  | Z     |
| fBodyAcc-std()-X            | fBodyAcc             | std()   | X     |
| fBodyAcc-std()-Y            | fBodyAcc             | std()   | Y     |
| fBodyAcc-std()-Z            | fBodyAcc             | std()   | Z     |
| fBodyAccJerk-mean()-X       | fBodyAccJerk         | mean()  | X     |
| fBodyAccJerk-mean()-Y       | fBodyAccJerk         | mean()  | Y     |
| fBodyAccJerk-mean()-Z       | fBodyAccJerk         | mean()  | Z     |
| fBodyAccJerk-std()-X        | fBodyAccJerk         | std()   | X     |
| fBodyAccJerk-std()-Y        | fBodyAccJerk         | std()   | Y     |
| fBodyAccJerk-std()-Z        | fBodyAccJerk         | std()   | Z     |
| fBodyGyro-mean()-X          | fBodyGyro            | mean()  | X     |
| fBodyGyro-mean()-Y          | fBodyGyro            | mean()  | Y     |
| fBodyGyro-mean()-Z          | fBodyGyro            | mean()  | Z     |
| fBodyGyro-std()-X           | fBodyGyro            | std()   | X     |
| fBodyGyro-std()-Y           | fBodyGyro            | std()   | Y     |
| fBodyGyro-std()-Z           | fBodyGyro            | std()   | Z     |
| fBodyAccMag-mean()          | fBodyAccMag          | mean()  |       |
| fBodyAccMag-std()           | fBodyAccMag          | std()   |       |
| fBodyBodyAccJerkMag-mean()  | fBodyBodyAccJerkMag  | mean()  |       |
| fBodyBodyAccJerkMag-std()   | fBodyBodyAccJerkMag  | std()   |       |
| fBodyBodyGyroMag-mean()     | fBodyBodyGyroMag     | mean()  |       |
| fBodyBodyGyroMag-std()      | fBodyBodyGyroMag     | std()   |       |
| fBodyBodyGyroJerkMag-mean() | fBodyBodyGyroJerkMag | mean()  |       |
| fBodyBodyGyroJerkMag-std()  | fBodyBodyGyroJerkMag | std()   |       |

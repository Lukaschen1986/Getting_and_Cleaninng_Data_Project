##INTRO
This is the simple description for "run_analysis.R".
It is highly recommended to read the code and this text at the same time.

#1st step : download and unzip the raw data (only once)
1) verify if the zip file exists in the working directory.
2) if not, try to download and unzip it. print the download time at the console.

#2nd step : preparation
1) read the feature file and get the index of variables of mean() and std() 
2) read the activity file

#3rd step : read test repository
1) read the test_data and assign its column names with features
2) read the test labels and name them with descriptive activity names
3) read the test subjects and combine the informations of data, labels and subjects together

#4th step : read train repository : similar to the third step

#5th step : 
1) combine the test and train data together 
2) select the specific columns (mean, std, action, subject)

#6th step : 
1) group the selected data by action and subject
2) apply "mean" function to each of 66 columns
3) write the "tidy" dataset in "tidy.txt"

#For info : 
I didn't respects the orders of demandes because i found it simpler and more logical to do it in the way indicated above.






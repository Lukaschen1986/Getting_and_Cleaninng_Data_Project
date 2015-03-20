#-----1st step-----download-----
#download the file and unzip
if(!file.exists("./projet.zip")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="projet.zip")
    download_time <- date()
    message(paste("The data was downloaded at", download_time))
    unzip ("projet.zip", exdir = ".")
}

#-----2nd step-----preparation-----
#read_features
path_features <- ".\\UCI HAR Dataset\\features.txt"
features <- read.table(path_features, header=FALSE, sep=" ", col.names=c("id", "feature"), stringsAsFactors=TRUE)
index <- grep("mean\\(|std\\(", features[["feature"]], value=FALSE)

#read_activity_labels
path_activities <- ".\\UCI HAR Dataset\\activity_labels.txt"
activities <- read.table(path_activities, header=FALSE, sep=" ", col.names=c("id", "action"), stringsAsFactors=TRUE)

#-----3rd step-----repo of test-----
#read X_test 2947 561
path_test <- ".\\UCI HAR Dataset\\test\\X_test.txt"
test_data <- read.table(path_test, header=FALSE)
colnames(test_data) <- features[["feature"]]

#read y_test 2947 1
path_test_labels <- ".\\UCI HAR Dataset\\test\\y_test.txt"
test_labels <- read.table(path_test_labels, header=FALSE)
colnames(test_labels) <- "id"
test_labels <- join(test_labels, activities, by = "id", type = "left", match="all")
#read subjects_test 2947 1
path_subject_test <- ".\\UCI HAR Dataset\\test\\subject_test.txt"
test_subjects <- read.table(path_subject_test, header=FALSE)
colnames(test_subjects) <- "subject"
test_data <- cbind(test_data, test_labels["action"], test_subjects)

#-----4th step-----repo of train-----
#read_train 7352 561
path_train <- ".\\UCI HAR Dataset\\train\\X_train.txt"
train_data <- read.table(path_train, header=FALSE)
colnames(train_data) <- features[["feature"]]

#read y_train 7352 1
path_train_labels <- ".\\UCI HAR Dataset\\train\\y_train.txt"
train_labels <- read.table(path_train_labels, header=FALSE)
colnames(train_labels) <- "id"
train_labels <- join(train_labels, activities, by = "id", type = "left", match="all")

#read subjects_train 7352 1
path_subject_train <- ".\\UCI HAR Dataset\\train\\subject_train.txt"
train_subjects <- read.table(path_subject_train, header=FALSE)
colnames(train_subjects) <- "subject"
train_data <- cbind(train_data, train_labels["action"], train_subjects)

#data <- cbind(train_labels["action"], train_subjects)
#write.table(data, file="test1.csv", sep=";")
#data <- cbind(test_labels["action"], test_subjects)
#write.table(data, file="test2.csv", sep=";")

#-----5th step-----combine test and train vertically-----
#10299 (561+2)
mergedData <- rbind(test_data, train_data)
#index of mean/std + action + subject
index <- c(index, 562, 563)
#10299 68
selectedData <- mergedData[,index]
dim(selectedData)

#-----last step-----tidy data set---
#68 variables 40 observations
library(plyr)
final <- ddply(selectedData, .(action, subject), function(df) sapply(df[,1:66], mean))
dim(final)
write.table(final, file = "tidy.txt", row.name = FALSE)

### run_analysis.R
### Coursera Course Project
### Getting and Cleaning Data


### This script run_analysis.R does the following-
###Merges the training and the test sets to create one data set.
###Extracts only the measurements on the mean and standard deviation for each measurement. 
###Uses descriptive activity names to name the activities in the data set
###Appropriately labels the data set with descriptive variable names. 
###From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each ###activity and each subject.

###Let's begin with loading the data from the UCI HAR dataset (Activity_labels.txt). Use descriptive activity names

activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt",colClasses=c("NULL","character"))

###These activity labels will be applied to the activities contained in the Y_test.txt and Y_train.txt files. use descriptive variable names to label the dataset.

features <- read.table("./UCI HAR Dataset/features.txt", sep=" ",colClasses=c("NULL","character"),col.names=c("NULL","feature"))

features$feature <- make.names(features$feature)


### Read the test dataset(subject,activity and features)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",col.names = "activity")
a_test <- lapply(y_test,function(x)activity_label[x,1])

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

###Apply labels to feature columns.
names(x_test) <- features$feature

### Select only features with the text "mean" or "std" in the col name. Use regular expressions to select such features.
c_test <- x_test[,sort(c(grep("mean",features$feature),grep("std",features$feature)))]

###Create a data frame to bind the columns for subjects, activities and features.
data_test <- cbind(subject_test,a_test,c_test)

### Now to pull the data for training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",col.names = "activity")
a_train <- lapply(y_train,function(x)activity_label[x,1])
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

names(x_train) <- features$feature
c_train <- x_train[,sort(c(grep("mean",features$feature),grep("std",features$feature)))]

data_train <- cbind(subject_train,a_train,c_train)

###Use dplyr to perform summarized analysis. Make sure "dplyr" package has been installed (install.packages("dplyr")
library(dplyr)

### For the final step, tidy data set with the average of each variable for each activity and each subject. 
### Bind the dataset for both test and train by appending the rows together.
### Convert the data frame into dplyr table.dataframe, Group tbl_df by subject and activity.
### Summarize all other fields by computing the means of each variable within each group.
tidy_data <- tbl_df(rbind(data_train,data_test)) %>%
 	     group_by(subject,activity) %>%
             summarise_each(funs(mean))

### Write the output data into a tidy_data.txt file.
write.table(tidy_data,"tidy_data.txt",sep="\t")


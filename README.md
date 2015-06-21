# Getting-and-Cleaning-Data
CourseName: Getting and Cleaning Data

Course Project (Peer Review)

The course project correlates and summarizes the data provided by the UCI Human Activity Recognition (HAR) Database.
Dataset used for the project https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The 4 components of this analysis are as follows:

1) Readme.md - Summary of Project, components, and steps needed to reproduce work

2) CodeBook.md - Summary of the dataset provided via the "tidy_data.txt" file

3) run_analysis.R - R Script which may be used to reproduce the dataset provided in the "tidy_data.txt" file

4) tidy_data.txt - The resulting wide form tidy data set which may be accessed via this url: 


To reproduce this analyis, the following preconditions must be met:

1) dplyr package must be installed in R using install.packages("dplyr")

2) The UCI HAR Dataset must be unzipped into the R working directory [the function dir() must contain the folder "UCI HAR Dataset"]

Once the "run_analysis.R" script has been run, the correlated and summarized dataset will be contained in the tidy data.frame

References:

See the original UCI HAR study website for full details on the source dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


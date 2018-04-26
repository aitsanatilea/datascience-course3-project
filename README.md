# datascience-course3-project
Getting and Cleaning Data. Course Project

## Files in this repository

- README.md - information about files 
- CodeBook.md - codebook describing the variables, the data and transformations
- run_analysis.R - script for performing an analysis


## run_analysis.R

This is the main script that is called to perform the cleaning and tidying of the dataset as described in the task. 

Steps to perform for script executing:
1. Download the script into the working directory
2. Run the script using the following command: source("run_analysis.R")

Script does the following:
1. Downloads required data into the working directory and unzips it
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7. Saves tidy data set to "UCI HAR Dataset" folder as "tidydata.txt"

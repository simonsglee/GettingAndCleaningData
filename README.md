# Getting And Cleaning Data Project
Simon Lee

## Overview
The goal of this project is to demonstrate the ability to clean and prepare a data set for later analysis.

## Script
The `run_analysis` R script does the following:

1. Download UCI HAR Dataset and unzip the content into the working directory
2. Load feature and activity names
3. Load feature data, subject data, and activity data of both train and test sets
4. Merge train and test, extracting only the measurements on the mean and deviation for each measurement
5. Add descriptive names to activities in the dataset
6. Label the data set with descriptive variable names
7. Take average of each variable for each activity and subject and write the resulting table in `mean_df.text`

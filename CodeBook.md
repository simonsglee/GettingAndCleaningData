# CodeBook for Getting And Cleaning Data course project
## Raw Data
The data comes from an experiment where thirty subjects performed six activities wearing a smart phone on the waist.
The description of the data set used for this project can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The download link for data set can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Variables
*`X_train`, `X_test`: contain feature measurements
*`Y_train`, 'Y_test`: contains activity descriptions corresponding to each row
*`subject_train`, `subject_test`: contain subject id number corresponding to each row
* `features`: contain descriptive name of all the feature measurements
* `features_names`: descriptive names of measurements after "-" character is replaced with "_" and "()" are removed for readability
* `activity_labels`: contain descriptive name of all the activities and their corresponding number from 1 to 6

## Transformations
* Only the features relating to mean and deviation measures were extracted from the `X_train` and `X_test` text files.
* Cbind function was used to combine X, Y and subject tables into `train_df` and 'test_df'
* Rbind function was used to merge `train_df` and `test_df` to form `merged_df`
* Varialbe names were replaced with descriptive names from `features_names`
* Numeric values in the activity columns were replaced with descriptive names from `activity_labels` as factors
* `melt` function from `reshape2` package was used to melt the `merged_df` data set by subject and activity
* `dcast` function from `reshape2` package was used to create a new data set with mean values

## Final Output
The resulting tidy datasets are contained in:
* complete_tinydata.txt
* mean_tinydata.txt


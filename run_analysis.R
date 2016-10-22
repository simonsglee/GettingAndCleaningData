library(reshape2)

# create download folder to put files in
# download data and unzip file
if(!file.exists("./data")){
        dir.create("./data")
}
if(!file.exists("./data/assignmentdata.zip")) {
        file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(file_url, destfile = "./data/assignmentdata.zip")
}
if(!file.exists("./data/UCI HAR Dataset")){
        unzip("./data/assignmentdata.zip", exdir = "./data")
}

# Read the features file into R
features <- read.table("./data/UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)

# Find the location of feature names containing "mean" or "std" and store it in object features_index
# Store name of the features into object features_name 
features_index <- grep(".*mean.*|.*std.*", features$V2)
features_names <- features[features_index,2]
features_names <- gsub("-", "_", features_names)
features_names <- gsub("[()]", "", features_names)
features_names <- as.character(features_names)

# Load rest of the files
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")[,features_index]
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")[,features_index]
Y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
Y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")

# Combine subject, x, y tables into train and test data frames and then merge
train_df <- cbind(subject_train, Y_train, X_train)
test_df <- cbind(subject_test, Y_test, X_test)
merged_df <- rbind(train_df, test_df)

# label the data set with descriptive variable names 
colnames(merged_df) <- c("subject", "activity", features_names)

# turn activity and subject variables into factors
merged_df$subject <- as.factor(merged_df$subject)
merged_df$activity <- factor(merged_df$activity, levels = activity_labels$V1,
                             labels = as.character(activity_labels$V2))

# melt data frame
melt_df <- melt(merged_df, id = c("subject", "activity"))

# cast melted data frame to show average
mean_df <- dcast(melt_df, subject + activity ~ variable, mean)

# write tiny data in text format
write.table(merged_df, "complete_tidydata.txt", quote = FALSE, row.names = FALSE)
write.table(mean_df, "mean_tidydata.txt", quote = FALSE, row.names = FALSE)


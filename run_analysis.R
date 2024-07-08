# Load required packages
library(dplyr)

# Set the working directory to the location of the UCI HAR Dataset folder
setwd("path/to/UCI HAR Dataset")

# Read in the data
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt", col.names = c("activity_id", "activity"))

# Load the training and test datasets
train_data <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
train_subjects <- read.table("train/subject_train.txt")

test_data <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
test_subjects <- read.table("test/subject_test.txt")

# Merge the training and test datasets
merged_data <- rbind(train_data, test_data)
merged_labels <- rbind(train_labels, test_labels)
merged_subjects <- rbind(train_subjects, test_subjects)

# Set column names
colnames(merged_data) <- features$V2
colnames(merged_labels) <- "activity"
colnames(merged_subjects) <- "subject"

# Extract only the measurements on the mean and standard deviation for each measurement
mean_std_features <- grep("-(mean|std)\\(\\)", features$V2)
merged_data <- merged_data[, mean_std_features]

# Add activity and subject columns to the dataset
final_data <- cbind(merged_subjects, merged_labels, merged_data)

# Use descriptive activity names to name the activities in the data set
final_data$activity <- factor(final_data$activity, levels = activity_labels$activity_id, labels = activity_labels$activity)

# Appropriately label the data set with descriptive variable names
names(final_data) <- gsub("^t", "Time", names(final_data))
names(final_data) <- gsub("^f", "Frequency", names(final_data))
names(final_data) <- gsub("Acc", "Accelerometer", names(final_data))
names(final_data) <- gsub("Gyro", "Gyroscope", names(final_data))
names(final_data) <- gsub("Mag", "Magnitude", names(final_data))
names(final_data) <- gsub("BodyBody", "Body", names(final_data))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- final_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)

# Code Book

## 1. Introduction

This code book describes the variables, data, and transformations used in the Getting and Cleaning Data course project.

## 2. Data Source

The data used in this project is collected from the accelerometers of the Samsung Galaxy S smartphone. The original dataset can be found at the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## 3. Variables

The dataset includes the following variables:

- `subject`: An identifier of the subject who carried out the experiment (integer).
- `activity`: The type of activity performed (string), with the following possible values:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

The dataset includes the following measurements, which are the mean and standard deviation for each measurement:

- `TimeBodyAccelerometer-mean()-X`
- `TimeBodyAccelerometer-mean()-Y`
- `TimeBodyAccelerometer-mean()-Z`
- `TimeBodyAccelerometer-std()-X`
- `TimeBodyAccelerometer-std()-Y`
- `TimeBodyAccelerometer-std()-Z`
- `TimeGravityAccelerometer-mean()-X`
- `TimeGravityAccelerometer-mean()-Y`
- `TimeGravityAccelerometer-mean()-Z`
- `TimeGravityAccelerometer-std()-X`
- `TimeGravityAccelerometer-std()-Y`
- `TimeGravityAccelerometer-std()-Z`
- `TimeBodyAccelerometerJerk-mean()-X`
- `TimeBodyAccelerometerJerk-mean()-Y`
- `TimeBodyAccelerometerJerk-mean()-Z`
- `TimeBodyAccelerometerJerk-std()-X`
- `TimeBodyAccelerometerJerk-std()-Y`
- `TimeBodyAccelerometerJerk-std()-Z`
- `TimeBodyGyroscope-mean()-X`
- `TimeBodyGyroscope-mean()-Y`
- `TimeBodyGyroscope-mean()-Z`
- `TimeBodyGyroscope-std()-X`
- `TimeBodyGyroscope-std()-Y`
- `TimeBodyGyroscope-std()-Z`
- `TimeBodyGyroscopeJerk-mean()-X`
- `TimeBodyGyroscopeJerk-mean()-Y`
- `TimeBodyGyroscopeJerk-mean()-Z`
- `TimeBodyGyroscopeJerk-std()-X`
- `TimeBodyGyroscopeJerk-std()-Y`
- `TimeBodyGyroscopeJerk-std()-Z`
- `FrequencyBodyAccelerometer-mean()-X`
- `FrequencyBodyAccelerometer-mean()-Y`
- `FrequencyBodyAccelerometer-mean()-Z`
- `FrequencyBodyAccelerometer-std()-X`
- `FrequencyBodyAccelerometer-std()-Y`
- `FrequencyBodyAccelerometer-std()-Z`
- `FrequencyBodyAccelerometerJerk-mean()-X`
- `FrequencyBodyAccelerometerJerk-mean()-Y`
- `FrequencyBodyAccelerometerJerk-mean()-Z`
- `FrequencyBodyAccelerometerJerk-std()-X`
- `FrequencyBodyAccelerometerJerk-std()-Y`
- `FrequencyBodyAccelerometerJerk-std()-Z`
- `FrequencyBodyGyroscope-mean()-X`
- `FrequencyBodyGyroscope-mean()-Y`
- `FrequencyBodyGyroscope-mean()-Z`
- `FrequencyBodyGyroscope-std()-X`
- `FrequencyBodyGyroscope-std()-Y`
- `FrequencyBodyGyroscope-std()-Z`

## 4. Data Cleaning Steps

1. **Merge the training and the test sets to create one data set**:
    - Read the data files (training and test datasets).
    - Combine the data using `rbind` to merge the datasets by rows.

2. **Extract only the measurements on the mean and standard deviation for each measurement**:
    - Identify the columns with mean and standard deviation measurements using `grep`.
    - Subset the data to include only these columns.

3. **Use descriptive activity names to name the activities in the data set**:
    - Replace activity IDs with descriptive activity names using the `activity_labels` file.

4. **Appropriately label the data set with descriptive variable names**:
    - Replace abbreviations with descriptive names (e.g., `t` becomes `Time`, `Acc` becomes `Accelerometer`).

5. **Create a second, independent tidy data set with the average of each variable for each activity and each subject**:
    - Group the data by `subject` and `activity`.
    - Calculate the mean of each variable for each activity and each subject.
    - Write the tidy data set to a file named `tidy_data.txt`.

## 5. File Descriptions

- `run_analysis.R`: The script that performs the data cleaning and creates the tidy dataset.
- `tidy_data.txt`: The output file containing the tidy data set.
- `CodeBook.md`: This file, describing the variables, data, and transformations.
- `README.md`: A file explaining how the script works and how it is connected.

## 6. Transformations

- The original dataset contained several data files that were merged.
- Only measurements on the mean and standard deviation were extracted.
- Activities were labeled with descriptive names.
- Variable names were made more descriptive.
- The data was grouped by subject and activity, and the mean of each variable was calculated.

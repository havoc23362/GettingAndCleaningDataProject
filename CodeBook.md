# CodeBook

## Overview

This code book summarizes the variables, data sources, and transformations used to create the tidy dataset for the *Getting and Cleaning Data* course project.

The tidy dataset contains the **average of each variable** for each **activity** and **subject** from the original UCI Human Activity Recognition Using Smartphones Dataset.

---

## Source Data

Original dataset: [UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Files used:

- `features.txt`
- `activity_labels.txt`
- `train/subject_train.txt`, `train/X_train.txt`, `train/y_train.txt`
- `test/subject_test.txt`, `test/X_test.txt`, `test/y_test.txt`

---

## Data Cleaning Steps (in `run_analysis.R`)

1. **Merged** the training and test datasets into one combined dataset.
2. **Extracted** only the measurements on the mean and standard deviation for each measurement.
3. **Replaced** activity codes with descriptive activity names.
4. **Renamed** variable names to make them more readable and descriptive.
5. **Created** a tidy dataset with the average of each measurement for each activity and each subject.

---

## Variables in `tidy_dataset.txt`

### Identifiers

- `subject`  
  *Integer*: ID of the person who performed the activity (1–30)

- `activity`  
  *Factor*: Descriptive name of the activity (e.g., WALKING, SITTING)

### Measurement Variables

All remaining variables are the **average values** of original mean and standard deviation features from the raw data. Names follow the cleaned and expanded convention:

Examples:

- `TimeBodyAccelerometerMeanX`
- `TimeBodyAccelerometerMeanY`
- `TimeBodyAccelerometerStdZ`
- `FrequencyBodyGyroscopeMeanX`
- `FrequencyBodyGyroscopeStdY`

### Naming Conventions

- Prefix `Time` = time domain signals  
- Prefix `Frequency` = frequency domain signals  
- `Accelerometer` = accelerometer data  
- `Gyroscope` = gyroscope data  
- `Mean` = mean value  
- `Std` = standard deviation  
- `X`, `Y`, `Z` = axis

---

## Units

Most values represent:
- Acceleration (in g)
- Angular velocity (in rad/sec)

Exact units come from the original data collected by the smartphone sensors.

---

## Output

The final tidy dataset contains **180 rows** (30 subjects × 6 activities) and **68 columns**:
- 1 for subject
- 1 for activity
- 66 for averaged measurements

Saved as:  
```r
write.table(tidy_data, "tidy_dataset.txt", row.names = FALSE)

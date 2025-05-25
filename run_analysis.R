# Load required packages
library(dplyr)

#Read  files
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

#Merge the training and the test sets
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
merged_data <- cbind(subject, y_data, x_data)

#Extract only the measurements on the mean and standard deviation
selected_columns <- grep("mean\\(\\)|std\\(\\)", features$feature, value = TRUE)
selected_data <- merged_data[, c("subject", "activity", selected_columns)]

#Use descriptive activity names
selected_data$activity <- factor(selected_data$activity, levels = activities$code, labels = activities$activity)

#Label the data set with descriptive variable names
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))

# Create tidy data set with the average of each variable for each activity and each subject
tidy_data <- selected_data %>%
    group_by(subject, activity) %>%
    summarise_all(mean)

# Write the tidy dataset to a file
write.table(tidy_data, "tidy_dataset.txt", row.names = FALSE)

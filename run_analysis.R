## Step 1
## Read in the tables
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Merge the test and train tables with the activities and subject columns
test_combined <- cbind(test_X,test_y,test_subject)
train_combined <- cbind(train_X,train_y,train_subject)

## Merge the test and train data into one set
all_data <- rbind(test_combined,train_combined)


## Step 2
## Read in the features and activities labels
labels <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## Extract only the measurements on the mean and standard deviation for each measurement. 
labels$V2 <- lapply(labels$V2, as.character)
mean_std_cols <- grep("std|mean", labels$V2)
mean_std_subset <- all_data[,c(mean_std_cols,562,563)]


## Step 3
## Uses descriptive activity names to name the activities in the data set
mean_std_subset$V1.1<- factor(mean_std_subset$V1.1, levels = activities$V1, labels = activities$V2)


## Step 4
## Appropriately labels the data set with descriptive variable names. 
## Provide the base labels from features.txt
names(mean_std_subset) <- c(labels[mean_std_cols,]$V2,"Activity","Subject")

## Replace pieces of text with more human-readable language
names(mean_std_subset) <- sub("^f", "frequency domain ", names(mean_std_subset))
names(mean_std_subset) <- sub("^t", "time ", names(mean_std_subset))

names(mean_std_subset) <- sub("-X", "on the X axis", names(mean_std_subset))
names(mean_std_subset) <- sub("-Y", "on the Y axis", names(mean_std_subset))
names(mean_std_subset) <- sub("-Z", "on the Z axis", names(mean_std_subset))

names(mean_std_subset) <- sub("(.*)(-meanFreq\\(\\))", "Mean frequency of \\1", names(mean_std_subset))
names(mean_std_subset) <- sub("(.*)(-mean\\(\\))", "Mean of \\1", names(mean_std_subset))
names(mean_std_subset) <- sub("(.*)(-std\\(\\))", "Std Dev of \\1", names(mean_std_subset))

names(mean_std_subset) <- sub("Gravity", "gravity ", names(mean_std_subset))
names(mean_std_subset) <- sub("Body", "body ", names(mean_std_subset))
names(mean_std_subset) <- sub("Acc", "acceleration ", names(mean_std_subset))
names(mean_std_subset) <- sub("Jerk", "jerk signals ", names(mean_std_subset))
names(mean_std_subset) <- sub("Gyro", "gyro signals ", names(mean_std_subset))
names(mean_std_subset) <- sub("of (.*)(Mag)", "of the magnitude of \\1", names(mean_std_subset))

## Spare 'Body' in some variable names that may be a typo, per message boards
names(mean_std_subset) <- sub("Body", "", names(mean_std_subset))
## Trim white space at end
names(mean_std_subset) <- sub(" $", "", names(mean_std_subset))


## Step 5
## From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
library(plyr)
mssMeans <- ddply(mean_std_subset, .(Subject, Activity), colwise(mean))

write.table(mssMeans, "tidied.txt")
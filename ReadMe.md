---
title: "ReadMe"
---

run_analysis.R processes data collected in a test of 30 subjects wearing
Samsung Galaxy S phones. Many categories of information were recorded, but
this script isolates the mean and standard deviations of each measurement
from the phone's accelerometers. It combines the 'training' and 'test'
subject data, renames variables with more human-readable language, and
creates a tidy data set with the average for each variable and subject,
outputting it to a file called 'tidied.txt'.

First we read the main data files.

```
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
```

Then complete step 1 by combining the train and test datasets with their activity and
subject columns, then add the two of them together:

```
test_combined <- cbind(test_X,test_y,test_subject)
train_combined <- cbind(train_X,train_y,train_subject)

all_data <- rbind(test_combined,train_combined)
```

For step 2 and preparation for the following steps, read in the column labels and activity names:

```
labels <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
```

And complete step 2 by searching for columns with mean or std in their names, and keeping the
activity and subject columns:

```
labels$V2 <- lapply(labels$V2, as.character)
mean_std_cols <- grep("std|mean", labels$V2)
mean_std_subset <- all_data[,c(mean_std_cols,562,563)]
```

For step 3, simply change the numbers in the activity column (currently named $V1.1)
with factors from the activity text

```
mean_std_subset$V1.1<- factor(mean_std_subset$V1.1, levels = activities$V1, labels = activities$V2)
```

For step 4, give the columns names from the labels read in earlier, plus "Activity" and "Subject":

```
names(mean_std_subset) <- c(labels[mean_std_cols,]$V2,"Activity","Subject")
```

Then finish by replacing the various parts of the column names with more human-readable terms:

```
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
names(mean_std_subset) <- sub("Gyro", "gyro ", names(mean_std_subset))
names(mean_std_subset) <- sub("of (.*)(Mag)", "of the magnitude of \\1", names(mean_std_subset))
```

Per the message boards, eliminate the spare "Body" in some variable names ("BodyBody")
and get rid of a few trailing spaces

```
names(mean_std_subset) <- sub("Body", "", names(mean_std_subset))

names(mean_std_subset) <- sub(" $", "", names(mean_std_subset))
```

Finally, use ddply() from the plyr package to take a column-wise mean for each subject and activity:

```
library(plyr)
mssMeans <- ddply(mean_std_subset, .(Subject, Activity), colwise(mean))
```

And output it to "tidied.txt"

```
write.table(mssMeans, "tidied.txt", row.names=FALSE)
```


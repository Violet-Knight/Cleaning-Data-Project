---
title: "CodeBook"
output: html_document
---

The first half of the file contains relevant information from the original project’s README.txt. Information on the current project’s processing script, output files, and variable names follows at the end:


==================================================================

Human Activity Recognition Using Smartphones Dataset

Version 1.0
==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit‡ degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 



Updated Information
===================
This script processes the data above to merge the test and training data with their appropriate activity and subject number readings, then merge the two together into one big dataset. After that, it exchanges the activity numbers for readable text, and exchanges the column names with human-readable names.

Included files
==============
All new files are in the working directory, which includes the “UCI HAR dataset” directory.

- ‘run_analysis.R’: The script file which processes the data.
- ‘CodeBook.md’: This codebook.
- ‘CodeBook.html’: The html equivalent of the CodeBook markdown file.
- ‘ReadMe.md’: An R markdown file explaining the script step by step.
- ‘ReadMe.html’: The html equivalent of the ReadMe markdown file.
- ‘tidied.txt’: The output file, containing averages of each column per activity per subject.

Output data file
================
The column names are as follows. “Subject” is the number of the subject, from 1-30, while “Activity” is one of the aforementioned six activity names. The rest of the columns are means of the observations grouped by subjects and activities, for a total of 180 means. They are standardized, so the numbers are between -1 and +1.

- Subject
- Activity
- Mean of time body acceleration on the X axis
- Mean of time body acceleration on the Y axis
- Mean of time body acceleration on the Z axis
- Std Dev of time body acceleration on the X axis
- Std Dev of time body acceleration on the Y axis
- Std Dev of time body acceleration on the Z axis
- Mean of time gravity acceleration on the X axis
- Mean of time gravity acceleration on the Y axis
- Mean of time gravity acceleration on the Z axis
- Std Dev of time gravity acceleration on the X axis
- Std Dev of time gravity acceleration on the Y axis
- Std Dev of time gravity acceleration on the Z axis
- Mean of time body acceleration jerk signals on the X axis
- Mean of time body acceleration jerk signals on the Y axis
- Mean of time body acceleration jerk signals on the Z axis
- Std Dev of time body acceleration jerk signals on the X axis
- Std Dev of time body acceleration jerk signals on the Y axis
- Std Dev of time body acceleration jerk signals on the Z axis
- Mean of time body gyro on the X axis
- Mean of time body gyro on the Y axis
- Mean of time body gyro on the Z axis
- Std Dev of time body gyro on the X axis
- Std Dev of time body gyro on the Y axis
- Std Dev of time body gyro on the Z axis
- Mean of time body gyro jerk signals on the X axis
- Mean of time body gyro jerk signals on the Y axis
- Mean of time body gyro jerk signals on the Z axis
- Std Dev of time body gyro jerk signals on the X axis
- Std Dev of time body gyro jerk signals on the Y axis
- Std Dev of time body gyro jerk signals on the Z axis
- Mean of the magnitude of time body acceleration
- Std Dev of the magnitude of time body acceleration
- Mean of the magnitude of time gravity acceleration
- Std Dev of the magnitude of time gravity acceleration
- Mean of the magnitude of time body acceleration jerk signals
- Std Dev of the magnitude of time body acceleration jerk signals
- Mean of the magnitude of time body gyro
- Std Dev of the magnitude of time body gyro
- Mean of the magnitude of time body gyro jerk signals
- Std Dev of the magnitude of time body gyro jerk signals
- Mean of frequency domain body acceleration on the X axis
- Mean of frequency domain body acceleration on the Y axis
- Mean of frequency domain body acceleration on the Z axis
- Std Dev of frequency domain body acceleration on the X axis
- Std Dev of frequency domain body acceleration on the Y axis
- Std Dev of frequency domain body acceleration on the Z axis
- Mean frequency of frequency domain body acceleration on the X axis
- Mean frequency of frequency domain body acceleration on the Y axis
- Mean frequency of frequency domain body acceleration on the Z axis
- Mean of frequency domain body acceleration jerk signals on the X axis
- Mean of frequency domain body acceleration jerk signals on the Y axis
- Mean of frequency domain body acceleration jerk signals on the Z axis
- Std Dev of frequency domain body acceleration jerk signals on the X axis
- Std Dev of frequency domain body acceleration jerk signals on the Y axis
- Std Dev of frequency domain body acceleration jerk signals on the Z axis
- Mean frequency of frequency domain body acceleration jerk signals on the X axis
- Mean frequency of frequency domain body acceleration jerk signals on the Y axis
- Mean frequency of frequency domain body acceleration jerk signals on the Z axis
- Mean of frequency domain body gyro on the X axis
- Mean of frequency domain body gyro on the Y axis
- Mean of frequency domain body gyro on the Z axis
- Std Dev of frequency domain body gyro on the X axis
- Std Dev of frequency domain body gyro on the Y axis
- Std Dev of frequency domain body gyro on the Z axis
- Mean frequency of frequency domain body gyro on the X axis
- Mean frequency of frequency domain body gyro on the Y axis
- Mean frequency of frequency domain body gyro on the Z axis
- Mean of the magnitude of frequency domain body acceleration
- Std Dev of the magnitude of frequency domain body acceleration
- Mean frequency of the magnitude of frequency domain body acceleration
- Mean of the magnitude of frequency domain body acceleration jerk signals
- Std Dev of the magnitude of frequency domain body acceleration jerk signals
- Mean frequency of the magnitude of frequency domain body acceleration jerk signals
- Mean of the magnitude of frequency domain body gyro
- Std Dev of the magnitude of frequency domain body gyro
- Mean frequency of the magnitude of frequency domain body gyro
- Mean of the magnitude of frequency domain body gyro jerk signals
- Std Dev of the magnitude of frequency domain body gyro jerk signals
- Mean frequency of the magnitude of frequency domain body gyro jerk signals
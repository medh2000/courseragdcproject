Title: Code Book 
========================================================
Author: Mohamed Hassan
Course project
========================================================
Getting and Cleaning Data
Date: 5/25/2014
John Hopkins/coursera Data Science
========================================================

Summary of source data

Human Activity Recognition Using Smartphones Dataset
Version 1.0
--------------------------------------------------------


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

========================================================


The dataset includes the following files:
----------------------------------------


- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 
All of these files are into separate variables

Transformations
---------------
1. Combine training and test data for X ( x_train + x_test) 
2. Combine training and test data for Y ( x_train + x_test) 
3. Apply tidy principles to transform features values into lower cases, remove letters such as (, -) and replace them with empty spaces 
4. Add headings x.train.test
5. Add headings to y.train.test
6. Combine subject.train and subject.test 
7. Rename columns variables to subject
8. Assign each y.train.test to its activity label in activity.label 
9. Only graps data with mean and std variables
10. Column Combine subject + y.train.test, observations with mean and std


```{r}
# tidy data set
df <- cbind(subject,y.train.test, df.mean, df.std)
```


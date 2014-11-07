Readme
========================================================

Author: Mohamed Hassan
Course project
========================================================
Getting and Cleaning Data
Date: 5/25/2014
John Hopkins/coursera Data Science
========================================================


R_analysis script

========================================================
This source code read multiples sources files into data frames
and create a tidy data frame df.
---------------------------------------------------------------
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
10. Combine subject + y.train.test, observations with mean and std
------------------------------------------------------------------------

```{r}
# tidy data set
source("run_analysis.R")
```

Link to Rpubs site
------------------

http://rpubs.com/medh2000/23987

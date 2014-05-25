# R script function
# Course project
# M. Hassan Getting and Cleaning Data
# John Hopkins/coursera Data Science

# Files to merge
# Predictors(input values): X_train + X_test
# Outcome values(numbers): y_train + y_test
# Label for variables: features.txt
# activity label text: 6 values names
# subject_train.txt
# subject_test.txt

# Read data sets:
# set up folder to read data from

  
mydir <- "./UCI HAR Dataset/"

################################## Readingdata #######################################
# Read X train and X test data sets:
X_train <- read.table(paste(mydir,"train/","X_train.txt", sep=""), quote="\"") #7352 obs.
X_test <- read.table(paste(mydir,"test/","X_test.txt", sep=""), quote="\"") #2947 obs.

# Read Y train and Y test data sets:
Y_train <- read.table(paste(mydir,"train/","y_train.txt", sep=""), quote="\"")
Y_test <- read.table(paste(mydir,"test/","y_test.txt", sep=""), quote="\"")

# Read subject train and subjects test
subject.train <- read.table(paste(mydir,"train/","subject_train.txt", sep=""), quote="\"") 
subject.test <- read.table(paste(mydir,"test/","subject_test.txt", sep=""), quote="\"") 

# Read features.txt file for X_train and Y_test labels
features <- read.table(paste(mydir,"features.txt", sep=""), quote="\"")

# Read activity labels (1-6 ) values
activity.label <- read.table(paste(mydir,"activity_labels.txt", sep=""), quote="\"")

################################## Merging and Cleanin data ###########################

#  Merge x values (input from both Test and Train)
x.train.test <- rbind (X_train, X_test) # 10299 obs.  of 561 vatiables

# merge y_train and y_test
y.train.test <- rbind (Y_train, Y_test) # 10299 obs.  of 1 variable

#rename values in features


features$V2 <- sapply(features$V2,tolower) # gives a dataframe

# lower case all features name
features$V2<-sapply(features$V2,tolower)

# remove (), , and - and tidy up data
features$V2 <- gsub("-", ".",features$V2) 
features$V2 <- gsub("\\()", "",features$V2)  
features$V2 <- gsub(",",".", features$V2)

# add headings x.train.test 
names(x.train.test) <- features[,2]

# add headings to y.train.test
names(y.train.test) <- "activity"

# merge subject.train and subject.test 
subject <- rbind( subject.train , subject.test) # total of 30 differents subjects
# rename columns variables to subject

colnames(subject)[1] <- "subject"

# assign each y.train.test to its activity label in activity.label 

for (i in 1:length(activity.label$V2)) { 
  y.train.test$activity <- gsub(i,activity.label$V2[i], y.train.test$activity)
}

# Final data frames
# 1- x.train.test: df with 10299 obs. of 561 variables
# 2- subjects: df with 10299 obs. of 1 variable
# 3- y.train.test : df with 10299 obs. of  1 variable

# only graps data with mean and std variables
df.mean <- df[,grep("mean", names(df))]
df.std <- df[,grep("std", names(df))]

# tidy data set
df <- cbind(subject,y.train.test, df.mean, df.std)




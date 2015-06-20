<<<<<<< HEAD
---
title: "Run_analysis.r explained"
author: "Petteri Moilanen"
date: "18.06.2015"
output: html_document
---
### Introduction

This is description of run_analysis.R, a R script file containing code for the Getting and Cleaning Data Course Project. The code is structured along the five tasks described in the project assignment, to wit:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The only "extra" library needed is dplyr.

```
library(dplyr)
```

### Task 1: Merging

First I read in all the data files from test and train data sets. They have been unzipped to UCI HAR Dataset folder under my working directory.

```
library(dplyr)
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt")
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
```

In the discussion forum in David's personal course project FAQ we were told that 
inertial folders weren't needed so I didn't bother with them.

Next I combine train and test data by rbind and then remove the original data frames:

```
X_all = rbind(X_train,X_test)
y_all = rbind(y_train,y_test)
sub_all = rbind(sub_train,sub_test)
rm(X_train,y_train,sub_train,X_test,y_test,sub_test)
```

Then I combine subject, activity and sample data into a single data frame:

```
the_lot = cbind(sub_all,y_all,X_all)
```

After that I rename columns for subject and activity to guess what:

```
names(the_lot)[1] = "subject"
names(the_lot)[2] = "activity"
```

### Task 2: Extracting means and standard deviations

The steps code line by line:

1. Read the "long" names of the sample data fields from features.txt. When the data was read in by read.table they were named V1, V2 etc.
2. c1 = all fields containing "mean()" in their name
3. c2 = all fields containing "std()" in their name
4. Combine c1 and c2 into cols.
5. Cols[,1] contains the indices (row numbers) of the desired fields which can be used to parse the names of the corresponding fields in the data frame. These are stored in cols2.
6. Use cols2 to subset these fields into the_lot2 data frame.

```
columns = read.table("./UCI HAR Dataset/features.txt")
c1 = columns[grep("mean()", columns$V2),]
c2 = columns[grep("std()", columns$V2),]
cols = rbind(c1,c2)
cols2 = paste("V",cols[,1],sep="")
the_lot2 = subset(the_lot, select=c("subject","activity",cols2))
```

### Task 3: Descriptive activity names

I think this part is self-explanatory:

```
labels = c("Walking","Walking upstairs","Walking downstairs","Sitting","Standing","Laying")
the_lot2 = mutate(the_lot2,activity=labels[activity])
```

The next line wasn't really necessary. Just to back up what's done until now. Will be using the_lot3 in remaining tasks.
```
the_lot3 = the_lot2
```

### Task 4: Descriptive variable names

Here I rename sample columns (V1, V2 etc.) with corresponding names read from features.txt. as.character is needed 'cause otherwise I would get the numerical representation of factor levels.

```
for(i in 1:nrow(cols)) {
  names(the_lot3)[i+2] = as.character(cols[i,2])
}
```
### Task 5: Outputting the final tidy data set

First I group by subject id and activity. Then I use summarise_each function from dplyr package (note "s" instead of "z" in fuction name) for averages. Computed averages in the final set have the same names as the columns from which they were computed. Finally I write the result into tidy_set.txt file in the working directory. The first row of the file contains column names. I have commented a code line for reading it in.

```
groups=group_by(the_lot3,subject,activity)
final_set = (groups %>% summarise_each(funs(mean)))
write.table(final_set, "tidy_set.txt", row.name=FALSE) 
# test = read.table("tidy_set.txt",header=TRUE)
```
=======
# Coursera-Getting-and-cleaning-data
>>>>>>> bf0dbd41d2520f74ef7c6fac4ee8a163bd5e7fbf

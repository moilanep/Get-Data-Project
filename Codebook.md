---
title: "Codebook"
author: "Petteri Moilanen"
date: "18.06.2015"
output: html_document
---

### Introduction

This is description of the output file **tidy_set.txt** of the Course project assignment. It's meant to read in conjuction with the **README.md** that describes the steps taken to produce the output. I'm assuming that the reader is familiar with the original data set so I won't describe it.

### The structure of the output file

The first line of the output file contains the column names inclosed in double quotes and separated by spaces. The following lines contain the data. Each row contains averaged data for one subject and one activity. 

The output file is meant to be read (if R is used) in the following fashion:
```{r}
#
# test = read.table("tidy_set.txt",header=TRUE)
```

### Data fields by name

Each data row of the file contains values for following fields. The column names of the first line of file are - for the sample data fields - the same names used in file **features.txt** included in the original data set.

**subject**

- Research subject id.

- Originally read from files subject_train.txt and subject_test.txt.

- Renamed in Task 1 described in README.md.

**activity**

- Descriptive name of the activity for which the sample data fields are summarized.

- Originally read from files **y_train.txt** and **y_test.txt** as a numeric code for activity.

- Renamed in Task 1 described in README.md.

- Code value replaced by descriptive name in Task 3.

**Sample data fields**

- The numbers below correspond to the field numbers in the **features.txt** help file. It also tells position - "indice" - of the column/field in the sample data files **X_test.txt** and **X_train.txt**. Because data files don't contain column names they were named V1, V2 etc. when read into data frame by read.table function. They were renamed in Task 4 described in README.md. Sample data was grouped by subject and activity in Task 5 and a mean (average) was counted for each field. These average fields in the output data set have the same names as the sample data fields.

1 tBodyAcc-mean()-X

2 tBodyAcc-mean()-Y

3 tBodyAcc-mean()-Z

4 tBodyAcc-std()-X

5 tBodyAcc-std()-Y

6 tBodyAcc-std()-Z

41 tGravityAcc-mean()-X

42 tGravityAcc-mean()-Y

43 tGravityAcc-mean()-Z

44 tGravityAcc-std()-X

45 tGravityAcc-std()-Y

46 tGravityAcc-std()-Z

81 tBodyAccJerk-mean()-X

82 tBodyAccJerk-mean()-Y

83 tBodyAccJerk-mean()-Z

84 tBodyAccJerk-std()-X

85 tBodyAccJerk-std()-Y

86 tBodyAccJerk-std()-Z

121 tBodyGyro-mean()-X

122 tBodyGyro-mean()-Y

123 tBodyGyro-mean()-Z

124 tBodyGyro-std()-X

125 tBodyGyro-std()-Y

126 tBodyGyro-std()-Z

161 tBodyGyroJerk-mean()-X

162 tBodyGyroJerk-mean()-Y

163 tBodyGyroJerk-mean()-Z

164 tBodyGyroJerk-std()-X

165 tBodyGyroJerk-std()-Y

166 tBodyGyroJerk-std()-Z

201 tBodyAccMag-mean()

202 tBodyAccMag-std()

214 tGravityAccMag-mean()

215 tGravityAccMag-std()

227 tBodyAccJerkMag-mean()

228 tBodyAccJerkMag-std()

240 tBodyGyroMag-mean()

241 tBodyGyroMag-std()

253 tBodyGyroJerkMag-mean()

254 tBodyGyroJerkMag-std()

266 fBodyAcc-mean()-X

267 fBodyAcc-mean()-Y

268 fBodyAcc-mean()-Z

269 fBodyAcc-std()-X

270 fBodyAcc-std()-Y

271 fBodyAcc-std()-Z

294 fBodyAcc-meanFreq()-X

295 fBodyAcc-meanFreq()-Y

296 fBodyAcc-meanFreq()-Z

345 fBodyAccJerk-mean()-X

346 fBodyAccJerk-mean()-Y

347 fBodyAccJerk-mean()-Z

348 fBodyAccJerk-std()-X

349 fBodyAccJerk-std()-Y

350 fBodyAccJerk-std()-Z

373 fBodyAccJerk-meanFreq()-X

374 fBodyAccJerk-meanFreq()-Y

375 fBodyAccJerk-meanFreq()-Z

424 fBodyGyro-mean()-X

425 fBodyGyro-mean()-Y

426 fBodyGyro-mean()-Z

427 fBodyGyro-std()-X

428 fBodyGyro-std()-Y

429 fBodyGyro-std()-Z

452 fBodyGyro-meanFreq()-X

453 fBodyGyro-meanFreq()-Y

454 fBodyGyro-meanFreq()-Z

503 fBodyAccMag-mean()

504 fBodyAccMag-std()

513 fBodyAccMag-meanFreq()

516 fBodyBodyAccJerkMag-mean()

517 fBodyBodyAccJerkMag-std()

526 fBodyBodyAccJerkMag-meanFreq()

529 fBodyBodyGyroMag-mean()

530 fBodyBodyGyroMag-std()

539 fBodyBodyGyroMag-meanFreq()

542 fBodyBodyGyroJerkMag-mean()

543 fBodyBodyGyroJerkMag-std()

552 fBodyBodyGyroJerkMag-meanFreq()




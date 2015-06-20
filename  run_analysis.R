library(dplyr)
#
# Reading the files from UCI HAR Dataset folder in my working directory.
# 
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt")
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
#
# Combining train and test data
#
X_all = rbind(X_train,X_test)
y_all = rbind(y_train,y_test)
sub_all = rbind(sub_train,sub_test)
#
# Removing the originals, since they are no longer needed
#
rm(X_train,y_train,sub_train,X_test,y_test,sub_test)
#
# Combining subject, activity and sample data
#
the_lot = cbind(sub_all,y_all,X_all)
#
# Renaming subject and activity columns
#
names(the_lot)[1] = "subject"
names(the_lot)[2] = "activity"
#
# Selecting mean and std columns
# 
columns = read.table("./UCI HAR Dataset/features.txt")
c1 = columns[grep("mean()", columns$V2),]
c2 = columns[grep("std()", columns$V2),]
cols = rbind(c1,c2)
cols2 = paste("V",cols[,1],sep="")
the_lot2 = subset(the_lot, select=c("subject","activity",cols2))
#
# Turning activity codes into labels
#
labels = c("Walking","Walking upstairs","Walking downstairs","Sitting","Standing","Laying")
the_lot2 = mutate(the_lot2,activity=labels[activity])
the_lot3 = the_lot2
#
# Renaming sample columns (V1, V2 etc.) with names read from features.txt
#
for(i in 1:nrow(cols)) {
  names(the_lot3)[i+2] = as.character(cols[i,2])
}
#
# Creating the final result set
#
groups=group_by(the_lot3,subject,activity)
final_set = (groups %>% summarise_each(funs(mean)))
write.table(final_set, "tidy_set.txt", row.name=FALSE) 
# 
# Line below was/can be used to test the output.
# test = read.table("tidy_set.txt",header=TRUE)

library(dplyr)
library(data.table)
library(psych)

#Merges the training and the test sets to create one data set.
features <- read.table('UCI HAR Dataset/features.txt',header=FALSE); #imports features.txt
activitytype <- read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE); #imports activity_labels.txt

#import all data
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", header = F)
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = F)
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)
#set up the names to describe the activites
colnames(activitytype) <- c('ActivityId','ActivityType');
colnames(subjecttrain) <- "SubjectId";
colnames(xtrain)  <- features[,2]; 
ytrain[,1] <- sapply(ytrain,function(x)activitytype[x,2]); # grab the activity type from the id
colnames(ytrain) <- "ActivityType"
colnames(subjecttest) <- "SubjectId";
colnames(xtest)  <- features[,2]; 
ytest[,1]  <- sapply(ytest,function(x)activitytype[x,2])# grab the activity type from the id
colnames(ytest) <- "ActivityType"
# merge the data
xy_subject_test <- cbind(xtest, ytest, subjecttest)
xy_subject_train <- cbind(xtrain, ytrain, subjecttrain)
test_training <- rbind(xy_subject_test, xy_subject_train)
test_training <- test_training[c(562,563,1:561)] # rearange the data to move activity type and subject id in col 1 and 2
#extract only the measurements on the mean and standard deviation
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
test_subset <-(test_training[,mean_and_std_features])
# independent tidy data set with the average of each variable
tidy_data <- test_subset %>% describe()%>% select(mean)
write.table(tidy_data,file = "tidy_data_Burnett.txt",row.name =FALSE )
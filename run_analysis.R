## Read data tables into R
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# label column names of train and test datasets
colnames(xtrain) <- features$V2
colnames(xtest) <- features$V2

# ID those variables that are mean/std
features2 <- features[grepl("-mean",features$V2)==TRUE | grepl("-std",features$V2)==TRUE,]

## subset data to just include mean/std variables
train_data <- xtrain[,c(features2$V1)]
test_data <- xtest[,c(features2$V1)]

## combine the activity label with the feature datasets 
library(plyr)
activity_train <- join(ytrain,activity_labels)
activity_test <- join(ytest,activity_labels)

train_data <- cbind(activity_train[,2],train_data)
colnames(train_data)[1] <- "activity"
test_data <- cbind(activity_test[,2],test_data)
colnames(test_data)[1] <- "activity"

## combine the subject identifier with the feature datasets
train_data <- cbind(subject_train,train_data)
colnames(train_data)[1] <- "subject_id"
test_data <- cbind(subject_test,test_data)
colnames(test_data)[1] <- "subject_id"

## combine and sort the datasets
c_data <- rbind(train_data,test_data)
c_data <- c_data[order(c_data$subject_id),]

## split the data and create a summary dataset
s_data <- split(c_data,list(c_data$subject_id,c_data$activity))

summary <- data.frame()

for(i in 1:180) {
        summary <- rbind(summary,
        as.data.frame(c(s_data[[i]][1,1:2],
        sapply(s_data[[i]][,3:81],mean))))
}

summary <- summary[order(summary$subject_id),]

write.table(summary,"tidytable.txt",row.names=FALSE)

## Define the raw data directory location (expected to be same as working directory) 
## and additional data files used to run the analysis
ddir <- "./UCI HAR Dataset/"
testSetFile <- paste(ddir,"test/X_test.txt",sep="")
testLabelFile <- paste(ddir,"test/Y_test.txt",sep="")
testSubjectFile <- paste(ddir,"test/subject_test.txt",sep="")
trainSetFile <- paste(ddir,"train/X_train.txt",sep="")
trainLabelFile <- paste(ddir,"train/Y_train.txt",sep="")
trainSubjectFile <- paste(ddir,"train/subject_train.txt",sep="")
activityLabelFile <- paste(ddir,"activity_labels.txt",sep="")

## Read the test set and test labels into a single test set
testSet <- read.table(testSetFile)
testLabels <- read.table(testLabelFile)
testSubjects <- read.table(testSubjectFile)
## Extract the test set to include standard deviation and mean
## This meets project requirement 2.
testSet$Standard.Deviation <- apply(testSet,1, sd, na.rm = TRUE)
testSet$Mean <- apply(testSet,1, mean, na.rm = TRUE)
## build the final test set with the label, standard deviation and mean
testSet <- cbind(Activity.Id = testLabels[,1]
                    , Subject.Id = testSubjects[,1]
                    , Standard.Deviation = testSet$Standard.Deviation
                    , Mean = testSet$Mean)

## Read the train set and train labels into a single train set
trainSet <- read.table(trainSetFile)
trainLabels <- read.table(trainLabelFile)
trainSubjects <- read.table(trainSubjectFile)
## Extract the train set to include standard deviation and mean
## This meets project requirement 2.
trainSet$Standard.Deviation <- apply(trainSet,1, sd, na.rm = TRUE)
trainSet$Mean <- apply(trainSet,1, mean, na.rm = TRUE)
## build the final train set with the label, standard deviation and mean
trainSet <- cbind(Activity.Id = trainLabels[,1]
                 , Subject.Id = trainSubjects[,1]
                 , Standard.Deviation = trainSet$Standard.Deviation
                 , Mean = trainSet$Mean)

## Merge test and training sets into a new complete set
## This meets project requirement 1.
completeSet <- rbind(trainSet,testSet)

## Load the activity Labels from the activity label file
## This meets project requirement 3
activityLabelSet <- read.table(activityLabelFile)
names(activityLabelSet) <- c("Activity.Id","Activity.Name")

## Add descriptive activity names to the complete set
## This meets project requirement 3 and 4
mergedSet <- merge(completeSet,activityLabelSet,by.x="Activity.Id",by.y="Activity.Id",all=TRUE)

## Create the second, independent tidy data set with the average of each variable for each activity and each subject. 
## Use aggregation by the Activity Name and Subject Id
## This meets project requirement 5
tidyDataSet <- aggregate(cbind(Standard.Deviation,Mean) ~  Activity.Id + Activity.Name + Subject.Id,mergedSet,mean)
## Write the tidy data set to file
write.table(tidyDataSet,file="tidyData.txt",sep=" ",row.names=FALSE)


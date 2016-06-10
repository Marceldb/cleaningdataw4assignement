### download and unzip 
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/projectData_getCleanData.zip")
Zippo <- unzip("./data/projectData_getCleanData.zip", exdir = "./data")

### load data
xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainsub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testsub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

### merging train and test data
trainData <- cbind(trainsub, ytrain, xtrain)
testData <- cbind(testsub, ytest, xtest)
fullData <- rbind(trainData, testData)

### mean and and standard deviation 
FeatName <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
FeatInd <- grep(("mean\\(\\)|std\\(\\)"), FeatName)
DatiFinal <- fullData[, c(1, 2, FeatInd+2)]
colnames(DatiFinal) <- c("subject", "activity", FeatName[FeatInd])

###descriptive activity names  
ActName <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
DatiFinal$activity <- factor(DatiFinal$activity, levels = ActName[,1], labels = activityName[,2])

###labels the data set with descriptive variable names.

names(DatiFinal) <- gsub("\\()", "", names(DatiFinal))
names(DatiFinal) <- gsub("^t", "time", names(DatiFinal))
names(DatiFinal) <- gsub("^f", "frequence", names(DatiFinal))
names(DatiFinal) <- gsub("-mean", "Mean", names(DatiFinal))
names(DatiFinal) <- gsub("-std", "Std", names(DatiFinal))

### Tidy data set  
library(dplyr)
groupbydata <- DatiFinal %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(groupbydata, "./data/tidy.txt", row.names = FALSE)
#1st part
features <- read.table("UCI HAR Dataset/features.txt")
features[,1] <- NULL

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

testdata <- cbind(subject_test,Y_test,X_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

traindata <- cbind(subject_train,Y_train,X_train)

fulldata <- rbind(testdata, traindata)

#2nd part
columnnames <- c("subject_id","activity", features[,1])
colnames(fulldata) <- columnnames

meanstddata <- select(fulldata, subject_id, activity, contains("mean()") | contains("std()"))

#3th part
meanstddata$activity <- factor(meanstddata$activity, labels = c("walking", "walking_upstais", "walking_downstairs", "sitting", "standing", "laying"))

#4th part
currColNames <- colnames(meanstddata)
currColNames <- sub("^t","time",currColNames)
currColNames <- sub("^f", "frequency", currColNames)
currColNames <- sub("\\(", "", currColNames)
currColNames <- sub("\\)", "", currColNames)
currColNames <- gsub("-", ".", currColNames)

colnames(meanstddata) <- currColNames

#1 part
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

#2 part
columnnames <- c("subject_id","activity", features[,1])
colnames(fulldata) <- columnnames

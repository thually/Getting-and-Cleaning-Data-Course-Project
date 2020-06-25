# CodeBook :P

## Original data and features
The following information attempts to explain the original meaning of the variables before any modification:  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


## New data set features

The features for the new data set submitted for this project are the average of each of the old variables that correspond to measurements on the mean and standard deviation for each measurement, grouped by each activity and each subject.


## run_analysis procedure
I will be using some function from the dplyr an tidyr package.

### 1st part
First, we upload every dataset needed for the assignment to R as dataframes.  
The 'features' set correspond to the names of the features (variables) measured.
The 'subject' sets correspond to the ids of the 30 volunteers, from the train and test part.  
The 'Y' sets correpond to the ids of the 6 different activities the volunteers where doing, from the train and test part.  
The 'X' sets correspond to the numeric data that was taken from the measurements of the features.

For each train and test part, the data was merged by columns as follow: 'subject', 'Y', 'X'. Then, the test and train data where merged by rows in that order.

### 2nd part
First, I created a new vector of names for the columns: the 'subject' variable is called 'subject_id', the 'Y' 'activities' and the rest of the 'X' variables kept the same name as in 'features'.

Then, I selected from the full merged dataset of part 1 those features that measured either the mean or the standard deviation for each measurement.

### 3rd part
I overwrote the 'activity' variable to be a factor and the six levels correspond to each of the activities.

### 4th part
For the variables names to be more descripted, I substituted the inicial "t" or "f" for "time" and "frequency". Also, some strange symbols as "()-" were removed or replace for ".". I decided to kept the capital letters for the variables to be easy to be read. 

### 5th part
Finally, I grouped the data set by 'subject_id' and 'activity', and created a new set summarizing the rest of the features by their average. The new variables have the same name as before, but with the subfix "TOTALMEAN", that means that every variable is a mean of a specific measurement. 
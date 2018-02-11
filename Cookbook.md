
# Getting and Cleaning Data 

## Merges the training and the test sets to create one data set.

1. The training and test data are loaded and combined using `rbind`

## Extracts only the measurements on the mean and standard deviation for each measurement.

1. Loaded the list of features
2. Used `grep` to find the columns with mean and std
3. Select only the columns based on the previous step

## Uses descriptive activity names to name the activities in the data set

1. Capitalized `mean` to `Mean` and `std` to `StdDev`
2. Removed dashes (`-`) and parentheses 
3. Renamed prefix `fBodyBody` to `fBody`

## Appropriately labels the data set with descriptive variable names.

1. Loaded the `activity_labels.txt`
2. Replaced the numbers with a descriptive label

## Create an independent tidy data set with the average of each variable for each activity and each subject.

1. Converted to data.table
2. Used `lapply` to find the mean for each activity and subject

### Data Source

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data used in this project can be downloaded at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data collection

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.




### Features/Attributes

For each record in the dataset it is provided: 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 



> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


A complete list of features are as follows:
- activity
- subject
- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccStdDevX
- tBodyAccStdDevY
- tBodyAccStdDevZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccStdDevX
- tGravityAccStdDevY
- tGravityAccStdDevZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkStdDevX
- tBodyAccJerkStdDevY
- tBodyAccJerkStdDevZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroStdDevX
- tBodyGyroStdDevY
- tBodyGyroStdDevZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkStdDevX
- tBodyGyroJerkStdDevY
- tBodyGyroJerkStdDevZ
- tBodyAccMagMean
- tBodyAccMagStdDev
- tGravityAccMagMean
- tGravityAccMagStdDev
- tBodyAccJerkMagMean
- tBodyAccJerkMagStdDev
- tBodyGyroMagMean
- tBodyGyroMagStdDev
- tBodyGyroJerkMagMean
- tBodyGyroJerkMagStdDev
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccStdDevX
- fBodyAccStdDevY
- fBodyAccStdDevZ
- fBodyAccMeanFreqX
- fBodyAccMeanFreqY
- fBodyAccMeanFreqZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkStdDevX
- fBodyAccJerkStdDevY
- fBodyAccJerkStdDevZ
- fBodyAccJerkMeanFreqX
- fBodyAccJerkMeanFreqY
- fBodyAccJerkMeanFreqZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroStdDevX
- fBodyGyroStdDevY
- fBodyGyroStdDevZ
- fBodyGyroMeanFreqX
- fBodyGyroMeanFreqY
- fBodyGyroMeanFreqZ
- fBodyAccMagMean
- fBodyAccMagStdDev
- fBodyAccMagMeanFreq
- fBodyAccJerkMagMean
- fBodyAccJerkMagStdDev
- fBodyAccJerkMagMeanFreq
- fBodyGyroMagMean
- fBodyGyroMagStdDev
- fBodyGyroMagMeanFreq
- fBodyGyroJerkMagMean
- fBodyGyroJerkMagStdDev
- fBodyGyroJerkMagMeanFreq

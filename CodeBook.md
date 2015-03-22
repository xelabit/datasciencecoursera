# List of variables
  * activity -- a six-level factor variable wich defines type of activity the
    person performed(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
	STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
  * subject -- a 30-level factor variable wich defines the number of a person
    participating in an experiment
  * features' means and standard deviations
## Features
	The features selected for this database come from the accelerometer and
	gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
	signals (prefix 't' to denote time) were captured at a constant rate of 50
	Hz. Similarly, the acceleration signal was then separated into body and
	gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using
	another low pass Butterworth filter with a corner frequency of 0.3 Hz.
	
	Subsequently, the body linear acceleration and angular velocity were
	derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
	tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals
	were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag,
	tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals
	producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
	fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
	signals).	
# Transformation of a data
    1. Data sets comprising information gathered from accelerometer and
       gyroscope of Samsung Galaxy S II, names of a 561-length feature vector,
	   activity labels, subject identifier for both test and training sets were
	   uploaded
    2. Then names of a features vector were assigned to the names of variables
       of both data sets (test and training).
    3. After that a new variable "activity" was added to data sets
    4. Variables "activity" and those denoting means and standard deviations
   	   were selected. In case of mean, only variables containing mean() part
	   were included since for other mean values there are no corresponding sd
	   values. For example there is a variable "tBodyAcc" which has both mean
	   and sd measurements. On the other side there is a variable "gravityMean"
	   which only has mean measurement.
    5. A new variable "subject" was added to both data sets.
    6. Then both data sets were united into one.
    7. Finally, a new data frame was derived containing mean values for each
       variable depending on two factors (activity and subject).	
		
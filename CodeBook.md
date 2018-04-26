Codebook explaining the different variables used and transformations applied for data cleaning project.
# Tidy data set description

Tidy data contains 180 rows and 68 columns. Each row has averaged variables for each subject and each activity.

### Variables in tidy data set
- subject - number identifier assigned to each person that volunteered in the project; range: 1-30
- activity - variable can take one of 6 possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) that correspond to activities performed by volunteers
- Average of * - average values calculated by subject by activity for only the measurements on the mean() and standard deviation - std() - for each measurement.
1. "subject"
2. "activity"
3. "Average of tBodyAcc-mean()-X"
4. "Average of tBodyAcc-mean()-Y"
5. "Average of tBodyAcc-mean()-Z"
6. "Average of tBodyAcc-std()-X"
7. "Average of tBodyAcc-std()-Y"
8. "Average of tBodyAcc-std()-Z"
9. "Average of tGravityAcc-mean()-X"
10. "Average of tGravityAcc-mean()-Y"
11. "Average of tGravityAcc-mean()-Z"
12. "Average of tGravityAcc-std()-X"
13. "Average of tGravityAcc-std()-Y"
14. "Average of tGravityAcc-std()-Z"
15. "Average of tBodyAccJerk-mean()-X"
16. "Average of tBodyAccJerk-mean()-Y"
17. "Average of tBodyAccJerk-mean()-Z"
18. "Average of tBodyAccJerk-std()-X"
19. "Average of tBodyAccJerk-std()-Y"
20. "Average of tBodyAccJerk-std()-Z"
21. "Average of tBodyGyro-mean()-X"
22. "Average of tBodyGyro-mean()-Y"
23. "Average of tBodyGyro-mean()-Z"
24. "Average of tBodyGyro-std()-X"
25. "Average of tBodyGyro-std()-Y"
26. "Average of tBodyGyro-std()-Z"
27. "Average of tBodyGyroJerk-mean()-X"
28. "Average of tBodyGyroJerk-mean()-Y"
29. "Average of tBodyGyroJerk-mean()-Z"
30. "Average of tBodyGyroJerk-std()-X"
31. "Average of tBodyGyroJerk-std()-Y"
32. "Average of tBodyGyroJerk-std()-Z"
33. "Average of tBodyAccMag-mean()"
34. "Average of tBodyAccMag-std()"
35. "Average of tGravityAccMag-mean()"
36. "Average of tGravityAccMag-std()"
37. "Average of tBodyAccJerkMag-mean()"
38. "Average of tBodyAccJerkMag-std()"
39. "Average of tBodyGyroMag-mean()"
40. "Average of tBodyGyroMag-std()"
41. "Average of tBodyGyroJerkMag-mean()"
42. "Average of tBodyGyroJerkMag-std()"
43. "Average of fBodyAcc-mean()-X"
44. "Average of fBodyAcc-mean()-Y"
45. "Average of fBodyAcc-mean()-Z"
46. "Average of fBodyAcc-std()-X"
47. "Average of fBodyAcc-std()-Y"
48. "Average of fBodyAcc-std()-Z"
49. "Average of fBodyAccJerk-mean()-X"
50. "Average of fBodyAccJerk-mean()-Y"
51. "Average of fBodyAccJerk-mean()-Z"
52. "Average of fBodyAccJerk-std()-X"
53. "Average of fBodyAccJerk-std()-Y"
54. "Average of fBodyAccJerk-std()-Z"
55. "Average of fBodyGyro-mean()-X"
56. "Average of fBodyGyro-mean()-Y"
57. "Average of fBodyGyro-mean()-Z"
58. "Average of fBodyGyro-std()-X"
59. "Average of fBodyGyro-std()-Y"
60. "Average of fBodyGyro-std()-Z"
61. "Average of fBodyAccMag-mean()"
62. "Average of fBodyAccMag-std()"
63. "Average of fBodyBodyAccJerkMag-mean()"
64. "Average of fBodyBodyAccJerkMag-std()"
65. "Average of fBodyBodyGyroMag-mean()"
66. "Average of fBodyBodyGyroMag-std()"
67. "Average of fBodyBodyGyroJerkMag-mean()"
68. "Average of fBodyBodyGyroJerkMag-std()"

# Transformations description

1. Download and unzip data into the current working directory
2. Read activity_labels.txt and features.txt files into activity_labels and features variables
3. Read files from the test folder: subject_test.txt, X_test.txt and y_test.txt into subject_test, test_data and test_labels variables respectively
4. Read files from the train folder: subject_train.txt, X_train.txt and y_train.txt into subject_train, train_data and train_labels variables respectively
5. Merge the training and the test sets to create one data set: 
	- merge test_labels and train_labels into labels with column name "activity"
	- merge subject_test and subject_train into subject with column name "subject"
	- merge test_data and train_data into data with column names from the features$V2
6. Extracts the measurements on the mean and standard deviation for each measurement in data
7. Merge subjects, labels and measurements into one data set
8. Update activity names using activity_labels to name the activities in the data set
9. Rearrange the columns and remove numeric labels (leaving only descriptive activity labels, e.g. "WALKING")
6. From the data set in previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject. Rename the variable names as "Average of *", where * is a variable name
7. Save the tidy data set to "UCI HAR Dataset" folder as "tidydata.txt"


# Initial data set description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:
-----
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:
-----
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.Feature Selection 

## Features description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

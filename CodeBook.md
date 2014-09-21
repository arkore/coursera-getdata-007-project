Coursera Getting and Cleaning Data Project Codebook
===================================================
The following data processing script and resultant output dataset is derived from the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

From the original code book provided with the original data:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying [3rd order low pass Butterworth (20Hz) and meadian] noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

Data frame Variable Structure
============================
Subjects were assigned a non-identifying number from 1-30 with no gaps which is found in the "subject" column.

Activities were classified into six categories using video recordings of the subjects. These categories are listed in the "activity" column. The possible categories are:

* Walking
* Walking_Upstairs
* Walking_Downstairs
* Sitting
* Standing
* Laying

Each feature has been averaged over all recorded observations for a given activity per subject. All features are coded using the following structure:

[f|t]Paramcode.[mean|std].[X|Y|Z]

Where the variables enclosed in [] represent the different options present in the dataset. Note that the .[X|Y|Z] is omitted when the parameter described does not have a Euclidean direction. Further information is provided below:

* t - Variable is averaged over the time domain
* f - Variable is averaged over the frequency domain by applying a FFT to the time domain data

Paramcode [units]
-----------------------
The following values can either be their X,Y,Z components (where it is followed by a .X,.Y,.Z respectively) or the calculated total magnitude represented by adding the suffix "Mag" to the following parameter code.

*BodyAcc		[m/s^2] - Acceleration due to body motion
*GravityAcc		[m/s^2] - Acceleration due to gravity
*BodyAccJerk	[m/s^3] - Jerk due to body motion (derived from the integration of BodyAcc)
*BodyGyro		[rad/s] - Angular acceleration due to body motion
*BodyGyroJerk	[rad/s^2] - Angular jerk due to body motion (derived from the integration of BodyGyro)

All units given are only indicative as the original data has been normalized and bounded between [-1,1].

* mean - Original variable is the mean of the recorded data slice
* std - Original variable is the standard deviation of the recorded data slice

* X - Parameter was recorded on the Euclidean X axis
* Y - Parameter was recorded on the Euclidean Y axis
* Z - Parameter was recorded on the Euclidean Z axis

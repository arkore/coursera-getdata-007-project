Coursera Getting and Cleaning Data Project
==========================================

This is a repo storing the script run_analysis.R that performs the functions required by the Coursera project in the Getting and Cleaning data course. The required functions for this script are as follows:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script achieves these required functions by first reading in a meaninful set of column names from the original dataset. It then uses a regex search to create a logical vector to subset the columns to those required by part 2. In this case I have chosen to ignore those columns that are used in the angle() data subset as these are created in a different manner from the other columns and so are more appropriate to subset elsewhere if needed. The column names are then lightly reformatted to satisfy the requirements of part 4.

The next stage of the script reads in the raw data from the training and test set, merging the subject number, the activity descriptor and the subsetted feature vector. When the dataset is subsetted using the logical vector to satisfy part 2, the tidy column names are applied to satisfy part 4. Once the raw data for the feature vector has been subsetted the remaining data is removed from the workspace to maintain a reasonable memory usage. With the entire data set for the test and training set now in memory in a tidy form they are then merged together to satify part 1.

Having completed part 1,2 and 4 the complete dataset is then summarized as required by part 5. The resulting dataframe is then sorted for asthetic reasons and the activity descriptor is transformed from a number to a meaningful string to satisfy part 3. The final tidy dataset is then written out to a file finishing the final requirement of part 5.

The written out table can be re-read into R using the following command:
    tidydata <- read.table("tidydata.txt",header=TRUE)

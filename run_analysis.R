# Coursera Obtaining and Cleaning Data course project
# ===================================================
#
# This script is intended to read data from the UCI Human Activity Recognition Using Smartphones Data Set
# and combine it, extract the mean and standard deviation of the various data sets then summarize the result
# and write to a file. For additional details please see README.md or follow the comments below:
#
# Assume working directory has already been set to the same directory the script is found in
#
# We could optimize using scan but as the final result will be a dataframe this seems excessive for this exercise


# The initial step is to prepare the descriptive names for the features
# =============================
# First we obtain the existing names of the features
features <- read.table("features.txt")
# Now using grep we create a logical vector to filter the columns with mean or std that we want in the end
colfilter <- sapply(features$V2,function(row) length(grep("mean\\(\\)|std\\(\\)",row)) > 0)
# Unfortunately R column names don't like the '-' or '()' chars. So we run a little magic to tidy up the names
# Note this will only be able to be applied to the subsetted feature vectors rather than the entire dataframe
recolname <- sapply(as.character(features$V2[colfilter]), 
                    function(row)
                      paste(unlist(strsplit(x=as.character(row), split="-|\\(\\)-|\\(\\)", fixed=FALSE)),
                            collapse="."))


# Collate a dataframe for the training data
# =============================
# First read in the subject numbers as a factor
subject_train <- read.table("train/subject_train.txt",col.names="subject",colClasses="factor")
# Then read in the activity as a factor
y_train <- read.table("train/y_train.txt",col.names="activity",colClasses="factor")

# Now bring in the feature data where we auto name the columns from the feature table (note the names are messed up a little for now)
x_train <- read.table("train/X_train.txt",col.names=features$V2)

# Filter out the columns we want
trainfeatures <- x_train[,colfilter]
# Rename the columns in the cleaner form we generated before
names(trainfeatures) <- recolname

# Remove the x_train data as it is very large and hogging memory
rm(x_train)

# Bind it all together ready to use rbind to add in the test dataset
traindf <- cbind(subject_train, y_train, trainfeatures)


# Repeat the same tricks above with the test data
# =============================
# First read in the subject numbers as a factor
subject_test <- read.table("test/subject_test.txt",col.names="subject",colClasses="factor")
# Then read in the activity as a factor
y_test <- read.table("test/y_test.txt",col.names="activity",colClasses="factor")

# Now bring in the feature data where we auto name the columns from the feature table (note the names are messed up a little for now)
x_test <- read.table("test/X_test.txt",col.names=features$V2)

# Filter out the columns we want
testfeatures <- x_test[,colfilter]
# Rename the columns in the cleaner form we generated before
names(testfeatures) <- recolname

# Remove the x_test data as it is very large and hogging memory
rm(x_test)

# Bind it all together ready to use rbind to add in the test dataset
testdf <- cbind(subject_test, y_test, testfeatures)


# With all the data gathered now we can bind both sets into a single dataset
# =============================
ucihumandf <- rbind(testdf,traindf)

# with our final dataset we now need to create a summary of the data by subject by activity
# =============================
# Use the aggregate function to take the mean of the retained values by subject and activity
finaloutput <- aggregate(. ~ subject + activity,data=ucihumandf,FUN=mean)
# For asthetics sake reorder by subject number
library(plyr)
finaloutput <- arrange(finaloutput,as.numeric(as.character(subject)))
# Finally, relabel the activities so that they are more meaningful
finaloutput$activity <- revalue(finaloutput$activity, c("1"="Walking","2"="Walking_Upstairs","3"="Walking_Downstairs","4"="Sitting","5"="Standing","6"="Laying"))
# And write out the final submission file
write.table(finaloutput,file="tidydata.txt", row.names=FALSE)
# Data can be returned into R using the code:
# tidydata <- read.table("tidydata.txt",header=TRUE)
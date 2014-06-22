Getting_and_cleaning_data_course_project
========================================

The file run_analysis.R file does the following:
------------------------------------------------

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Description:
------------

The script works in three parts:

* First, it merges the training set data with the test set data. 
* Second, it get a subset from the data created above with just the mean and standard deviation of the data
*Finally, it melts the data, replaces column names with titles that are more clear and it creates the tidy data set to a file called tidy_data.txt

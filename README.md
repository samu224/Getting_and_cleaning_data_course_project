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

* First, it creates all necessary variables from the text files provided, then once all of the variables are created, we move to first merge the data with the propper labels for both train and test data and then we merge both test and train data to create one data set called `complete_data_set` 
* Second, we grab the features from its respective file, we grab only the mean and std from the file and perform a subset on the data in order to only pull the data we are interested on
* Finally, it melts the data, replaces column names with titles that are more clear and it creates the tidy data set to a file called tidy_data.txt

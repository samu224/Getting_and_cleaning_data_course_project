# CodeBook
This code book describes all the variables used in the script run_analysis.R

For this code book, we will be assumig that the necessary data was unzipped in the same directory as the file run_analysis.R
The file should be included this way

```
source("run_analysis.R")
```

## Variables

 - `test_set` contains the columns of raw data in the test set and comes from the file `X_test.txt`
 - `train_set` contains the columns of raw data in the training set and comes from the file `X_test.txt` 
 - `activity_labels` has the different types of activities: `WALKING`, `SITTING`.. and it comes from `activity_labels.txt`
 - `train_labels` has all the subject data for the train data set. it comes from `subject_train.txt`
 - `test_labels` has all the subject data for the test data set. it comes form `subject_test.txt`
 - `y_train` has all the labels for the train data. it comes from `y_tran.txt`
 - `x_test` has all the labels for the test data set. it comes from 'y_test.txt'
 - `y_train_labels` merged label data based on activity for train set
 - `y_test_labels`  merged label data based on activity for test set
 - `train_set` merged train set data with labels
 - `test_set` merged test set data with labels
 - `complete_data` merged data set including test data and train data
 - `features` contains all features and its names. comes form `features.txt`
 - `mean_std_rows` extracts the mean() and std() columns from the complete data set.
 - `mean_col` extracts the  mean() columns.
 - `std_cols` extracts the std() columns.
 - `measurements_vect` vector containing the mean and std cols
 - `cleaned_data_set` cleaned data set with columns:  mean, std, Suject, Activity, and Activity Id
 - `melted_data` data left after performing a melt_data on the clean_data
 - `tidy_data` mean of the related activities across the different variables. obtained using dcast()
 - `col_names` contains the cleaned column names for the data set. 
 - `tidy_data` the data we are looking for with the column names described above
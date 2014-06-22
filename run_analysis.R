
directory <- "UCI HAR Dataset"
require(reshape2)

## 1 - merge the training and test set data to create on data set

## get the dataset in test and train sets
test_set <- read.table(paste("./", directory, "/test/X_test.txt", sep=""));
train_set <- read.table(paste("./", directory, "/train/X_train.txt", sep=""))

## retireves the activity labels
activity_labels <- read.table(paste("./", directory, "/activity_labels.txt", sep=""))

## get the test and train labels
train_labels <- read.table(paste("./", directory, "/train/subject_train.txt", sep=""))
test_labels <- read.table(paste("./", directory, "/test/subject_test.txt", sep=""))

## read the test and training y labels
y_train <- read.table(paste("./", directory, "/train/y_train.txt", sep=""))
y_test <- read.table(paste("./", directory, "/test/y_test.txt", sep=""))

## merge y test and training activity labels
y_train_labels <- merge(y_train,activity_labels,by="V1")
y_test_labels <- merge(y_test,activity_labels,by="V1")

## merge the test and training data and the respective labels together
train_set <- cbind(train_labels,y_train_labels,train_set)
test_set <- cbind(test_labels,y_test_labels,test_set)

## merge the test and training data together
complete_data_set <- rbind(train_set,test_set)

## 2 - grabs the mean and standard deviation for the data set passed in
features <- read.table(paste("./", directory, "/features.txt", sep=""))

## get the rows where the name is mean and std
mean_std_rows <- subset(features,  grepl("(mean\\(\\)|std\\(\\))", features$V2) )

## add the column headers to the data set
colnames(complete_data_set) <- c("Subject","Activity_Id","Activity",as.vector(features[,2]))

## extract the data from the merged data where the column names are mean OR std
mean_col <- grep("mean()", colnames(complete_data_set), fixed=TRUE)
std_col <- grep("std()", colnames(complete_data_set), fixed=TRUE)

## add mean and std columns into single vector
measurements_vect <- c(mean_col, std_col)

## sort the vector 
measurements_vect <- sort(measurements_vect)

cleaned_data_set <- complete_data_set[,c(1,2,3,measurements_vect)]

## 3-5
melted_data <- melt(cleaned_data_set, id=c("Subject","Activity_Id","Activity"))

tidy_data <- dcast(melted_data, formula = Subject + Activity_Id + Activity ~ variable, mean)

## replace column names with something that makes more sense
col_names <- colnames(tidy_data)
col_names <- gsub("-mean()","Mean",col_names,fixed=TRUE)
col_names <- gsub("-std()","Standard Deviation",col_names,fixed=TRUE)
col_names <- gsub("BodyBody","Body",col_names,fixed=TRUE)

## put back in the tidy column names
colnames(tidy_data) <- col_names

## write the output into a file
write.table(tidy_data, file="./tidy_data.txt", sep="\t", row.names=FALSE)

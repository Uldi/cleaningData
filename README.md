# cleaningData
Course project for Module getting and cleaning data

## run_analysis.R
This script consists of 3 functions
* getCleanDataSet() - returns the cleaned data set (merge of train and test datasets, reduced to std and mean columns, added activity and subject columsn
* getDataSetWithAverageData(dataSet) - returns a data set with the average data of each variable for each activity and each subject
* run_analysis() - merges and cleans the test and train datasets. Then creates the
the dataset with the averages per variable, activity and subjects and writes
to a text file called "averageDataSet.txt"

## code book
The resulting data set contains the following variables
* acticity - the activity the subject has done: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* subject - values 1 - 30, 30 test person
* variables with mean and std values of the sensors. For details see file features_info.txt in 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## reference
This programming assignment is based on the following publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

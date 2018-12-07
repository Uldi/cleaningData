## This file provides functions to prepare tidy data that can be used for later analysis. 

## This function merges and cleans the test and training data
getCleanDataSet <- function() {
    
    #load  training and test data sets
    xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
    yTestData <- read.table("./UCI HAR Dataset/test/y_test.txt")
    testSubjectData <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
    yTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt")
    trainSubjectData<- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    #merge test and train data sets
    xData <- rbind(xTestData, xTrainData)
    yData <- rbind(yTestData, yTrainData)
    subjectData <- rbind(testSubjectData, trainSubjectData)
    
    #read features and rename col names according to features
    #first column is named activity
    features <- read.table("./UCI HAR Dataset/features.txt")
    
    #filter features first on mean and std values
    fdf <- tbl_df(features)
    fdfFiltered <- filter(fdf, grepl("mean", V2)| grepl("std", V2))
    
    #make descriptive variable names 
    cNames <- fdfFiltered$V2
    cNames <- tolower(cNames)
    cNames <- gsub("-", "", cNames, fixed=TRUE)
    cNames <- gsub("()", "", cNames, fixed=TRUE)
    
    #select mean and std columns from xData and rename columns with featurenames
    selColXData <- select(xData, fdfFiltered$V1)
    colnames(selColXData) <- cNames
    colnames(yData) <-c("activity")
    colnames(subjectData) <- c("subject")
    
    #merge activities and data
    selData <- cbind(subjectData, yData, selColXData)
    
    #name activity variables
    activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
    selData <- mutate(selData, activity = activities[activity,2])
    selData
}

#this function returns a data set with the average data of each variable 
#for each activity and each subject
getDataSetWithAverageData <- function(dataSet) {
    avData <- group_by(dataSet, activity, subject)
    summarize_at(avData, 3:81, mean)
}

#this function merges and cleans the test and train datasets. Then creates the
#the dataset with the averages per variable, activity and subjects and writes
#to a text file called "averageDataSet.txt"
run_analysis <- function() {
    ds <- getCleanDataSet()
    avds <- getDataSetWithAverageData(ds)
    write.table(avds, "averageDataSet.txt", row.name=FALSE)
}


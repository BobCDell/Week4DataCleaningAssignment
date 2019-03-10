
##------------------/ BEGIN DOWNLOAD AND UNZIP THE DATA FILE /-------------------------------------//
##   This section of code, while not explicitly a part of the stated project requirements,
##is nevertheless required to obtain the data for the subsequent analysis.  
##  First, we need to download and unzip the data file:
##  (If the data directory doesn't exist, create it.)

dirName <- "./Data"
if(!file.exists(dirName)){dir.create(dirName)}

##  Create the .zip file download path variable
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##  We'll rename the file when downloading it
fileName <- "./data/Week4Dataset.zip"

##  Now download and rename the zipped datafile.
download.file(fileUrl,destfile=fileName)

##N ext step, unzip the data file to the ./Data directory and rename it
unzip(zipfile=fileName,exdir=dirName)

##-----------------/ END DOWNLOAD AND UNZIP DATA FILE /---------------------------------------------//

##-----------------/ BEGIN DATA EXTRACTION AND COMBINAION /-----------------------------------------//

##  Now let's get the appropriate unzipped tables:
##  First, the activity labels:
actLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
##  Now let's take a look at it verify that it looks okay.  (Uncomment next line to do this.)
#str(actLabels)

##  EVerything check out?  Great, now let's get the features table:
features <- read.table('./data/UCI HAR Dataset/features.txt')
##  Again, let's verify that the data looks reasonable.  (Uncomment next line to do this.)
#str(features)

##  Now that we have--and have verified--the ancillary information, let's get the data that's going to
##concern us.
##  First, the training information:
##  Grab the training dataset.
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
##  Grab the training data labels.
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
##  Extract the training subjects as well.
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#str(xTrain)          

##  Rename the training columns using the second column of the features table
colnames(xTrain) <- features[,2] 

##  Give the only column in the y_train data table a more meaningful name
colnames(yTrain) <-"activityId"

##  Give  the only column in the subject_train data table a more meaningful name
colnames(subjectTrain) <- "subjectId"

##  Second, the test information
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
##  Now extract the test subjects 
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

##  As with the training table, rename the test columns using the second column of the features table
colnames(xTest) <- features[,2]

##  Give the only column in the y_test data table a more meaningful name
colnames(yTest) <- "activityId"

##  Give  the only column in the subject_test data table a more meaningful name
colnames(subjectTest) <- "subjectId"

##  Now rename the columns of the actLabels table to meaningful values'
colnames(actLabels) <- c('activityId','activityType')

##  Now we'll combine the training tables
mergedTrain <- cbind(yTrain, subjectTrain, xTrain)

##  Likewise, combine the test tables
mergedTest <- cbind(yTest, subjectTest, xTest)

##  Ensure that everything looks okay. (Uncomment following lines to inspect resulting tables)
#str(mergedTrain)
#str(mergedTest)

##  After verifying that both tables have the same structure, combine training and test tables
mergedTrainAndTest <- rbind(mergedTrain, mergedTest)

##-----------------/ END DATA EXTRACTION AND COMBINAION /-----------------------------------------//

##-----------------/ BEGIN TIDY DATA SET CREATION /-----------------------------------------------//

##  Create vector of column names from the combined table
columnNames <- colnames(mergedTrainAndTest)
##length(columnNames)

##  Now extract the Boolean array of variables containing means and standard deviations (Along with
##the required activity and subject IDs)
extractMeansAndStdDevs <- (grepl("activityId" , columnNames) | grepl("subjectId" , columnNames) | 
                                      grepl("mean.." , columnNames) | grepl("std.." , columnNames) )

##  Use this Boolean array to create the subset of the data containing these variables
justMeansAndStdDevs <- mergedTrainAndTest[,extractMeansAndStdDevs == TRUE]
#str(justMeansAndStdDevs)

# Now clean up the column names in this dataset
colnames(justMeansAndStdDevs) <- gsub("^t","Time", colnames(justMeansAndStdDevs))
colnames(justMeansAndStdDevs) <- gsub("^f", "Freq", colnames(justMeansAndStdDevs))
colnames(justMeansAndStdDevs) <- gsub("-mean","Mean", colnames(justMeansAndStdDevs), ignore.case = TRUE)
colnames(justMeansAndStdDevs) <- gsub("-std", "Sigma", colnames(justMeansAndStdDevs), ignore.case = TRUE)
colnames(justMeansAndStdDevs) <- gsub("Acc","Accelerometer", colnames(justMeansAndStdDevs))
colnames(justMeansAndStdDevs) <- gsub("bodybody","Body", colnames(justMeansAndStdDevs), ignore.case = TRUE)
colnames(justMeansAndStdDevs) <- gsub("Mag", "Magnitude", colnames(justMeansAndStdDevs))

##  Now for the creation of the final tidy dataset.  Aggregate the dataset by the "average"/mean
##of each variable for each activity and each subject.

finalTidyDataSet <- aggregate(. ~subjectId + activityId, 
                              justMeansAndStdDevs , mean)

##Add in the meaningful names for the activities
finalTidyDataSet <- merge(finalTidyDataSet, actLabels, by='activityId', all.x = TRUE)

##  Reorder the final tidy dataset by subject ID and then by activity ID
finalTidyDataSet <- finalTidyDataSet[order(finalTidyDataSet$subjectId, finalTidyDataSet$activityId),]

##  And finally, save the final tidy dataset in .txt format to the data subirectory/
finalTidyDataSetName <- "./data/finalTidyDataSet.txt"

write.table(finalTidyDataSet, finalTidyDataSetName, row.name=FALSE)

##-----------------/ END TIDY DATA SET CREATION /-----------------------------------------------//

---
title: "README"
author: "Bob Coon"
date: "March 10, 2019"
output: html_document
---
This README file describes the function of the R script run_analysis.R written for the Coursera Getting and Cleaning Data Week 4 
course project.  This R script prepares a final tidy dataset with sensible variable names from several training and test datasets 
furnished for this exercise.

The script structure is as follows:

NOTE: The user must ensure that she/he has specified the correct Working Directory using the standard R command setwd() to ensure
that the data files are placed and processed in the correct file locations

The section of code delimited by the "-------/ BEGIN/END DOWNLOAD AND UNZIP THE DATA FILE /------" borders:
This section of code performs the following steps:

1. Checks to see if the Data file directory exists in the working directory.  If the Data directory does not exist, then this code creates it. 
	(if(!file.exists(dirName)){dir.create(dirName)})
2. Downloads the zipped data directory from the location specified in the project instructions using the download.file() method and renames it. 
	(download.file(fileUrl,destfile=fileName))
3. Unzips the data files contained within the zipped data directory, resulting in the creation of the UCI HAR Dataset folder and associated subfolders, and places the data files in the appropriate folder locations under the Data directory.
	(unzip(zipfile=fileName,exdir=dirName))

The section of code delimited by the "-------/ BEGIN/END DATA EXTRACTION AND COMBINATION /---" borders.
This section of code performs the following steps:

4.  Extracts information from the features (features <- read.table....) and activities 
      (actLabels = read.table....) datasets.
5.  Extracts the data (xTrain/xTest), activity labels (yTrain/yTest), and subjects
      (subjectTrain/subjectTest) for both the training and test data sets.
6.  Renames the columns of the training/test data sets to more meaningful values using the second column of the features data table. 
	    (colnames(xTrain) <- features[,2]); colnames(xTest) <- features[,2]
7.  Renames the columns of the training/test activity label and subject tables to more meaningful values.
	    (colnames(subjectTest) <- "subjectId") and (colnames(actLabels) <- c('activityId','activityType'))
8.  Merges the three (3) training tables to create the mergedTrain dataset. 
	    (mergedTrain <- cbind(yTrain, subjectTrain, xTrain))  
9.  Merges the three (3) test tables to create the mergedTest dataset. 
	    (mergedTest <- cbind(yTest, subjectTest, xTest)) 
10. Merges the two (2) tables created in steps 7 & 8 immediately above to produce a single dataset containing both training and 	test data.  
	(mergedTrainAndTest <- rbind(mergedTrain, mergedTest))

The section of code delimited by the "-------/ BEGIN TIDY DATA SET CREATION /----" borders.
This section of code performs the following steps:

11.  Creates a vector of column names from the merged training and test dataset created in steps 4 - 10 above.
	(columnNames <- colnames(mergedTrainAndTest))
12.  Creates a Boolean array identifying those column names containing the string values "mean" and "std" using grepl() to determine which variables contain mean and standard deviation information.  (This array also incudes activity and subject information.)
	(extractMeansAndStdDevs <- (grepl("activityId" , columnNames) | grepl("subjectId" , columnNames) | 
                                      grepl("mean.." , columnNames) | grepl("std.." , columnNames) ))
13.  Using the Boolean array created in step 12, the script merges it with the dataset containing training and test data to produce a dataset containg training and test mean and standard deviation data.
	    (justMeansAndStdDevs <- mergedTrainAndTest[,extractMeansAndStdDevs == TRUE])
  
14.  Renames the columns in the dataset created in step 14. to more meaningful values using a sequence of gsub() steps.
    (colnames(meansAndStdDevsWithActivityNames) <- gsub("^t","Time",
          colnames(meansAndStdDevsWithActivityNames))
								...
	        colnames(meansAndStdDevsWithActivityNames) <- gsub("Mag", "Magnitude",
	           colnames(meansAndStdDevsWithActivityNames)))
15.  Creates the final tidy dataset by aggregating the values in this dataset by mean by activity and subject.
        	(finalTidyDataSet <- aggregate(. ~subjectId + activityId, 
                              meansAndStdDevsWithActivityNames , mean))
                              
16.  Adds the activity names to this tiny dataset by merging it with the activity labels dataset created in step 4. above.                                
           (finalTidyDataSet <- merge(finalTidyDataSet, actLabels, by='activityId', all.x = TRUE))  
           
17.  Orders the final tidy dataset by subject and activity.
	    (finalTidyDataSet <- finalTidyDataSet[order(finalTidyDataSet$subjectId,
	      finalTidyDataSet$activityId),])
	      
18.  Writes this data set to the Data directory of the user's working directory.
	      (finalTidyDataSetName <- "./data/finalTidyDataSet.txt")

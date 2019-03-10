title: Getting and Cleaning Data Course Project Codebook
author: Bob Coon
date: 9 Mar 2019
output:  The result of this project is a tidy dataset in .txt file format.

---

## Project Description
Verbatim from the assignment (https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project):
"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained."


##Study design and data processing
The purpose of this project is to download data from several different files, combine it, and clean it to produce a final, "tiny" dataset for subsequent use.  No real 'study' is involved; this project involves data collection, aggregation, and scrubbing.

The result of this project is a tidy dataset (finalTidyDataSet.txt) in .txt file format, along with the 
R script (run_analysis.R), the README.md file, and this CodeBook.md file.


###Collection of the raw data
The raw data was downloaded in a .zip file from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
After download, the files were extracted from the zipped datafile to the working directory /data subdirectory using standard R unzip() functionality.


###Notes on the original (raw) data
The original data consists of the following files: 
Four (4) files that apply to both training and test data:
a.  activity_labels.txt - "Links the class labels with their activity name.""
b.  features.txt - "List of all features" in the data.
c.  features_info.txt - "Shows information about the variables used on the feature vector.""
d.  README.txt
Tne training and test data resides in folders named "train" and "test" respectively and consists of three (3) files apiece: 
a. X_test.txt/x_train.txt - The test and training datasets, respectively.
b. y_test.txt/x_train.txt - The test and training dataset labels, respectively.
c. subject_test/subject_train - "Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30."

Some additional notes on the data:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- Both training and test data included raw accelerometer signal data contained in an Inertial Signals folder found within the train/test folder.  This data is unnecessary for the scope of this project.

##Creating the tidy datafile
THe tidy data file is created by downloading the zipped data file from the location given in the
project, unzipping it in the /Data subdirectory of the working directory, then combining the 
training and testing data files to produce a dataset containing both training and test data.  This
combined dataset is then winnowed-down to produce the final, tidy dataset.  Variables are renamed
along the way to providet them with more meaningful names.  The README.md file for this project
provides a detailed description of this process (Please see immediately below).


###Cleaning of the data
See the README.md file associate with this project for further info.


##Description of the variables in the tiny_data.txt file
-The final tiny data set is 180 rows by 82 columns
-This structure results from the fact that the data consists of measurement values on
    six (6) types of activties (listed for the activityID variable below) for each of 
    30 subjects, thus resulting in 180 records/rows.  The 82 variables are those variables
    containing mean and standard deviation (sigma) information for the measurements along
    with test subject and activity information.
-The individual Variables present in the dataset are listed immediately below:

 subjectId                                   Data Type: Integer value from 1 to 30.  Identifies the
                                                  subject for whom the data was collected.
 activityId                                  Data Type: Integer value from 1 to 6.  Identifies the 
                                                  type of activity for which the data was collected:
                                                   1 WALKING
                                                   2 WALKING_UPSTAIRS
                                                   3 WALKING_DOWNSTAIRS
                                                   4 SITTING
                                                   5 STANDING
                                                   6 LAYING
 TimeBodyAccelerometerMean()-X      (g -standard gravity units)  
                                      Data Type: Decimal (Normalized between -1 and1)  
 TimeBodyAccelerometerMean()-Y      (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and1)  
 TimeBodyAccelerometerMean()-Z      (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and1)  
 TimeBodyAccelerometerSigma()-X     (g -standard gravity units)         
                                      Data Type: Decimal (Normalized between -1 and1)  
 TimeBodyAccelerometerSigma()-Y     (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and 1)
TimeBodyAccelerometerSigma()-Z      (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeGravityAccelerometerMean()-X   (g -standard gravity units)           
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeGravityAccelerometerMean()-Y   (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeGravityAccelerometerMean()-Z   (g -standard gravity units)           
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeGravityAccelerometerSigma()-X  (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeGravityAccelerometerSigma()-Y  (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeGravityAccelerometerSigma()-Z  (g -standard gravity units)  
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyAccelerometerJerkMean()-X  (g -standard gravity units)       
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyAccelerometerJerkMean()-Y  (g -standard gravity units)         
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyAccelerometerJerkMean()-Z  (g -standard gravity units)         
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyAccelerometerJerkSigma()-X (g -standard gravity units) 
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyAccelerometerJerkSigma()-Y (g -standard gravity units)
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyAccelerometerJerkSigma()-Z (g -standard gravity units) 
                                      Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyGyroMean()-X               (radians/second) Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyGyroMean()-Y               (radians/second) Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyGyroMean()-Z               (radians/second) Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyGyroSigma()-X              (radians/second) Data Type: Decimal (Normalized between -1 and 1)
 TimeBodyGyroSigma()-Y              (radians/second) Data Type: Decimal (Normalized between -1 and 1)  
 TimeBodyGyroSigma()-Z              (radians/second) Data Type: Decimal (Normalized between -1 and 1)  
 TimeBodyGyroJerkMean()-X           (radians/second) Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkMean()-Y           (radians/second) Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkMean()-Z           (radians/second) Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkSigma()-X          (radians/second) Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkSigma()-Y          (radians/second) Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkSigma()-Z          (radians/second) Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyAccelerometerMagnitudeMean()      (g -standard gravity units) 
                                            Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyAccelerometerMagnitudeSigma()     (g -standard gravity units) 
                                            Data Type: Decimal (Normalized between -1 and 1) 
 TimeGravityAccelerometerMagnitudeMean()   (g -standard gravity units) 
                                            Data Type: Decimal (Normalized between -1 and 1) 
 TimeGravityAccelerometerMagnitudeSigma()  (g -standard gravity units) 
                                            Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyAccelerometerJerkMagnitudeMean()  (g -standard gravity units)    
                                            Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyAccelerometerJerkMagnitudeSigma() (g -standard gravity units)    
                                            Data Type: Decimal (Normalized between -1 and 1)  
 TimeBodyGyroMagnitudeMean()               (radians/second) 
                                             Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroMagnitudeSigma()              (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkMagnitudeMean()           (radians/second)   
                                             Data Type: Decimal (Normalized between -1 and 1) 
 TimeBodyGyroJerkMagnitudeSigma()          (radians/second)   
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerMean()-X             (g -standard gravity units)   
                                              Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerMean()-Y             (g -standard gravity units)    Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerMean()-Z             (g -standard gravity units)    Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerSigma()-X            (g -standard gravity units)    Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerSigma()-Y            (g -standard gravity units)    Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerSigma()-Z            (g -standard gravity units)    Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerMeanFreq()-X         (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerMeanFreq()-Y         (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyAccelerometerMeanFreq()-Z         (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1)    
 FreqBodyAccelerometerJerkMean()-X         (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1)    
 FreqBodyAccelerometerJerkMean()-Y         (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyAccelerometerJerkMean()-Z         (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyAccelerometerJerkSigma()-X        (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyAccelerometerJerkSigma()-Y        (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyAccelerometerJerkSigma()-Z        (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyAccelerometerJerkMeanFreq()-X     (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerJerkMeanFreq()-Y     (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyAccelerometerJerkMeanFreq()-Z     (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMean()-X                      (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMean()-Y                      (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMean()-Z                      (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroSigma()-X                     (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroSigma()-Y                     (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroSigma()-Z                     (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMeanFreq()-X                  (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMeanFreq()-Y                  (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMeanFreq()-Z                  (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerMagnitudeMean()      (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerMagnitudeSigma()     (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerMagnitudeMeanFreq()  (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerJerkMagnitudeMean()  (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerJerkMagnitudeSigma() (g -standard gravity units)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyAccelerometerJerkMagnitudeMeanFreq() (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMagnitudeMean()               (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMagnitudeSigma()              (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroMagnitudeMeanFreq()             (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1)  
 FreqBodyGyroJerkMagnitudeMean()           (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1) 
 FreqBodyGyroJerkMagnitudeSigma()          (radians/second)
                                             Data Type: Decimal (Normalized between -1 and 1)   
 FreqBodyGyroJerkMagnitudeMeanFreq()       (Hz - Hertz; cycles/second)    
                                             Data Type: Decimal (Normalized between -1 and 1) 
 activityType                           


##Sources
Joris Schut has an example of what should be included in an R codebook, and I have used his template as a guide in creating this codebook (Though I have not adhered to it strictly): https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41#file-gistfile1-rmd-L1


# Data-Cleaning-Assignment

##Introduction:

Asignment for the Course "Getting Data and Cleaning" offered by Johns Hopkins University through Coursera.org.

##Objective:

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

##Activities to be done:

Create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Environment:

    Hardware: 
    Windows 10 PC (64Bit)
    Processor: Intel(R) Core(TM) i7-3770 CPU @ 3.4Ghz
    Memory: 16 GB 1067 MHz DDR3
    Internet Connection
    
##Tools:

    RStidio 
    GitHub Repository : https://github.com/jasonbutt/Cleaning-Data-Assignment
    GitHub DeskTop
    
##Data Source:

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    
##Running the script:

To run the script, type source run_analysis.R the output will be as follows: 

> source('~/GitHub/CleanDataAssingment/run_analysis.R')
[1] "Getting and Cleaning Data Project"
[1] "---"
[1] "Starting up."
[1] "Downloading file."
[1] "File downloaded"
[1] "Extracting files."
[1] "Files extracted."
[1] "Preparing to run analysis."
[1] "Data to variables."
[1] "Merging data..."
[1] "Setting measurements on Mean and sd."
[1] "Setting descriptive names."
[1] "Setting labels"
[1] "Creating second data set."
[1] "Second data set created."

The ReadMe.md and CodeBook.md are authored by me to explain the functioning of run_analysis.R

##Process
Download the data file to the data folder
Unzip the file and created a list of files
Load data from the following files
1. test/subject_test.txt
2. test/X_test.txt
3. test/y_test.txt
4. train/subject_train.txt
5. train/X_train.txt
6. train/y_train.txt
Read the data from the files into variables
Merge the training and test sets into one data set file extract
Subset the measurments  for the mean and standard deviation for each measurement
Fix the labels using the activity_labels.txt
Create the tidydata extract

##Initial Files & Folders in Working Directory:

        Files  :
                Created by:
					run_analysis.R
					ReadMe.md
					CodeBook.md		
        
##Final Files & Folders in Working Directory:

        Folder: UCI-HAR-Dataset
        Files : 
				Downloaded:
					Dataset.zip
                Created by:
					run_analysis.R
					ReadMe.md
					CodeBook.md
                Created by the Code run_analysis.R 
					mergedData.txt
					tidydata.txt
                
Created Reopsitory on GitHub 
Web Link : https://github.com/jasonbutt/Cleaning-Data-Assignment

##Acknowledgments
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


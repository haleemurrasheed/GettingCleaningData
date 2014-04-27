GettingCleaningData
===================

This repository contains an assignment for the coursera course Getting And Cleaning Data


Raw Data for the Assignment
===========================
 
The source of the original data is at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
The original description can be found at : 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description of the Assignment Tasks  
=====================================
The following tasks need to be accomplished:
 *   Merges the training and the test sets to create one data set.
 *   Extracts only the measurements on the mean and standard deviation
     for each measurement. 
 *   Uses descriptive activity names to name the activities in the data set
 *   Appropriately labels the data set with descriptive activity names. 
 *   Creates a second, independent tidy data set with the average of each 
     variable for each activity and each subject. 

Quick Run to get the results
================================
Steps:
 * download the zip file from the above link and extract it.
 * open R/ Rstudio - source the script run_analysis.R
 * save the path of the extracted zip file in a variable called "dest"
 * run the script file by 
  source("run_analysis.R")
  run_analysis(dest)

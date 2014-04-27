This codebook.md is for run_analysis.R ( which is submitted as an 
assignment for "Getting and Cleaning Data")

Here I will outline the steps followed by me for each task.

Preliminary task - check if the directory contains test and train directories and
then proceed. Alert the user with a message if the directories are not present in 
the correst format. 

Task 1.  We merge the training and test sets to create one data set, 
namely "fullset" using train/X_train.txt and test/X_test.txt. The result is 
a 10299 x 561 data frame, as in the original description 
("Number of Instances: 10299" and "Number of Attributes: 561")

Task 2. 
Steps followed-
*  read file features.txt 
* extracts only the measurements on the mean and standard deviation for each variable.
(note - Some features had  "-meanFreq()-X" and "-mean()-X" - I used only "-mean()"
and "-std()" for my grepl statement - out of 561, 66 columns were selected.) 
* The resultant data.frame had dimenions 10299 x 66 data frame, 
All measurements appear to be floating point numbers in the range (-1, 1).
* add colnames to avoid condfusion later. 
* this dataset was called "subfullset"

Task 3 -  read in the activity labels from the file "activity_label.txt"

Task 4 - 
* Read in the subject ids and make a single column vector(10299 x 1) using 
"train/y_train.txt" and "test/y_test.txt" with one row per activity IDs
stored in "actibvitylist".
* map the activity label to activity read in using Task3 - stored in "activitymap". 
* Read in the subject ids and make a single column vector(10299 x 1) using 
"train/subject_train.txt" and "test/subject_test.txt" with one row per subject IDs.
stored in "subj"
* merge to form "tidyset1" - tidyset1 looks like :
     col 1 - activity label 
     col 2 - actibity name
     col 3 - subject lable
     col 4-end - features (one per column)
* The result is stored as "tidyset1.txt"

Task 5 
* The script creates a second independent tidy data set "tidyset2" 
 with the average of each measurement for each activity and each subject.

* The result is saved as "tidyset2.txt", which has 66 rows and 180 columns
  Each row represents the variable( the result of Task 2). 
  The 180 columns represent the average for each activity(6) 
  per subject(30) - thus resulting in 180 columns.
  For example: the first 6 columns represent all activities(in order 
  given by activity_labels.txt  - provided in the raw datset) for 
  subject 1 - the next 6 columns for subject 2 and so on..


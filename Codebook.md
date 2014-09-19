CODEBOOK for the tidy data set and intermediary data sets of the run_analysis.R
===============================================================================

Data Source
-----------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" 
which was originally made avaiable here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Variables and Summaries explained
=================================
Refer to the README.md to understand the processing steps of the `run_analysis.R` and when data sets
are used within the process.

Features
--------
Among the original features data set, only variables with mean and standard deviation calculated were kept (ie. those features ending with either `_mean( )` or  `_std( )`.
The variables used are shown below ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated and kept for the above variables are:
* mean(): Mean value
* std(): Standard deviation

Additional vectors used on the angle() variable were kept:

* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Note: All other estimates/variables were  removed from the data set.
Note2: features are normalized and bounded within [-1,1].

Group.1, Group.2 and other columns
----------------------------------
In addition to all the above variables,  there are 4 additional columns in the `tidy_data`data set:
* Group.1: `Id` of the subject (same as _Subject_)
* Group.2: `Id` of the Activity (preferably use the labels shown below)
* Subject: `Id` for a subject ranges from [1, 30]
* Activity: label of the activity of the subject at the time variables were recorded
   -  WALKING (Id is `1`)
   -  WALKING_UPSTAIRS (Id is `2`)
   -  WALKING_DOWNSTAIRS (Id is `3`)
   -  SITTING (Id is `4`)
   -  STANDING (Id is `5`)
   -  LAYING (Id is `6`)

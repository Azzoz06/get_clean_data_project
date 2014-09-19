get_clean_data_project
======================

Repository for Getting and Cleaning data Course Project.

### run_analysis.R

The script loads the data and processes a series of steps detailed below.
The assumptions for running the script are:

  1. The source data is downloaded ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ), unzipped and stored in the following folder `./data/unzipped`
  2. The output of the script is the `tidy.data` file saved in the `./data` folder

### Processing steps
1. The script starts by reading the test data files
2. It then binds the labels, data and subject data into a single data frame R object `test.full`
3. The script performs the same for the training data set resulting in a R object called `train.full`
4. Both R objects are merged in a single data frame called `merged.set` with correct column names
5. Feature data is read and a subset of measurements are kept in the the R object called `var.to.keep`
6. A `cleansed.data` data frame is created to subset only the measurements and  column names for measurements are set
7. Activity labels are read from  input file as follows:
  - 1 WALKING
  - 2 WALKING_UPSTAIRS
  - 3 WALKING_DOWNSTAIRS
  - 4 SITTING
  - 5 STANDING
  - 6 LAYING
8. Aggregation of the data is performed on a subject/activity group-by basis. Aggregation function is `MEAN`
9. Activity labels are used in place of `Id` in the data frame
10. Data frame is exported to a the `./data/tidy.data` file.



# Read Test Data
test.set <- read.table("./data/unzipped/test/X_test.txt")
test.labels <- read.table("./data/unzipped/test/y_test.txt")
test.subjects <- read.table("./data/unzipped/test/subject_test.txt")
test.full <- cbind(test.subjects, test.labels, test.set)

# Read Training Data
train.set <- read.table("./data/unzipped/train/X_train.txt")
train.labels <- read.table("./data/unzipped/train/y_train.txt")
train.subjects <- read.table("./data/unzipped/train/subject_train.txt")
train.full <- cbind(train.subjects, train.labels, train.set)

# Understand test and training data
# > dim(test.set)
# [1] 2947  561
# > dim(test.labels)
# [1] 2947    1
# > dim(test.subjects)
# [1] 2947    1

# Merge Test and Training data and name columns properly
merged.set <- rbind(test.full, train.full)
#colnames(merged.set)[1] <- "Subjects"
#colnames(merged.set)[2] <- "Activity"
colnames(merged.set) <- c("Subject", "Activity", 1:561)

# Extract measurements only mean and one standard deviation
# Assumption is based on the features.txt KEEP ONLY VARIABLES CONTAINING 'mean( )' or 'std( )'
features <- read.table("./data/unzipped/features.txt")
colnames(features) <- c("Id", "Feature")

patterns = c("mean\\(\\)|std\\(\\)")
Var.to.keep <- rbind(features[grepl(patterns[1], features$Feature ),], data.frame(Id=c("Subject", "Activity"), Feature=c("Subject", "Activity") ))

# Retain ONLY the data for the correct measurment
cleansed.data <- merged.set[ , Var.to.keep$Id]

# Use the descriptive activity names in the data set ie. WALKING, WALKING_UPSTAIRS...
activity.labels <- read.table("./data/unzipped/activity_labels.txt")
colnames(activity.labels) <- c("Id", "Label")

# Name the data set appropriately
# Set the column names with the correct variable
colnames(cleansed.data) <- Var.to.keep$Feature

# Tidy data is average of each variable for EACH subject and EACH activity
tidy.data <- aggregate(cleansed.data, by=list(cleansed.data$Subject, cleansed.data$Activity), FUN=mean, na.rm=TRUE)

# Set the label for activity data
tidy.data$Activity <- factor(tidy.data$Activity, levels=activity.labels$Id, labels=activity.labels$Label)

write.table(tidy.data, file="./data/tidy.data", sep=",", row.name=FALSE)




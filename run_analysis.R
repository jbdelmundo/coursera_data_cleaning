

if(!(require("data.table"))){
    install.packages("data.table")
    require("data.table")
}

# Load data
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE)
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)

# Merge train and test data

x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)


# Select columns with mean and std only
features <- read.table('./UCI HAR Dataset/features.txt',header=FALSE);
features <- as.character(features[,2])
mean_std_cols <- grep(".*mean.*|.*std.*", features)
mean_std_names <- features[mean_std_cols]
x_mean_std_all <- x_all[mean_std_cols]

# Replace features and labels with descriptive names 
mean_std_names = gsub('-mean', 'Mean', mean_std_names)
mean_std_names = gsub('-std', 'StdDev', mean_std_names)
mean_std_names <- gsub('[()-]', '', mean_std_names)
mean_std_names = gsub('fBodyBody', 'fBody', mean_std_names)

# combine subject, y, filtered columns for x
data_all <- cbind(subject_all, y_all, x_mean_std_all)
colnames(data_all) <- c("subject", "activity", mean_std_names)

# Replace activity with word labels
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE);
data_all$activity <- factor(data_all$activity, levels = activity_labels[,1], labels = activity_labels[,2])
data_all$subject <- as.factor(data_all$subject)

# create an independent tidy data set with the average of each variable for each activity and each subject
data_all.dt <- data.table(data_all)
tidy <- data_all.dt[, lapply(.SD, mean), by=list(activity,subject)]


write.table(tidy, './tidy.txt', row.names=FALSE, sep='\t', quote=FALSE)

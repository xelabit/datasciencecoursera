X_test <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",
                     quote="\"")
features <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt",
                       quote="\"")
X_train <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",
                      quote="\"")
y_test <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",
                     quote="\"")
y_train <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",
                      quote="\"")
subject_test <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",
                           quote="\"")
subject_train <- read.table("~/R/GACD/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",
                            quote="\"")
#
# Set names of variables of "X_test" data frame as values of features.txt (in
# our case it is a second column of "features" data frame)
#
names(X_test) <- features$V2
valid_column_names_test <- make.names(names = names(X_test), unique = TRUE,
                                      allow_ = TRUE)
names(X_test) <- valid_column_names_test
#
# The same with "X_train" data frame
#
names(X_train) <- features$V2
valid_column_names_train <- make.names(names = names(X_train), unique = TRUE,
                                       allow_ = TRUE)
names(X_train) <- valid_column_names_train
y_te <- y_test$V1
y_tr <- y_train$V1
#
# Add "activity" variable to X_test denoting activity type and select columns
# denoting means, standart deviations and "activity" variable itself
#
X_test <- mutate(X_test, activity = y_te)
X_test$activity <- as.factor(X_test$activity)
levels(X_test$activity) <- c("WALKING", "WALKING_UPSTAIRS",
                             "WALKING_DOWNSTAIRS", "SITTING", "STANDING",
                             "LAYING")
test <- select(X_test, activity, contains("mean..."), contains("std"))
#
# Same procedure with X_train data frame
#
X_train <- mutate(X_train, activity = y_tr)
X_train$activity <- as.factor(X_train$activity)
levels(X_train$activity) <- c("WALKING", "WALKING_UPSTAIRS",
                             "WALKING_DOWNSTAIRS", "SITTING", "STANDING",
                             "LAYING")
train <- select(X_train, activity, contains("mean..."), contains("std"))
#
# Add subject variable to our data frames. Unite both test and train data frames
#
sub_te <- subject_test$V1
sub_tr <- subject_train$V1
test <- mutate(test, subject = sub_te)
train <- mutate(train, subject = sub_tr)
all_together <- bind_rows(test, train)
#
# Evaluate means of each variable depending on subject of observation and
# activity
#
outMelt <- melt(all_together, id = c("activity", "subject"), measure.vars =
                        names(all_together)[2:58])
outCast <- dcast(outMelt, activity + subject ~ variable, mean)



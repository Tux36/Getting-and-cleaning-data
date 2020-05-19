# Programming task on gettin and cleaning data

require(dplyr)

filename <- "Coursera_DS3_Final.zip"

#It cheks if the file has already been download

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

#Unzip the archive

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#All dataframes are assigned here.

features <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subjectTest <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xTest <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
yTest <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subjectTrain <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xTrain <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
yTrain <- read.table("/home/tux/dataScienceCoursera/UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Merges the training and the test sets to create one dataset.

x <- rbind(xTrain, xTest)
y <- rbind(yTrain, yTest)
subject <- rbind(subjectTrain, subjectTest)
mergedData <- cbind(subject, y, x)

#Extracts only the measurements on the mean and standard deviation for each measurement.

tidyData <- mergedData %>% select(subject, code, contains("mean"), contains("std"))

#Uses descriptive activity names to name the activities in the data set.

tidyData$code <- activities[tidyData$code, 2]

#Appropriately labels the data set with descriptive variable names.

names(tidyData)[2] = "activity"
names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
names(tidyData)<-gsub("^t", "Time", names(tidyData))
names(tidyData)<-gsub("^f", "Frequency", names(tidyData))
names(tidyData)<-gsub("tBody", "timeBody", names(tidyData))
names(tidyData)<-gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "STD", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-freq()", "Frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("angle", "Angle", names(tidyData))
names(tidyData)<-gsub("gravity", "Gravity", names(tidyData))

#From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

independentData <- tidyData %>% group_by(subject, activity) %>%  summarise_all(funs(mean)) 
write.table(independentData, "independentData.txt", row.name=FALSE)
      




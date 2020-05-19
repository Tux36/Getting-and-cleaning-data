The run_analysis.R script preprocesses the dataset for later analysis.

1. Dataset was download and extracted under the folder called UCI HAR Dataset.

2. Each dataframe was loaded into the work environment as follow:
* features
* activities
* subjectTest
* xTest
* yTest
* subjectTrain
* xTrain
* yTrain

3. Training and test set was merge to create one dataset as follow:
* x is created by merging xTrain and xTest using rbind() function
* y is created by merging yTrain and yTest using rbind() function
* subject is created by merging subjectTrain and subjectTest using rbind() function
* mergeData is created by merging subject, y and x using cbind() function

4. Only was extracts the measurements on the mean and standard deviation for each measurement.

5. Only was used descriptive activity names to name the activities in the dataset.

6. It was labeled appropriately the dataset with descriptive variable names.
* code column in tidyData renamed into activities
* Acc change to Accelerometer
* Gyro change to Gyroscope
* BodyBody change to Body
* Mag change to Magnitude
* All start with character f in column's name replaced by Frequency
* All start with character t in column's name replaced by Time
* tBody change to timeBody
* angle change to Angle

7. From the dataset in step 4, was created a second, independent tidy dataset with the average of each variable for each activity and each subject.

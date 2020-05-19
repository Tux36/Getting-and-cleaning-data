Assignment about getting and cleaning data course project.

Here it is explain how scripts work and how they're interconnected.

* codeBook.md -> a code book that describes the variables, the data, and any transformation to clean  up the data.

* run_analysis.R -> performs the data preparation as follow:
1. Merges the training and the test stes to create one dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the dataset.
4. Appropriately labels the data set with descriptive variable names.
5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

* independentData.txt -> is the exported final data after going through all the sequences described above. 

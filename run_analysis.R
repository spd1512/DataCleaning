##Downloading the dataset
filename <- "Course_Project"


#Checking if the filename already exists or not.
if(!file.exists(filename)){
        file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(file,filename)
}


#Unziping the file
unzip(filename)


#Assigning names to all the data frames required.
feature <- read.table("UCI HAR Dataset/features.txt",col.names = c("n","functions"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("number","activity"))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = feature$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "number")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = feature$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",col.names = "number")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")


#Step 1 :
#Merging the training and the test sets to create one data set. 
X <- rbind(X_train,X_test)
Y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)
Merged <- cbind(X,Y,subject)


#Step 2 : 
#Extracting only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
extracted_data <- select(Merged,subject,number,contains("mean"),contains("std"))


#Step 3 : 
#Using descriptive activity names to name the activities in the data set.
extracted_data$number <- activity[extracted_data$number,2]


#Step 4 :
#Appropriately labeling the data set with descriptive variable names.
names(extracted_data) <- gsub("^t","Time",names(extracted_data))
names(extracted_data) <- gsub("Acc","Acceleration",names(extracted_data))
names(extracted_data) <- gsub("Gyro","Gyroscope",names(extracted_data))
names(extracted_data) <- gsub("Mag","Magnitude",names(extracted_data))
names(extracted_data) <- gsub("^f","Frequency",names(extracted_data))
names(extracted_data) <- gsub("BodyBody","Body",names(extracted_data))
names(extracted_data) <- gsub("-mean()","mean",names(extracted_data),ignore.case = TRUE)
names(extracted_data) <- gsub("-std()","STD",names(extracted_data),ignore.case = TRUE)
names(extracted_data) <- gsub("-freq()","Frequency",names(extracted_data),ignore.case = TRUE)
names(extracted_data) <- tolower(names(extracted_data))
names(extracted_data) <- gsub("number","activity",names(extracted_data))


#Step 5 : 
#From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.
TidyData <- extracted_data %>% group_by(subject,activity) %>% summarize_all(funs(mean))
        
write.table(TidyData,"TidyData.txt",row.names = FALSE)
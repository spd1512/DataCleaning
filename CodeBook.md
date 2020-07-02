
The run_analysis.R script performs the data cleaning based on the following criteria:

### 1.Variable Names Assigned
   - **features** :  
     Name of file : features.txt  
     Number of rows : 561  
     Number of columns : 2  
     Description:  
     The features selected for this database come from the accelerometer and gyroscope  
     3-axial raw signals tAcc-XYZ and tGyro-XYZ.<br>
     
   - **activity** :  
     Name of file : activity_labels.txt  
     Number of rows : 6  
     Number of columns : 2  
     Description:  
     List of activities performed by the person.<br>  
     
   - **X_train** :  
     Name of file : train/X_train.txt  
     Number of rows : 7352  
     Number of columns : 561  
     Description :  
     Contains recorded features of training data.<br>
     
   - **y_train** :  
     Name of file : train/y_train.txt  
     Number of rows : 7352  
     Number of columns : 1  
     Description:  
     Contains the activity_labels of the training data.<br>
     
   - **subject_train** :  
     Name of file : train/subject_train.txt
     Number of rows : 7352  
     Number of columns : 1  
     Description:  
     Contains the subjects of the training data.<br>
       
   - **X_test** :  
     Name of file : test/X_test.txt  
     Number of rows : 2947  
     Number of columns : 561  
     Description :  
     Contains recorded features of test data.<br>
     
   - **y_test** :  
     Name of file : test/y_test.txt  
     Number of rows : 2947  
     Number of columns : 1  
     Description:  
     Contains the activity_labels of the test data.<br>
     
   - **subject_test** :  
     Name of file : test/subject_test.txt
     Number of rows : 2947  
     Number of columns : 1  
     Description:  
     Contains the subjects of the test data.<br>
     
     
### 2.Merging the training and the test sets to create one data set.  
   - **X** :  
     Number of rows : 10299  
     Number of columns : 561  
     Description:  
     Created by merging X_train and X_test row-wise by using rbind().<br>
     
   - **Y** :  
     Number of rows : 10299  
     Number of columns : 1  
     Description:  
     Created by merging y_train and y_test row-wise by using rbind().<br>
     
   - **subject** :  
     Number of rows : 10299  
     Number of columns : 1
     Description:  
     Created by merging subject_train and subject_test row-wise by using rbind().<br>
     
   - **Merged** :  
     Number of rows : 10299  
     Number of columns : 563  
     Description:  
     Created by merging X , Y and subject row-wise by using cbind().<br>
     

### 3.Extracting only the measurements on the mean and standard deviation for each measurement.
   - **extracted_data** :  
     Number of rows : 10299  
     Number of columns : 563  
     Description:  
     Created by using select() function of dplyr package    
     Merged is subsetted.  
     Only the columns subject,activity,mean and standard deviation are selected.<br>
     
     
### 4.Using descriptive activity names to name the activities in the data set
   - The numbers representing the activities are replaced by the names of the activities.<br>
   
   
### 5.Appropriately labeling the data set with descriptive variable names.
   - All the characters starting with t are replaced by Time.  
   - All "Acc" are replaced by "Acceleration".  
   - All "Gyro" are replaced by "Gyroscope".  
   - All "Mag" are replaced by "Magnitude".  
   - All the characters starting with f are replaced by Frequency.  
   - All the "BodyBody" are replaced by "Body.  
   - All the characters are turned into lowercase.<br>
   

### 6.From the data set in step 4, creates a second, independent tidy data set with the average of each       variable for each activity and each subject.  
   - TidyData is created by summarizing extracted_data and taking the means of each variable  
     for each activity and each subject which are grouped by subject and activity.
   
   
   
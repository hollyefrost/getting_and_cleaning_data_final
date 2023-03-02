# getting_and_cleaning_data_final
This is my final project for JH Coursera Course - Getting and Cleaning Data.

--------------------------------------------------------------------------------

Contents:
  1. run_analysis.R
  2. select_data.txt
  3. grouped.txt
  4. Codebook.txt
  5. getdata_projectfiles_UCI HAR Dataset.zip
  6. getting_and_cleaning_data_final.Rproj

--------------------------------------------------------------------------------

1. run_analysis.R
    This completes the following analysis:
    
    1. Merges the training and the test sets to create one data set.
      -See variable "all_data".
    
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
      -See variable "select_data".
      -All variables including "mean","Mean","std", and "Std" were included.
    
    3. Uses descriptive activity names to name the activities in the data set.
      -See names() in "select_data" to verify.
      -Activity names are included as given in "Y_train","Y_test".
      
    4. Appropriately labels the data set with descriptive variable names. 
      -See names() in "select_data" to verify.
      -This analyst feels the originally supplied names for variable were        sufficiently tidy.
    
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      -See "grouped".
    
    6. Writes "select_data" and "grouped" to txt file
    
2. select_data.txt
   Resulting data from analysis in run_analysis.R. See Codebook.txt for meta data.
    
3. grouped.txt
    Resulting data from analysis in run_analysis.R. See Codebook.txt for meta data. This data is the means for data, grouped by activity and subject.
    
    
4. Codebook.txt
    Details the variables in select_data.txt and grouped.txt.
    
5. getdata_projectfiles_UCI HAR Dataset.zip
    The raw data used in run_analysis.R
    
6. getting_and_cleaning_data_final.Rproj
    Project file

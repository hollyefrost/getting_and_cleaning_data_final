#Unzip the files
unzip("getdata_projectfiles_UCI HAR Dataset.zip")

#Load packages
library(dplyr)

#Read: test data, train data, data labels, activity labels
test <- tibble(read.table("UCI HAR Dataset/test/X_test.txt"))
train <- tibble(read.table("UCI HAR Dataset/train/X_train.txt"))
labels <- tibble(read.table("UCI HAR Dataset/features.txt"))
test_subject <-tibble(read.table("UCI HAR Dataset/test/subject_test.txt"))
train_subject <-tibble(read.table("UCI HAR Dataset/train/subject_train.txt"))
activity_labels <-tibble(read.table("UCI HAR Dataset/activity_labels.txt"))
test_act <- tibble(read.table("UCI HAR Dataset/test/Y_test.txt"))
train_act <- tibble(read.table("UCI HAR Dataset/train/Y_train.txt"))

#Merge data test and train data
all_data <- rbind(test,train)
remove(train,test)

#Select columns containing 'mean' or 'std' in label data
my_patterns <- c('[Mm]ean', '[Ss]td')
my_cols <- grepl(paste(my_patterns, collapse='|'),labels$V2)
select_labels <- filter(labels,my_cols)
remove(my_col,my_patterns)

#Select the data containing 'mean' or 'std'
select_data <- all_data %>% 
  select(names(all_data)[my_cols])
remove(all_data,my_cols)

#Rename select data
select_data <- rename_with(select_data, ~select_labels$V2,
                           all_of(colnames(select_data)))
remove(labels,select_labels)

#Add subject data with tidy name
select_data <- add_row(test_subject,train_subject) %>%
  mutate(select_data) %>%
  rename(subject=V1)
remove(test_subject,train_subject)

#Add activity data with tidy name
act <- rbind(test_act,train_act)
assign_activity <- function(activity) {
  if(activity ==1) {x = "WALKING"}
  else if(activity == 2) {"WALKING_UPSTAIRS"}
  else if(activity == 3) {"WALKING_DOWNSTAIRS"}
  else if(activity == 4) {"SITTING"}
  else if(activity == 5) {"STANDING"}
  else {"LAYING"}
}
act <- sapply(act$V1,assign_activity)
select_data <- mutate(select_data,activity = act,.after=subject)
remove(activity_labels,test_act,train_act,assign_activity,act)

#Group by subject and activity
select_data <- group_by(select_data, subject, activity)
grouped <- summarize_all(select_data, mean)

#Creates file containing grouped data and select data
write.table(select_data,"select_data.txt")
write.table(grouped,"grouped.txt")
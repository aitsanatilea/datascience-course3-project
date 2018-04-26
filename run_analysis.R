# install.packages("dplyr","reshape2","data.table")
library(dplyr)
library(reshape2)
library(data.table)

# Download and unzip data into the current working directory
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile=paste0(getwd(),"/Dataset.zip"),method = "curl")
unzip("Dataset.zip",exdir="./")

setwd(paste0(getwd(),"/UCI HAR Dataset"))

# Read activity_labels.txt and features.txt files
activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")

# Read files from test folder
subject_test<-read.table("./test/subject_test.txt")
test_data<-read.table("./test/X_test.txt")
test_labels<-read.table("./test/y_test.txt")

#Read files from train folder
subject_train<-read.table("./train/subject_train.txt")
train_data<-read.table("./train/X_train.txt")
train_labels<-read.table("./train/y_train.txt")

# 1.Merge the training and the test sets to create one data set
# Merge labels, give descriptive name to the column, remove variables from the memory
labels<-rbind(test_labels,train_labels)
names(labels)<-"activity"
rm(train_labels)
rm(test_labels)

# Merge subject, give descriptive name to the column, remove variables from the memory
subject<-rbind(subject_test,subject_train)
names(subject)<-"subject"
rm(subject_test)
rm(subject_train)

# Merge measurements, give the meaningful names to the columns, remove variables from the memory
data<-rbind(test_data,train_data)
names(data)<-features$V2
rm(test_data)
rm(train_data)

# 2.Extract only the measurements on the mean and standard deviation for each measurement. 
data<-data[,grep("mean[^Ff]|std",names(data))]

# Merge subjects, labels and measurements into one data set
data<-cbind(subject,labels,data)

# 3.Use descriptive activity names to name the activities in the data set
data<-merge(activity_labels,data, by.x="V1", by.y="activity", sort=FALSE)

# 4.Appropriately label the data set with descriptive variable names 
names(data)[2]<-"activity"

# Rearrange the columns and remove numeric labels (leaving only descriptive activity labels, e.g. "WALKING")
data<-data%>%
    select(c(3,2,4:ncol(data)))%>%
    arrange(subject,activity)
# 5. From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject
tidydata<-data%>%group_by(subject,activity)%>%summarise_all(mean)
nm<-lapply(names(tidydata)[3:ncol(tidydata)], function(x){paste("Average of",x)})
names(tidydata)[3:ncol(tidydata)]<-nm
# Save tidy data set to a "tidydata.txt" file
write.table(tidydata, "tidydata.txt",row.names=FALSE)


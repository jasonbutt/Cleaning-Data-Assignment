
print("Getting and Cleaning Data Project")
print("---")
print("Starting up.")
if(!file.exists("c://data")){
    dir.create("c://data")
    print("Creating directory")
}
print("Downloading file.")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C://data//Dataset.zip",method="curl")
print("File downloaded")
print("Extracting files.")
unzip(zipfile="c://data//Dataset.zip",exdir="C://data")

path_rf <- file.path("c://data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
print("Files extracted.")

print("Preparing to run analysis.")
dataActTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
dataFeaTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
print("Data to variables.")
str(dataActTest)
str(dataActTrain)
str(dataSubTrain)
str(dataSubTest)
str(dataFeaTest)
str(dataFeaTrain)

print("Merging data...")
dataSub <- rbind(dataSubTrain, dataSubTest)
dataAct<- rbind(dataActTrain, dataActTest)
dataFea<- rbind(dataFeaTrain, dataFeaTest)

names(dataSub)<-c("subject")
names(dataAct)<- c("activity")
dataFeaNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFea)<- dataFeaNames$V2

dataCombine <- cbind(dataSub, dataAct)
Data <- cbind(dataFea, dataCombine)

print("Setting measurements on Mean and sd.")
subdataFeaNames<-dataFeaNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaNames$V2)]
selectedNames<-c(as.character(subdataFeaNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)
str(Data)
write.table(Data, file = "c://data//mergedData.txt") 
print("Merged data file created.")

print("Setting descriptive names.")
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
head(Data$activity,30)

print("Setting labels")
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)

print("Creating second data set.")
library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "c://data//tidydata.txt",row.name=FALSE)
print("Second data set created.")

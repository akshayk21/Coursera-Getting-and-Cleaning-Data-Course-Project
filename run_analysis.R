install.packages("dplyr")
library(dplyr)

install.packages("plyr")
library(plyr)

activityLabels <- read.table("activity_labels.txt")
head(activity_labels)

#Step 1
xTrain <- read.table("X_train.txt")
yTrain <- read.table("y_train.txt")
subjectTrain <- read.table("subject_train.txt")

xTest <- read.table("X_test.txt")
yTest <- read.table("y_test.txt")
subjectTest <- read.table("subject_test.txt")

x <- rbind(xTrain, xTest)
y <- rbind(yTrain,yTest)
subject <- rbind(subjectTrain, subjectTest)

#Step 2
features <- read.table("features.txt")
head(features)

meanAndStdFeatures <- grep(".*(mean|std)\\(\\)", features[, 2])

#The following 2 statements are similar
#x <- x %>% select(meanAndStdFeatures)
x <- x[meanAndStdFeatures]
names(x) <- features[meanAndStdFeatures,2]

#Step 3
activityLabels <- read.table("activity_labels.txt")

#merge(y, activity_labels, by.x = "V1", by.y = "V1", all = T) This will not work because it only works for matching unique primary keys in two tables. Think of this step as performing a vLookup.

y[,1] <- activityLabels[y[,1], 2]

# Step 4
#The following 2 steps are similar. You can either use colnames or names. Both are correct.
#names(y) <- c("activity")
#names(subject) <- c("subject")
colnames(y) <- "Activity"
colnames(subject) <- "Subject"

#binding everything together

fData <- cbind(subject,x,y)
colnames(fData) 

#Step 5
averages_data <- ddply(fData, .(Subject, Activity), function(x) colMeans(x[, 1:67]))
head(averages_data)

write.table(averages_data, "grouped_Tidy_Data.txt", row.name=FALSE)

#This method can also be applied. But first all NA columns need to be removed
#x[,67:562] <- NULL
#colnames(x)
#fData <- cbind(subject,x,y)
#groupedBySubjectAndAcitivity <- fData %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))
#head(groupedBySubjectAndAcitivity)




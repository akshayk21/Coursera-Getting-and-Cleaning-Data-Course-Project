# Variable Info

* xTrain, yTrain, xTest, yTest, subjectTrain and subjectTest have the data from training and test datasets.
* x, y and subject is a result of merging all 3 (x,y,subject) test and train datasets together.
* features is a dataframe from features.txt file.
* meanAndStdFeatures - is a new dataset, which has only average and standart deviation
* activityLabels contains 6 types of activity: WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING,LAYING, and we need to map them to Y. This is read from activity_labels.txt file.
* fData merges x, y and subject in one complex dataset through cbind.
* averages_data contains average data, grouped by subject and activity.

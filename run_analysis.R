run_analysis.R <- function(testpath, trainpath, featurepath, outputpath){
    
    testactivity <- read.table(file = paste(testpath, "y_test.txt", sep = ""))
    testsubject <- read.table(file = paste(testpath, "subject_test.txt", sep = ""))
    testdata <- read.table(file = paste(testpath, "X_test.txt", sep = ""))
    trainingactivity <- read.table(file = paste(trainpath, "y_train.txt", sep = ""))
    trainingsubject <- read.table(file = paste(trainpath, "subject_train.txt", sep = ""))
    trainingdata <- read.table(file = paste(trainpath, "X_train.txt", sep = ""))
    fulltest <-cbind(testsubject, testactivity, testdata)
    fulltraining <- cbind(trainingsubject, trainingactivity, trainingdata)
    fullall <- rbind(fulltest, fulltraining)
    columnnames <- read.table(file = paste(featurepath, "features.txt", sep = ""))
    grabcolumns <- grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", columnnames$V2)
    colnamessubset <- columnnames[grabcolumns,]$V2
    colnamessubset <- lapply(colnamessubset,as.character)
    grabcolumns <- grabcolumns + 2
    fullmeanstd <- fullall[,c(1:2,grabcolumns)]
    colnames(fullmeanstd) <- c("Subject", "Activity", colnamessubset)
    activitynames <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
    for (i in 1:6){
        fullmeanstd$Activity[fullmeanstd$Activity == i] <- activitynames[[i]]
    }
    groupeddata <- group_by(fullmeanstd, Subject, Activity)
    summarizeddata <- summarize_all(groupeddata, funs(mean))
    write.csv(summarizeddata, paste(outputpath, "finalproduct.csv", sep = ""))
}
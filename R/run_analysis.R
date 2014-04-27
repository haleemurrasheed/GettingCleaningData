run_analysis<- function(dest){
    ## set up directory for test and train 
    testpath <- paste0(file.path(dest,"test"))
    trainpath <- paste0(file.path(dest,"train"))    
        
    if(!file.exists(testpath)){
        stop("Please check the directory name.Files not present. ")
    }
    
    ## read in files.
    testset <- read.table(file.path(testpath,"X_test.txt"))
    testlabels <- read.table(file.path(testpath,"y_test.txt"))
    subjtest <- read.table(file.path(testpath,"subject_test.txt"))
    
    trainset <- read.table(file.path(trainpath,"X_train.txt"))
    trainlabels <- read.table(file.path(trainpath,"y_train.txt"))
    subjtrain <- read.table(file.path(trainpath,"subject_train.txt"))
    
    
    ## 1.Merges the training and the test sets to create one data set.
    fullset<- rbind(trainset,testset)
    dim(fullset)
    
    ## 2. Extracts only the measurements on the mean and standard deviation 
    ## for each measurement. 
    featurelist <- read.table(file.path(dest,"features.txt"))
    
    meanvec <- as.character(featurelist[,2] [sapply(as.vector(featurelist[,2]), 
                           function(x) grepl("-mean\\(\\)", x))])
    stdvec <- as.character(featurelist[,2] [sapply(as.vector(featurelist[,2]), 
                           function(x) grepl("-std\\(\\)", x))] )
    idx<- which(featurelist[,2] %in% c(meanvec,stdvec))
    subfullset<- fullset[,idx]
    colnames(subfullset) <- c(meanvec,stdvec)
    
    ## 3. Uses descriptive activity names to name the activities in the data se
    activitylist <- read.table(file.path(dest,"activity_labels.txt"))
    
    ## 4. Appropriately labels the data set with descriptive activity names.
    act <- rbind(trainlabels, testlabels)
    res <- sapply(act[,1], function(x) {
        as.character(activitylist[ which( x == activitylist[,1]), 2]) 
    })
    ## can also use:
    ## sapply(act, function(x) as.character(activitylist[x==activitylist[,1],2]))
    activitymap <- cbind(act,res)
    colnames(activitymap) <- c("activity label","activity name")
    
    subj <- rbind(subjtrain, subjtest)
    names(subj) <- "subjectlabel"
    
    ## final tidy dataset looks like :
    ## add column names now. 
    ## col 1 - activity label 
    ## col 2 - actibity name
    ## col 3 - subject lable
    ## col 4-end - features (one per column)
    
    if(identical(nrow(activitymap),nrow(subj),nrow(subfullset)))
    {
        tidyset1 <- cbind(activitymap,subj,subfullset)
    }
    
    ##write to disk - for uploading
    write.table( tidyset1,file="tidyset1.txt", sep="\t", quote=FALSE, 
                 col.names=TRUE, row.names=FALSE)
    
    ##5. Creates a second, independent tidy data set with the average of each 
    ## variable for each activity and each subject. 
    g <- split(tidyset1[,-c(1:3)], list(tidyset1[,1], tidyset1[,3]))
    tidyset2 <- sapply(g, colMeans)
    
    
    ##write to disk - for uploading
    write.table( tidyset2,file="tidyset2.txt", sep="\t", quote=FALSE, 
                 col.names=TRUE, row.names=FALSE)
}











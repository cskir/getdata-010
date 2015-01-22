library(dplyr)

run_analysis <- function() {

    # req 1:  load & merge 
    # the data is loaded already with appropriately variable labels (req 4)
    
    test_data <- load_data("test")
    train_data <- load_data("train")
    
    total_data <- rbind(test_data, train_data)

    # req 2: extract the mean, std features   
    
    n <- names(total_data) 
    cols <- c( grep("subject",n) ,  grep("activity",n),  grep("-mean\\(\\)",n ), grep("-std\\(\\)",n ))    
    data <- total_data[, cols]
                           
    # req 3: uses descriptive activity names    
    #   load activity names, and factorize the column
    activity_defs <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
    activity_labels <- as.vector(activity_defs[,2])
    
    data <- mutate(data, activity = factor(activity, labels = activity_labels)) 
}

create_save_result <- function(data, filename) {

    #req 5: create the average of each variable 
    #       for each activity and each subject.    
    data  %>% 
        group_by(subject, activity) %>%
            summarise_each(funs(mean))  %>%
                write.table( file = filename, row.name=FALSE)
}

#create_save_result(run_analysis(),"getdata_010_courseproject.txt")

# load_data: read and combine the data 
# with the activity and the subject 
# data type can be "test" or "train" 
load_data <- function(data_type) {
    #initialize the folder
    data_folder <-sprintf("./UCI HAR Dataset/%s/", data_type)
    
    #read the X and label
    uci_har_x <- read.table(sprintf("%sX_%s.txt",data_folder, data_type), header = FALSE)
    features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
    names(uci_har_x) <- as.vector(features[,2])
    
    uci_har_y <- read.table(sprintf("%sy_%s.txt", data_folder, data_type), header = FALSE)
    names(uci_har_y) <-c("activity")
        
    uci_har_subject <- read.table(sprintf("%ssubject_%s.txt",data_folder, data_type), header = FALSE)
    names(uci_har_subject) <-c("subject")    
    
    if(nrow(uci_har_x) != nrow(uci_har_y) || nrow(uci_har_x) != nrow(uci_har_subject))
        stop(sprintf("dimension mismatch in section: %s", data_type))
 
    cbind(uci_har_x, cbind(uci_har_y, uci_har_subject))
}

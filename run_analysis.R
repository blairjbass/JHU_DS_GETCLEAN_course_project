library(dplyr)

## Get the activity labels which will be used as variables in the end data set
## Per Week 3 & 4, best practice is all lower case variables with no special characters
labels <- read.table("dataset/activity_labels.txt")$V2 %>% as.vector() %>% tolower() %>%
  gsub("_", "", .)

## LOad y_test.txt and y_train.txt into dataframe tables and then "convert" the numbers into the variables
## from the previous step
ytest <- tbl_df(read.table("dataset/test/y_test.txt")) %>% sapply(FUN=function(x) labels[x])
ytrain <- tbl_df(read.table("dataset/train/y_train.txt")) %>% sapply(FUN=function(x) labels[x])

## Load X_test.txt and X_train.txt in dataframe tables. Correlate the variable names to the features listed in
## features.txt. Use best practice for variable names: lower case with no symbols.  In this case
## it is useful to have a delimiter so i kept the "-" to break up the names. I also got rid
## of the counter numbers at the beginning
xtest <- tbl_df(read.table("dataset/test/X_test.txt"))
names(xtest) <- readLines("dataset/features.txt") %>% tolower() %>% gsub("^[0-9]+|[(), ]","", .)
xtrain <- tbl_df(read.table("dataset/train/X_train.txt"))
names(xtrain) <- readLines("dataset/features.txt") %>% tolower() %>% gsub("^[0-9]+|[(), ]","", .)

## It turns out there are duplicate variable names.  Since the exact nature of the variables is
## beyond my technical expertise, I decided to keep them all.  I noticed that the values for
## the duplicate variables were not duplicated so there were not duplicated observations.
## I decided to rename each of the duplicated variables adding a [2] or [3] to signify this.
## I did notice that each of the duplicates were duplicated exactly three times.
var <- NULL
for(i in which(duplicated(names(xtest)))) {
  count <- length(which((names(xtest)[1:(i-1)] == names(xtest)[i])))
  if(count == 1) {
    var <- c(var, paste(names(xtest)[i], "[2]", sep=""))
  } else if(count ==2) {
    var <- c(var, paste(names(xtest)[i], "[3]", sep=""))
  } 
}
names(xtest)[duplicated(names(xtest))] <- var

## repeat for xtrain:
var2 <- NULL
for(i in which(duplicated(names(xtrain)))) {
  count <- length(which((names(xtrain)[1:(i-1)] == names(xtrain)[i])))
  if(count == 1) {
    var2 <- c(var2, paste(names(xtrain)[i], "[2]", sep=""))
  } else if(count ==2) {
    var2 <- c(var2, paste(names(xtrain)[i], "[3]", sep=""))
  } 
}
names(xtrain)[duplicated(names(xtrain))] <- var2

## Merge xtest and xtrain via rbind.  Create a new variable call activity which combines ytest
## and ytrain, so we've now merged all test and train datasets into one data frame table.
##  We are only concerned with variables that have 'mean' or 'std' (for standard deviation in 
## them) along with the activity variable which will be in column 562. 

dataset <- rbind(xtest, xtrain)
dataset$activity <- c(ytest, ytrain)
dataset <- dataset[, c(562, grep("mean|std", names(dataset)))] 
dataset[,2:87][[1]] <- as.numeric(dataset[,2:87][[1]])

## Now we create our second independent tidy data set.  We want to group by activity type and 
## summarize all variables by the mean.
by_activity <- group_by(dataset, activity)
dataset2 <- summarize_all(by_activity, mean)
names(dataset2) <- paste(names(dataset), "-avg", sep="")

write.table(dataset2, file="fulldataset_avgerages_byactivtity.txt", row.name=FALSE)

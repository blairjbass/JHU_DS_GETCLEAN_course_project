##This script takes the run_analyis script and checks to ensure that the data was placed
##correctly from xtest and xtrain into dataset. It checks a sample of 10 random columns
##iterated over 30 random rows.  The first loop relates to checking xtest data vs. dataset
## data while the 2nd loop is xtrain vs dataset.  Note for the 2nd loop, each dataset value
## is increased by nrow(xtest) because dataset was created by rbinding the two sets.


source("run_analysis.R", chdir = TRUE)


sample_columns <- sample(1:ncol(dataset), 10)
sample_rows <- sample(1:nrow(xtest), 30)

result_vector <- NULL

for(i in sample_rows) {
  for(j in sample_columns) {
    var <- names(dataset[i, j])
    result <- select(xtest, all_of(var))[i,] == dataset[i,j]
    result_vector <- c(result_vector, result)
  }
}

sample_columns <- sample(1:ncol(dataset), 10)
sample_rows <- sample(1:nrow(xtrain), 30)

result_vector2 <- NULL

for(i in sample_rows) {
  for(j in sample_columns) {
    var <- names(dataset[i + nrow(xtest), j])
    result <- select(xtrain, all_of(var))[i,]==dataset[i+nrow(xtest),j]
    result_vector2 <- c(result_vector2, result)
  }
}

num_falses <- length(which(!result_vector)) + length(which(!result_vector2))

print(paste("Out of the 30x10 samples taken on each xtrain and xtest, there are", num_falses, 
            "number of occurrences of mistakes in the overall dataset."))
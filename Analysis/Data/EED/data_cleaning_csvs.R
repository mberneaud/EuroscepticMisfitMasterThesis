############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 27.02.16
# Last edited: 28.02.16
# This file stores the functions neede to prepare the CSVs for aggregation and 
# merging at a later stage


# Function creates a data frame with one line for each CSV in the specified directory
# and saves it into a unique data frame which is named after the file


# Takes the file paths of the CSVs as input and returns them reduced down to the 
# last line of the document
readShrinkCSVs <- function(CSVpath) {
  used.file <- read.csv(CSVpath)
  tail(used.file, n=1L)
  }

# Function used to compute percentages from absolute votes and add them to df
# takes as arguments the dataframe and the number of preceding columns without data
# on party votes. Optional argument is the number of columns following the last
# entry on party votes (default is 4 and should work on most dataframes)
percentages <- function(df, pre = 3, follow = 4) {
  newVars <- paste0(names(df), "_p")
  for(i in pre:(ncol(df)-follow)){
    temp <- (df[, i] / df$Validvotes)
     df <- cbind(df, temp  = temp)
     names(df) <-sub("temp", newVars[i], names(df))
  }
  print(df)
}

# Tests which need to be removed later to ensure sourcing works as intended
new <- percentages(ATEP1996)
test <- readShrinkCSVs()


############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 27.02.16
# Last edited: 28.02.16
# This file stores the functions neede to prepare the CSVs for aggregation and 
# merging at a later stage


# Function creates a data frame with one line for each CSV in the specified directory
# and saves it into a unique data frame which is named after the file
# Arguments: must use backslash at end of directory name
resaveCSVs <- function(directory = getwd(), destdir) {
  file.names <- list.files(directory)
  file.paths <- paste(directory, file.names, sep = "/")
  for(i in seq_along(file.names)){
    used.CSV <- read.csv(file.paths[i])
    used.CSV <- tail(used.CSV, n=1L)
    write.csv(used.CSV, file = paste0(destdir, strtrim(file.names[i], 8L), ".csv"))
    }
  print("done writing files")
}

# Function to calculate percentages from files and write them to disk again.
# Takes args for the underlying percentages() function
# directories specified as args must terminate on "/". 
addPercentages <- function(directory = getwd(), destdir, pre = 3, follow = 4) {
  file.names <- list.files(directory)
  file.paths <- paste(directory, file.names, sep = "/")
  for(i in seq_along(file.names)) {
    df <- read.csv(file.paths[i])
    df.percent <- partyPercent(df, pre, follow)
    write.csv(df.percent, file = paste0(destdir, file.names[i]))
  }
  print("Percentages added and files written to working directory")
}


# Function used to compute percentages from absolute votes and add them to df
# takes as arguments the dataframe and the number of preceding columns without data
# on party votes. Optional argument is the number of columns following the last
# entry on party votes (default is 4 and should work on most dataframes)
partyPercent <- function(df, pre = 3, follow = 4) {
  newVars <- paste0(names(df), "_p")
  for(i in pre:(ncol(df)-follow)){
    temp <- (df[, i] / df$Validvotes)
     df <- cbind(df, temp  = temp)
     names(df) <-sub("temp", newVars[i], names(df))
  }
  print(df)
}

#' CSV sorter function
#' Because my addpercentages function needs the correct number of preceeding columns
#' without information on party votes and the number of columns following all party 
#' vote rows
#' @return returns "sorting of CSVs completed" and no error on successful completion
#' @export sorts 
#'
#' @examples
sortCSVs <- function() {
  
}
lapply(ATEP1996, class)


p

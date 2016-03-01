############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 27.02.16
# Last edited: 27.02.16
# This file contains a function aggregating all the .csv files from the EED into one file
# Cleaning will be done in a different file

# the below function combines th

combineCSVs <- function(directory = getwd()) {
  file.names <- list.files(directory)
  file.paths <- paste(directory, file.names, sep = "/")
  # creating aggregator df
  all.CSVs <- data.frame()
  for(i in seq_along(file.names)) {
    used.file <- read.csv(file.paths[i], header = F)
    all.CSVs <- rbind(all.CSVs, used.file)
  }
}


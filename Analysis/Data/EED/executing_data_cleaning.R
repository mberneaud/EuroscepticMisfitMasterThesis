############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 29.02.16
# Last edited: 29.02.16
# This file contains the actual data merging that took place in preparation of 
# my research data

################
# Loading functions and packages
################
source("Analysis/Data/EED/data_cleaning_functions.R")

setwd("./Analysis/Data/EED/")

# Resaving the CSV data and shrink it in the process
resaveCSVs("CSV/", "shortCSV/")



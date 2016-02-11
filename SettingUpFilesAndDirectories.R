########
# Setting up files and directories for my research project
# Author: Malte Berneaud-Kötz
# Date: 11.02.2016
# This file contains the source code for setting up my directory tree that
# is used in the following analysis of the European Election Study Data

setwd("/home/malte/Git/EuroscepticMisfitMasterThesis")
# for convenience, will be removed later

dir.create("Analysis")
dir.create("Analysis/Data")
file.create("Analysis/Data/DataUsed.md")
file.create("Analyis/Data/Master.R") # since this produced an error, I created
# the file manually using
# touch Analysis/Data/Master.R

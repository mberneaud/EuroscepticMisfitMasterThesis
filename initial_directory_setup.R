########
# Setting up files and directories for my research project
# This file contains the source code for setting up my directory tree that
# is used in the following analysis of the European Election Study Data

setwd("/home/malte/Git/EuroscepticMisfitMasterThesis")
# for convenience, will be removed later

# Created initial directory structure
dir.create("Analysis")
dir.create("Analysis/Data")
file.create("Analysis/Data/data_used.md")
file.create("Analyis/Data/master.R") # since this produced an error, I created
# the file manually using
# touch Analysis/Data/Master.R
dir.create("Analysis/ExploringData")
dir.create("ExternalDocumentation")
file.create("./ExternalDocumentation/downloading_documentation.R")
file.create("./Data/ExploringData/exploring_manifestos_data.R")




############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 11.02.16
# Last edited: 03.05.16
# This file ties together the files used in my analysis of the Eurosceptic misfit

# set working directory
setwd("/home/malte/Git/EuroscepticMisfitMasterThesis")

# Installing all the necessary packages if they do not exist already on 
# your machine
include.packages <- c("dplyr", "ggplot2", "stargazer", "plm", "lmtest", "car", 
                      "haven", "knitr")
needed.packages <- include.packages[!(include.packages %in% installed.packages()[, "Package"])]
if(length(needed.packages)) install.packages(needed.packages, repos = "https://cran.uni-muenster.de/")

# Note: loading of packages is done in the individual R-scripts where they are used


# Preparing data, merging and aggregating ---------------------------------

# Euromanifesto Data
source("Analysis/Code/preparing_EUM_data.R")

# Eurobarometer Data
source("Analysis/Code/preparing_EB_data.R")

# Merging of the data into party-years, recoding and adding variables
source("Analysis/Code/merging_recoding_data.R")

# Aggregating data to the national level for the analysis
source("Analysis/Code/aggregation_to_national_level.R")


# Statistical analysis of the models --------------------------------------

source("Analysis/Code/regression_models.R")  # conducts the analysis and saves regression
# outputs to the Presentation/Latex folder

# Graphs and visualisations
source("Analysis/Code/graphs.R")  # saves all graphs created, so it makes 
# sense to source it, even though the graphs are included in the repository


# Creating package citations ----------------------------------------------
source("Analysis/Code/package_citations.R")

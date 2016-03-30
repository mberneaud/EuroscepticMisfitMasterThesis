
############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 11.02.16
# Last edited: 30.03.16
# This file ties together the files used in my analysis of the Eurosceptic misfit

# set working directory
setwd("/home/malte/Git/EuroscepticMisfitMasterThesis")

# Preparing data, merging and aggregating

# Euromanifesto Data
source("Analysis/Data/Euromanifesto/preparing_EUM_data.R")

# Eurobarometer Data
source("Analysis/Data/Eurobarometer/preparing_EB_data.R")

# Merging of the data into party-years, recoding and adding variables
source("Analysis/Merge/merging_recoding_data.R")

# Aggregating data to the national level for the analysis
source("Analysis/Merge/aggregation_to_national_level.R")

# Statistical analysis of the models
source("Analysis/Modeling/regression_models.R")  # sourcing this file is a bit
# non-sensical as it does not save any results in text form, rather works
# interactively on the console. Sourcing does print the stargazer output to the
# console, however, which can be used in LaTeX documents

# Graphs and visualisations
source("Analysis/Graphs/graphs.R")  # saves all graphs created, so it makes 
# sense to source it. 
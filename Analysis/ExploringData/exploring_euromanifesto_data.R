############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 23.02.16
# Last edited: 23.02.16
# Contains interactive exploration of the Euromanifestos data set. For Download
# information please see the data_used.md Markdown document

# Setting wd
setwd("/home/malte/Git/EuroscepticMisfitMasterThesis")

# Loading libraries
library(dplyr)
library(tidyr)
library(foreign)

# Loading data set
EUmanifesto <- read.dta("./Analysis/Data/ZA5102_v1-0-0.dta")

# some exploration of the pro_anti_EU variable
summary(EUmanifesto$pro_anti_EU)
sd(EUmanifesto$pro_anti_EU)
class(EUmanifesto$pro_anti_EU)

# some exploration of the variables denoting countries
class(EUmanifesto$country)
table(EUmanifesto$country)  #displays frequency of occurence of each 
View(EUmanifesto$country)
head(EUmanifesto$country)

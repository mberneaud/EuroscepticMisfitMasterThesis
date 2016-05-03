############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 08.03.16
# Last edited: 03.05.16
# Source code in this file is use to clean the Euromanifesto data prior to merging

# attaching libraries
library(foreign)
library(dplyr)

# reading in Manifesto data
EUmanifesto <- read.dta("./Analysis/Data/Euromanifesto/ZA5102_v1-0-0.dta",
                        convert.factors = F)

# filtering out parties at EU level
EUmanifesto <- filter(EUmanifesto, country != 10)

# filtering out missing values for votes
EUmanifesto <- filter(EUmanifesto, vote >= -777)

# Writing created data set to disc
write.csv(EUmanifesto, "Analysis/Data/Euromanifesto/EMP.csv")

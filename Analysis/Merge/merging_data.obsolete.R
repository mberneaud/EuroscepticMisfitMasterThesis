############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 07.03.16
# Contains the source code I used to merge the Euromanifesto data, the EP election
# documentation, the Eurobarometer data, 

# Loading libraries
library(foreign)
library(dplyr)

# sourcing cleaning files
source("Analysis/Data/Eurobarometer/preparing_EB_data.R")

EUmanifesto <- read.dta("./Analysis/Data/Euromanifesto/ZA5102_v1-0-0.dta",
                        convert.factors = F)
MZESdata <- read.spss("./Analysis/Data/MZESData/EER_Release_1_1.sav", 
                      use.value.labels = F, to.data.frame = T)



# Merging Euromanifesto and EP election documentation
Merge1 <- merge(EUmanifesto, MZESdata, by = c("year", "party"))

# Writing the file to disk for safety
write.csv(Merge1, "./Analysis/Merge/EUMZ_merge.csv")

# for later merge I use the country.x variable as it does not differentiate between 
# Northern Ireland and the rest of the UK

# Merging merged data with EB aggregates
Merge2 <- merge(Merge1, EBAgg, by = "country_year")  # tentative results

# Writing for safety
write.csv(Merge2, "./Analysis/Merge/EUMZEB.csv")






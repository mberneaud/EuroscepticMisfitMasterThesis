############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 02.03.16
# Contains the source code I used to clean the transform the Euromanifesto data
# to make it fit in with the MZES data set

# Loading libraries
library(foreign)
library(dplyr)

EUmanifesto <- read.dta("./Analysis/Data/Euromanifesto/ZA5102_v1-0-0.dta", convert.factors = F)
MZESdata <- read.spss("./Analysis/Data/MZESData/EER_Release_1_1.sav", 
                      use.value.labels = F, to.data.frame = T)




# Doing some analysis on the variables in the data sets
length(unique(MZESdata$party))
length(unique(EUmanifesto$party)) ## only one party ID which is not shared
filter(MZESdata, country == 14) %>% select(party)  # I thought I remembered some
# missing values from the Finnish observations

filter(EUmanifesto, country == 14) %>% select(party)  # no, everything fine

#checking for classes of merge categories
class(EUmanifesto$year)
class(MZESdata$year)

class(EUmanifesto$party)
class(MZESdata$party)

# Doing the merge
EUMZ <- merge(EUmanifesto, MZESdata, by = c("year", "party"))

# Writing the file to disk for safety
write.csv(EUMZ, "./Analysis/Merge/EUMZ_merge.csv")

source("./Analysis/Data/Eurobarometer/preparing_EB_data.R", print.eval = F,
       echo = F)

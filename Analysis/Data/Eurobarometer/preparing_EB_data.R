############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 06.03.16
# Preparing Eurobarometer data for merge
# contains the code I used to create a dataset with information on instrumental
# and political Euroscepticism

# loading libraries
library(haven)
library(dplyr)

###################
# EB 1979
###################
# Reading data and recoding is only commented for the first data set, subsequent
# ones follow the same structure.

EB1979 <- read_sav("./Analysis/Data/Eurobarometer/Spring 1979/ZA1036_v1-0-1.sav")

# Recoding, selecting, etc.
# selecting only relevant variables
EB1979 <- select(EB1979, isocntry, v8, v94, v95)

# renaming columns for easier merging
names(EB1979) <- c("isocntry", "nation", "membership", "benefit")
# creating year variable
EB1979$year <- 1979


####################
# EB 1984
####################
EB1984 <- read_sav("Analysis/Data/Eurobarometer/Spring 1984/ZA1320_v1-0-1.sav")
EB1984 <- select(EB1984, isocntry, v5, v189, v190)
names(EB1984) <- c("isocntry", "nation", "membership", "benefit")
EB1984$year <- 1984


####################
# EB 1989
####################
EB1989 <- read_sav("Analysis/Data/Eurobarometer/Spring 1989/ZA1750_v1-0-1.sav")
EB1989 <- select(EB1989, isocntry, v5, v273, v274)
names(EB1989) <- c("isocntry", "nation", "membership", "benefit")
EB1989$year <- 1989

####################
# EB 1994
####################
# Spring data for old MS who had elections 9–12 June 1994
EB1994 <- read_sav("Analysis/Data/Eurobarometer/Spring 1994/ZA2490_v1-1-0.sav")
EB1994 <- filter(EB1994, v5 != 15)  # excluded Finland because it's added later
EB1994 <- select(EB1994, isocntry, v5, v61, v62)
names(EB1994) <- c("isocntry", "nation", "membership", "benefit")
EB1994$year <- 1994
# Coding Eastern Germany in with the rest of Germany
EB1994$nation[EB1994$nation == 13] <- 4

# Swedish elections: 17 September 1995
EB1995S <- read_sav("Analysis/Data/Eurobarometer/Sweden 1995/ZA2690_v1-0-1.sav")
EB1995S <- filter(EB1995S, v5 == 16)
EB1995S <- select(EB1995S, isocntry, v5, v67, v68)
names(EB1995S) <- c("isocntry", "nation", "membership", "benefit")
EB1995S$year <- 1995
# Coding Eastern Germany in with the rest of Germany
EB1995S$nation[EB1995S$nation == 13] <- 4

# Austrian elections: 13 October 1996, Finnish elections: 20 October 1996
EB1996AF <- read_sav("Analysis/Data/Eurobarometer/Austria Finland 1996/ZA2831_v1-0-1.sav")
EB1996AF <- filter(EB1996AF, v6 == 17 | v6 == 15)
EB1996AF <- select(EB1996AF, isocntry, v6, v39, v40)
names(EB1996AF) <- c("isocntry", "nation", "membership", "benefit")
EB1996AF$year <- 1996
EB1996AF$nation[EB1996AF$nation == 13] <- 4
  

####################
# EB 1999
####################
EB1999 <- read_sav("Analysis/Data/Eurobarometer/Spring 1999/ZA3171_v1-0-1.sav")
EB1999 <- select(EB1999, isocntry, v6, v104, v105)
names(EB1999) <- c("isocntry", "nation", "membership", "benefit")
EB1999$year <- 1999
# Coding Eastern Germany in with the rest of Germany
EB1999$nation[EB1999$nation == 13] <- 4

####################
# EB 2004
####################
EB2004 <- read_sav("Analysis/Data/Eurobarometer/Fall 2004/ZA4229_v1-1-0.sav")
EB2004 <- select(EB2004, v7, v6, v98, v99)
names(EB2004) <- c("isocntry", "nation", "membership", "benefit")
EB2004$year <- 2004

# The Eurobarometer decided to really mess with the time series and introduce
# Northern Ireland as a new nation code, in the process moving all other countries
# "up" by one past the 10th entry (Northern Ireland) and thereby making them 
# incompatible with the previous data, needing correction 
# Fixing the time series by coding in Northern Ireland with the rest of the UK
EB2004$nation[EB2004$nation == 10] <- 9

# Coding Eastern Germany in with the rest of Germany using its 1999 nation code
EB2004$nation[EB2004$nation == 14] <- 4

# And then adjusted the values for all the other variables to match the previous 
# Eurobarometers
for(i in 1:nrow(EB2004)){
  if(EB2004$nation[i] >= 11) {
    EB2004$nation[i] <- EB2004$nation[i] - 1
  } else {
    next()
  }
}

####################
# Binding data frames together
####################

EBMerge <- rbind(EB1979, EB1984, EB1989, EB1994, EB1995S, EB1996AF, EB1999,
                 EB2004)

# Creating a dummy variable for generally Eurosceptic respondents
EBMerge$gen.EUS <- ifelse(EBMerge$membership == 3, 1, 0)

# Creating a dummy variable for instrumentally Eurosceptic respondents
EBMerge$inst.EUS <- ifelse(EBMerge$membership == 2, 1, 0)

###################
# Aggregation of the data
###################

# Arranging data in rows to allow group_by to work properly
EBMerge <- arrange(EBMerge, nation, year)

# Grouping data in preparation of the aggregation
EBGroup <- group_by(EBMerge, nation, year)

# Aggregating using the summarise function
EBAgg <- summarise(EBGroup, gen.EUS = mean(gen.EUS, na.rm = TRUE),
                   inst.EUS = mean(inst.EUS, na.rm = TRUE))

# Dropping last five rows as they contain data for Romania, Bulgaria,
# Republic of Northern Cyprus, Turkey and Croatia
EBAgg <- head(EBAgg, n = -5)

# Transforming the values for EUS into percent values
EBAgg <- mutate(EBAgg, gen.EUS = gen.EUS * 100, inst.EUS = inst.EUS * 100)

# Recoding country names to match with Euromanifesto encoding
# note to self: coded one observation on Norway as 98, needs to be removed
# Note to self: Eurobarometer data for Sweden and Austria is missing in the Spring
# 1994 EB, maybe I should use data from fall also. 
library(lessR)
oldvars <- c(1:12, 14:27)
newvars <- c(31, 21, 22, 41, 32, 23, 13, 53, 51, 34, 33, 35, 98, 14, 11, 42, 36,
             82, 93, 86, 87, 88, 37, 92, 96, 97)
rec(nation, old = oldvars, new = newvars, data = EBAgg)

                                         
# Saving the data frame for later as a .csv file
write.csv(EBAgg, "Analysis/Merge/EB_agg_EUS.csv")

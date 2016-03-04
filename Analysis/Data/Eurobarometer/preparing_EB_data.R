############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 02.03.16
# Preparing Eurobarometer data for merge
# contains the code I used to create a dataset with information on instrumental
# and political Euroscepticism

# loading libraries
library(haven)
library(dplyr)

###################
# EB 1979
###################

EB1979 <- read_sav("./Analysis/Data/Eurobarometer/Spring 1979/ZA1036_v1-0-1.sav")

# Exploring the data set
str(EB1979)
dim(EB1979)

# Exploration of the relevant variables
table(EB1979$v93)
sum(is.na(EB1979$v93))  # 1417 missing values

table(EB1979$v94)
sum(is.na(EB1979$v94))  # 699 missing values


# Recoding, selecting, etc.
# selecting only relevant variables
EB1979 <- select(EB1979, isocntry, v8, v93:v96)

# renaming columns for easier merging
names(EB1979) <- c("isocntry", "nation", "integration", "membership",
                   "common.market", "integration.speed")
# creating year variable
EB1979$year <- 1979




####################
# EB 1984
####################
EB1984 <- read_sav("Analysis/Data/Eurobarometer/Spring 1984/ZA1320_v1-0-1.sav")
EB1984 <- select(EB1984, isocntry, v5, v170, v189, v190)
names(EB1984) <- c("isocntry", "nation", "integration", "membership", "benefit")
EB1984$year <- 1984


####################
# EB 1989
####################
EB1989 <- read_sav("Analysis/Data/Eurobarometer/Spring 1989/ZA1750_v1-0-1.sav")
EB1989 <- select(EB1989, isocntry, v5, v272:v274)
names(EB1989) <- c("isocntry", "nation", "integration", "membership", "benefit")
EB1989$year <- 1989

####################
# EB 1994
####################
EB1994 <- read_sav("Analysis/Data/Eurobarometer/Spring 1994/ZA2490_v1-1-0.sav")
EB1994 <- select(EB1994, isocntry, v5, v61, v62, v64)
names(EB1994) <- c("isocntry", "nation", "membership", "benefit", "integration.speed")
EB1994$year <- 1994

####################
# EB 1999
####################
EB1999 <- read_sav("Analysis/Data/Eurobarometer/Spring 1999/ZA3171_v1-0-1.sav")
EB1999 <- select(EB1999, isocntry, v6, v104, v105)
names(EB1999) <- c("isocntry", "nation", "membership", "benefit")
EB1999$year <- 1999

####################
# EB 2004
####################
EB2004 <- read_sav("Analysis/Data/Eurobarometer/Fall 2004/ZA4229_v1-1-0.sav")
EB2004 <- select(EB2004, v7, v6, v98, v99, v102)
names(EB2004) <- c("isocntry", "nation", "membership", "benefit", "image")
EB2004$year <- 2004

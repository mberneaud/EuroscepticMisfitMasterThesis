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

EB1979 <- read_sav("./Analysis/Data/Eurobarometer/Spring 1979/ZA1036_v1-0-1.sav")

# Exploration of the relevant variables
table(EB1979$v93)
hist(EB1979$v93)  # strong left skew
sum(is.na(EB1979$v93))  # 1417 missing values

table(EB1979$v94)
hist(EB1979$v94)  # strong left skew
sum(is.na(EB1979$v94))  # 699 missing values

# Recoding, selecting, etc.
# Year variable
EB1979$year <- 1979

############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 08.03.16
# Contains the source code I used to merge the Euromanifesto data with the
# Eurobarometer data and the computing of new variables which are used in the
# analyis

# Loading libraries
library(dplyr)

# sourcing cleaning files
source("Analysis/Data/Eurobarometer/preparing_EB_data.R")
source("Analysis/Data/Euromanifesto/preparing_EUM_data.R")

# Merging merged data with EB aggregates
Merge1 <- merge(EUmanifesto, EBAgg, by = "country_year")

# Writing for safety
write.csv(Merge1, "./Analysis/Merge/EUMZEB.csv")

##################################################
# creating a dummy variable for Eurosceptic parties
##################################################

# First I created national year means for the integration stance variable used
# in determining which parties are Eurosceptic

# Groups by country year, and calculates means of the EU stance variable for 
# country years plus a standard deviation for the same variable
Merge1 <- group_by(Merge1, country_year)
Mean.EU.stances <- summarise(Merge1, EU.stance.mean = mean(pro_anti_EU, na.rm = TRUE),
                             EU.stance.sd = sd(pro_anti_EU, na.rm = TRUE))

# Merges in the resulting data frame with the original data frame
Merge1 <- merge(Merge1, Mean.EU.stances, by = "country_year")

# Creating dummy for eurosceptic parties
Merge1$EUS.party <- ifelse(Merge1$pro_anti_EU <= 
                             (Merge1$EU.stance.mean - Merge1$EU.stance.sd), 1, 0)

###############################################################
# Creating vote aggregates for Eurosceptic parties by country
###############################################################

# filtering out 18 observations where vote is -777
Merge1 <- filter(Merge1, vote != -777 )

Merge1$EUS.vote <- Merge1$EUS.party * Merge1$vote
Merge1 <- group_by(Merge1, country_year)
sum.EUS.vote <- summarise(Merge1, sum.EUS.vote = sum(EUS.vote, na.rm = TRUE))

# Merging the country year totals for Eurosceptic votes back into the main data
# frame
Merge1 <- merge(Merge1, sum.EUS.vote, by = "country_year")

##################################
# Creating a CEE dummy variable
##################################

# creating a vector with the CEE country codes from the Euromanifestos Project
# data set in it

Merge1$CEE <- ifelse(Merge1$country >= 80, 1, 0)

# Writing to file for easier re-start of analysis if needed
write.csv(Merge1, "./Analysis/Merge/Merge1.csv")


##################################
# Computing polarisation index
##################################


# filtering out invalid obersvations in left
Merge1 <- filter(Merge1, left != -777 & left != 99)


# Calculating Party System mean left-right score for country years
Merge1 <- group_by(Merge1, country_year)
left.mean <- summarise(Merge1, left.mean = mean(left, na.rm = TRUE))

# Merging that into the dataframe
Merge1 <- merge(Merge1, left.mean, by = "country_year")


# Calculating part of the polarisation index
Merge1$pola.part <- NULL
for(i in 1:nrow(Merge1)) {
  Merge1$pola.part[i] <- Merge1$vote[i] * ((Merge1$left[i]-Merge1$left.mean[i])/5)^2
}

# summarizing pola.parts by country_years
Merge1 <- group_by(Merge1, country_year)

pola.sum <- summarise(Merge1, pola.sum = sum(pola.part, na.rm = TRUE))
pola.sum$pola.index <- sqrt(pola.sum$pola.sum)


# Merging polarization index for country years back into main merge data frame
Merge1 <- merge(Merge1, pola.sum, by = "country_year")

# Milestone data set!
write.csv(Merge1, "Analysis/Merge/Merge1.csv")

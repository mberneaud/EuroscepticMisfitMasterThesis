############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 10.03.16
# Last edited: 10.03.16
# Contains the source code I used to create an aggregate data set observing 
# countries nationally during each election round

# starting off by using what we had from the merging of the party level data set
source("Analysis/Merge/merging_recoding_data.R")


# Removing leftovers from Eurobarometer aggregation
rm(list = ls(pattern = "^EB1"))

# Including new variables from EMP data
Merge1 <- group_by(Merge1, country_year)
new.vars <- summarise(Merge1, member = mean(member, na.rm = TRUE))

# aggregating Eurobarometer data
EBAgg <- group_by(EBAgg, country_year)
EBAggsum <- summarise(EBAgg, inst.EUS = mean(inst.EUS, na.rm = TRUE),
                      gen.EUS = mean(gen.EUS, na.rm = TRUE),
                      nation = mean(nation), year = mean(year))

# coercing nation and year to integer
EBAggsum$nation <- as.integer(EBAggsum$nation)
EBAggsum$year <- as.integer(EBAggsum$year)

# Merging together country_year level data
CYmerge <- merge(Mean.EU.stances, EBAggsum, by = "country_year")
CYmerge <- merge(CYmerge, left.mean, by = "country_year")
CYmerge <- merge(CYmerge, pola.sum, by = "country_year")
CYmerge <- merge(CYmerge, rile.sum, by = "country_year")
CYmerge <- merge(CYmerge, sum.EUS.vote, by = "country_year")
CYmerge <- merge(CYmerge, p2sum, by = "country_year")
CYmerge <- merge(CYmerge, new.vars, by = "country_year")


# Creating new variables in new df

# creating a dummy for the 
CYmerge$CEE <- ifelse(CYmerge$nation >= 80, 1, 0)

# creating duration of EU membership
CYmerge$member.dur <- CYmerge$year - CYmerge$member

# average of both EUS values 
CYmerge$avg.EUS <- (CYmerge$inst.EUS + CYmerge$gen.EUS) / 2

# difference between average popular EUS and vote shares of EUS parties 
CYmerge$diff.EUS <- CYmerge$avg.EUS - CYmerge$sum.EUS.vote

# removing duplicates
CYmerge <- unique(CYmerge)

# iterative testing: problem is in enop for some reason. 
sum(is.infinite(CYmerge$enop))  
sapply(CYmerge, function(x) sum(is.infinite(x))) # returns 1 for enop
# building infinite vector for enop to replace data with NA
inf <- is.infinite(CYmerge$enop)
CYmerge$enop[inf] <- NA

# Checking if this worked
sapply(CYmerge, function(x) sum(is.infinite(x))) # fixed now


# Writing the finished file for anaylsis to disk
write.csv(CYmerge, "Analysis/Merge/CYmerge.csv")

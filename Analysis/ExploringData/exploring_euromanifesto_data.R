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
library(foreign)
library(dplyr)
library(ggplot2)

# Loading data set
EUmanifesto <- read.dta("./Analysis/Data/ZA5102_v1-0-0.dta")

# transforming into tbl_df format
EUmanifesto <- tbl_df(EUmanifesto)

# some exploration of the pro_anti_EU variable
summary(EUmanifesto$pro_anti_EU)
sd(EUmanifesto$pro_anti_EU)
class(EUmanifesto$pro_anti_EU)

# some exploration of the variables denoting countries
class(EUmanifesto$country)
table(EUmanifesto$country)  #displays frequency of occurence of each country factor level
View(EUmanifesto$country)
head(EUmanifesto$country)


# quick and dirty plotting of party positions on EU membership across countries
# in 2009
dist.EUS.2009 <- qplot(country, pro_anti_EU, data = filter(EUmanifesto,
                                                           year == 2009))
print(dist.EUS.2009)
dev.print(png, "./Analysis/ExploringData/dist_EUS_2009.png", width = 1024,
          height = 720)


# same for 1979 as comparison
dist.EUS.1979 <- qplot(country, pro_anti_EU, data = filter(EUmanifesto,
                                                           year == 1979))
print(dist.EUS.1979)
dev.print(png, "./Analysis/ExploringData/dist_EUS_1979.png", width = 1024,
          height = 720)




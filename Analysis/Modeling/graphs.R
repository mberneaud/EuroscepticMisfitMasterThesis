############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 13.03.16
# Last edited: 13.03.16
# Contains graphs used in my master thesis

# loading libraries
library(ggplot2)
library(dplyr)

# reading data
CYmerge <- read.csv("Analysis/Merge/CYmerge.csv")

# creating national averages
CYmerge <- group_by(CYmerge, year)

year_averages <- summarise(CYmerge, year.avg = mean(avg.EUS))

# plotting averages
ggplot(year_averages, aes(x = year, y = year.avg)) + geom_point()

qplot(year_averages$year, year_averages$year.avg, geom =c("point", "line"))

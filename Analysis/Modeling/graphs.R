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

# grouping in Swedish, Finnish and Austrian elections of 1995 and 1996 in with 
# other 1994 elections
graph <- CYmerge
graph$year[graph$year == 1995 | graph$year == 1996] <- 1994

# creating national averages
graph <- group_by(graph, year)

year_averages <- summarise(graph, gen.avg = mean(gen.EUS, na.rm = TRUE),
                           inst.avg = mean(inst.EUS, na.rm = TRUE), 
                           diff.avg = mean(diff.EUS, na.rm = TRUE))


# plotting averages
averages <- ggplot(year_averages, aes(x = year)) +
              geom_line(aes(y = inst.avg, colour = "inst.avg")) +
              geom_line(aes(y = gen.avg, colour = "gen.avg")) +
              geom_line(aes(y = diff.avg, colour = "diff.avg"))

averages + scale_colour_discrete(name = "Dependent and independent variables",
                              labels = c("Eurosceptic Misfit", 
                                         "average general Euroscepticism",
                                         "average instrumental Euroscepticism"))+
  ylab("Variable value in %") + xlab("Year of EP election")



ggsave("Analysis/Modeling/DP_and_IVs_over_time.png")
ggsave("Analysis/Modeling/DP_and_IVs_over_time.pdf")

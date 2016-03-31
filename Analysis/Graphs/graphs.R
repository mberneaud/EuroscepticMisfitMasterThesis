############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 13.03.16
# Last edited: 25.03.16
# Contains graphs used in my master thesis

# loading libraries
library(ggplot2)
library(dplyr)
library(car)


# Setting ggplot font size for entire session


####################################
# IV and DV over time
####################################

# reading data
FE <- read.table("Analysis/Modeling/fixeffs")
CYmerge <- read.csv("Analysis/Merge/CYmerge.csv")
panel <- read.csv("Analysis/Merge/panel.csv")
abase <- read.csv("Analysis/Merge/merge_after_enop.csv")


# grouping in Swedish, Finnish and Austrian elections of 1995 and 1996 in with 
# other 1994 elections
graph <- CYmerge
graph$year[graph$year == 1995 | graph$year == 1996] <- 1994

# creating national averages
graph <- group_by(graph, year)

year_averages <- summarise(graph, EUS.avg = mean(avg.EUS, na.rm = TRUE),
                           vote.avg = mean(sum.EUS.vote, na.rm = TRUE), 
                           diff.avg = mean(diff.EUS, na.rm = TRUE))


# plotting averages for all countries
averages <- ggplot(year_averages, aes(x = year)) +
              geom_line(aes(y = EUS.avg, colour = "EUS.avg")) +
              geom_line(aes(y = vote.avg, colour = "vote.avg")) +
              geom_line(aes(y = diff.avg, colour = "diff.avg"))

averages + scale_colour_discrete(name = "Euroscepticism variables", 
                                 labels = c("Eurosceptic misfit", 
                                            "Popular Euroscepticism",
                                            "Eurosceptic vote share")) +
  ylab("Variable value in %") + xlab("Year of EP election") + 
  theme(legend.position = "top") + theme(text = element_text(size = 12))

ggsave("Analysis/Graphs/DP_and_IVs_over_time.png", width = 210, height = 120,
       units = "mm")
ggsave("Analysis/Graphs/DP_and_IVs_over_time.pdf", width = 210, height = 120,
       units = "mm")



## Plotting avg. EUS in all old MS over the study period 


######################
# Scatterplots
######################

# of all variables in data
spm(panel)
dev.print(pdf, "Analysis/Graphs/scatterplotmatrix.pdf")

scatterplotMatrix(~ diff.EUS + avg.EUS + pola.index + enop + member.dur + CEE | nation,
                  data = panel)
dev.print(pdf, "Analysis/Graphs/spm_by_nation.pdf")


######################
# Fixed effects idosyncratic errors
######################

# getting data and creating data frame for plotting 
abase <- group_by(abase, country)
abase <- summarise(abase, member = mean(member))
a <- cbind(abase, FE) 

# creating vector with country names 
c.names <- c("SE",	"DK",	"FI",	"BE",	"NL",
             "LU",	"FR",	"IT",	"ES",	"EL",	"PT",
             "CY",	"MT",	"DE",	"AT",	"UK",	"IE",
             "BG",	"CZ",	"EE",	"HU",	"LV",	"LT",
             "PL",	"RO",	"SK",	"SI")

# creating country names
a <- cbind(a, c.names)

# making membership entry a factor
a$member.f <- as.factor(a$member)



# Graphing the country-specific error
# ordering factor for scale from lowest to highest
order <- reorder(a$c.names, a$x)
ggplot(a, aes(x=order, y=x, group=member.f, colour=member.f)) +
  geom_point() +
  ylab("Country-specific errors") + xlab("Member State") +
  scale_colour_discrete(name = "Year of accession") +
  theme(text = element_text(size = 12)) +
  scale_y_continuous(breaks=seq(-18, 14, 1))

# saving the plot
ggsave("Analysis/Graphs/country-specific_error.pdf", width = 297, height = 120,
       units = "mm")

################
# Eurosceptic misfits in Original 6 MS over time
################
source("Analysis/Graphs/functions.R")

# Drawing graphs by hand
DE <- drawgg(41)
ggsave("Analysis/Graphs/DE.pdf", width = 150, height = 100, units = "mm")
BE <- drawgg(21)
ggsave("Analysis/Graphs/BE.pdf", width = 150, height = 100, units = "mm")
NL <- drawgg(22)
ggsave("Analysis/Graphs/NL.pdf", width = 150, height = 100, units = "mm")
LU <- drawgg(23)
ggsave("Analysis/Graphs/LU.pdf", width = 150, height = 100, units = "mm")
FR <- drawgg(31)
ggsave("Analysis/Graphs/FR.pdf", width = 150, height = 100, units = "mm")
IT <- drawgg(32)
ggsave("Analysis/Graphs/IT.pdf", width = 150, height = 100, units = "mm")


###################
# Average Eurosceptic misfit by geographical location
###################
AllE <- group_by(CYmerge, nation)
AllE <- summarise(AllE, diff.EUS = mean(diff.EUS))
range(AllE$diff.EUS)

### Northern Europe
# Data frame
NE <- dplyr::filter(CYmerge, nation <= 14)
NE <- group_by(NE, nation)
NE <- summarise(NE, diff.EUS = mean(diff.EUS))
NE$cname <- c("SE", "DK", "FI")

# Graph 
ggplot(NE, aes(y = diff.EUS, x = cname)) + geom_bar(stat = "identity") +
  ylab("Average Eurosceptic Misfit") + xlab("") +
  expand_limits(y = c(-3, 28))+
  theme(text = element_text(size = 20))
ggsave("Analysis/Graphs/NE.pdf", width = 150, height = 100, units = "mm")

# Western Europe
WE <- dplyr::filter(CYmerge, (nation >= 21 & nation <= 31) | (nation >= 41 &
                                                                nation <= 53))
WE <- group_by(WE, nation)
WE <- summarise(WE, diff.EUS = mean(diff.EUS))
WE$cname <- c("BE", "NL", "LU", "FR", "DE",
              "AT", "UK", "IE")

# Graph 
ggplot(WE, aes(y = diff.EUS, x = cname)) + geom_bar(stat = "identity") +
  ylab("Average Eurosceptic Misfit") + xlab("")+
  expand_limits(y = c(-3, 28))+
  theme(text = element_text(size = 20))
ggsave("Analysis/Graphs/WE.pdf", width = 150, height = 100, units = "mm")

# Southern Europe
SE <- dplyr::filter(CYmerge, nation >= 32 & nation <= 37)
SE <- group_by(SE, nation)
SE <- summarise(SE, diff.EUS = mean(diff.EUS))
SE$cname <- c("IT", "ES", "EL", "PT", "CY", "MT")

# Graph
ggplot(SE, aes(y = diff.EUS, x = cname)) + geom_bar(stat = "identity") +
  ylab("Average Eurosceptic Misfit") + xlab("")+
  expand_limits(y = c(-3, 28))+
  theme(text = element_text(size = 20))
ggsave("Analysis/Graphs/SE.pdf", width = 150, height = 100, units = "mm")

# Central and Eastern Europe
CEE <- dplyr::filter(CYmerge, nation >= 80)
CEE <- group_by(CEE, nation)
CEE <- summarise(CEE, diff.EUS = mean(diff.EUS))
CEE$cname <- c("BG", "CZ", "EE", "HU", "LV",
               "LT", "PL", "RO", "SK", "SI")

# Graph
ggplot(CEE, aes(y = diff.EUS, x = cname)) + geom_bar(stat = "identity") +
  ylab("Average Eurosceptic Misfit") + xlab("")+
  expand_limits(y = c(-3, 28))+
  theme(text = element_text(size = 20))
ggsave("Analysis/Graphs/CEE.pdf", width = 150, height = 100, units = "mm")


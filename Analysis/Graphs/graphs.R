############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 13.03.16
# Last edited: 22.03.16
# Contains graphs used in my master thesis

# loading libraries
library(ggplot2)
library(dplyr)
library(car)
library(grid)
library(gridExtra)
library(cowplot)

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



# Graphing the idioyncratic error
# ordering factor for scale from lowest to highest
order <- reorder(a$c.names, a$x)
ggplot(a, aes(x=order, y=x, group=member.f, colour=member.f)) +
  geom_point() +
  ylab("Country-specific errors") + xlab("Member State") +
  scale_colour_discrete(name = "Year of accession") +
  theme(text = element_text(size = 12))

# saving the plot
ggsave("Analysis/Graphs/country-specific_error.pdf", width = 297, height = 120,
       units = "mm")

################
# Eurosceptic misfits in Original 6 MS over time
################
source("Analysis/Graphs/functions.R")

# creating data frame with id and country names
ids <- data.frame(nation = c(21, 22, 23, 31, 32, 41), 
                  name = c("Belgium", "The Netherlands", "Luxembourg", "France",
                           "Italy", "Germany"))

# Creating list will all plots inside it 
plots <- list()
for(i in 1:nrow(ids)) {
  plot <- drawgg(ids$nation[i], ids$name[i])
  plots[[i]] <- plot
}



# Drawing graphs by hand
DE <- drawgg(41, "Germany")
class(DE) <- c("gg", "ggplot")
BE <- drawgg(21, "Belgium")
class(BE) <- c("gg", "ggplot")
NL <- drawgg(22, "The Netherlands")
class(NL) <- c("gg", "ggplot")
LU <- drawgg(23, "Luxembourg")
class(LU) <- c("gg", "ggplot")
FR <- drawgg(31, "France")
class(FR) <- c("gg", "ggplot")
IT <- drawgg(32, "Italy")
class(IT) <- c("gg", "ggplot")

plot_grid(DE, BE, NL, LU, FR, IT, ncol = 2, nrow = 3)

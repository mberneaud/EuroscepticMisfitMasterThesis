############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 10.03.16
# Last edited: 10.03.16
# Contains estimation of my models used in the analysis of the eurosceptic misfit
# using Prais-Winsten estimation 

CYdata <- read.csv("Analysis/Merge/CYmerge.csv")

# loading necessary packages

# Setting data as time series
test <- ts(CYdata, start = 1979, end = 2009, frequency = 0.2)

# Creating a table of the autocorrelation of all the variables in the model 
ac < - table.Autocorrelation(test, digits = 4)

# Conducting a regular linear model without adjustment for AR(1) processes
lm <- lm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, data = CYdata)

# Conducting the Prais-Winsten estimation

pw <- panelAR(diff.EUS ~ avg.EUS + pola.index + enop + member.dur
                    + CEE, data = CYdata, timeVar = year.f, panelVar = nation.f)

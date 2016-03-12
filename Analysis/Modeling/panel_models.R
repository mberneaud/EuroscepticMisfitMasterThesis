############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 10.03.16
# Last edited: 10.03.16
# Contains estimation of my models used in the analysis of the eurosceptic misfit
# using Prais-Winsten estimation 

CYdata <- read.csv("Analysis/Merge/CYmerge.csv")

# loading necessary packages
library(dplyr)
library(plm)

#############################
# Linear Regression Model
#############################


# Conducting a regular linear model without adjustment for AR(1) processes again
lm <- lm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, data = CYdata)
summary(lm)

###########################
# Prais-Winsten estimation
###########################

# creating time and year factor variables
CYdata$year.f <- as.factor(CYdata$year)
CYdata$nation.f <- as.factor(CYdata$nation)


#pw <- panelAR(diff.EUS ~ avg.EUS + pola.index + enop + member.dur
#                    + CEE, data = CYdata, timeVar = year.f, 
#            panelVar = nation.f)


##########################
# Random effects and fixed effects model
##########################

# re-arranging data frame to fit with plm package (nation and year in front)

panel <- select(CYdata, nation, year, diff.EUS, avg.EUS, pola.index, enop,
                member.dur, CEE, nation.f, year.f)

EUS.fe <- plm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, 
              data = panel, model = "within")

summary(EUS.fe)

EUS.re <- plm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, 
              data = panel, model = "random")

summary(EUS.re)


# Hausman test for consistency of the estimates
phtest(EUS.fe, EUS.re)  # comes back showing the models are consistent

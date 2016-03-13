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
library(stargazer)


# re-arranging data frame to fit with plm package (nation and year in front)
panel <- select(CYdata, nation, year, diff.EUS, avg.EUS, gen.EUS, inst.EUS, 
                pola.index, enop, member.dur, CEE)

# Changing the nation and year variables to be factors
panel$nation <- as.factor(panel$nation)
panel$year <- as.factor(panel$year)
panel$CEE <- as.factor(panel$CEE)

# creating summary statistics for the panel subset of the data 
stargazer(panel)

##########################
# Preliminary models
##########################

# Linear models without taking panel structure into consideration
lm <- lm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, data = panel)

summary(lm)

##########################
# Random effects and fixed effects model
##########################

# Estimating the models

EUS.fe <- plm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, 
              data = panel, model = "within")

summary(EUS.fe)

EUS.re <- plm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, 
              data = panel, model = "random")

summary(EUS.re)


# Hausman test for consistency of the estimates
phtest(EUS.fe, EUS.re)  # comes back showing the models are consistent


# comparing the two models side by side
stargazer(lm, EUS.fe, EUS.re, title = "Regression Results", font.size = "small")


# Estimating a model which for inst.EUS and gen.EUS with the 
# same predictors

split.EUS.re <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
                         data = panel, model = "random")

summary(split.EUS.re)  # Checking out the results

split.EUS.fe <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
                 data = panel, model = "within")

summary(split.EUS.fe)  # Checking out the results

# Conducting Hausman test for the two estimates
phtest(split.EUS.fe, split.EUS.re)


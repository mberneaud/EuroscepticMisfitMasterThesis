############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 10.03.16
# Last edited: 13.03.16
# Contains estimation of my models used in the analysis of the eurosceptic misfit
# using random effects and fixed effects models

CYdata <- read.csv("Analysis/Merge/CYmerge.csv")

# loading necessary packages
library(dplyr)
library(plm)
library(stargazer)
library(lmtest)
library(prais)


# re-arranging data frame to fit with plm package (nation and year in front)
panel <- select(CYdata, nation, year, diff.EUS, avg.EUS, gen.EUS, inst.EUS, 
                pola.index, enop, member.dur, CEE)

# Changing the nation and year variables to be factors
panel$nation <- as.factor(panel$nation)
panel$year.f <- as.factor(panel$year)
panel$CEE.f <- as.factor(panel$CEE)

write.csv(panel, "Analysis/Merge/panel.csv")

# creating summary statistics for the panel subset of the data 
stargazer(panel)

panel <- plm.data(panel, indexes = c("nation", "year.f"))

# arranging correctly into consecutive year
panel <- arrange(panel, nation, year)

##########################
# Pooled OLS model
##########################

# Linear models without taking panel structure into consideration
pool <- plm(diff.EUS ~ avg.EUS + pola.index + enop + member.dur + CEE, data = panel,
            model = "pooling")

summary(pool)

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
stargazer(pool, EUS.fe, EUS.re, title = "Regression Results", font.size = "small")


# Estimating a model which treats inst.EUS and gen.EUS as separate with the 
# same predictors

split.pool <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur +
                 CEE, data = panel, model = "pooling")

split.EUS.re <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
                         data = panel, model = "random")

summary(split.EUS.re)  # Checking out the results

split.EUS.fe <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
                 data = panel, model = "within")

summary(split.EUS.fe)  # Checking out the results

# Creating output for the split models in stargazer
stargazer(split.pool, split.EUS.fe, split.EUS.re, type = "text",
          title = "Regression Results", font.size = "small")


##########################
# Post-estimation tests of assumptions
##########################

# Check for panel heteroskedasticity
bptest(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
       data = panel, studentize = FALSE)
# Result: there is strong panel heteroskedasticity

# Comparing random effects model to pooled OLS / checking for panel effects
plmtest(split.pool, type = "bp")  # pooled OLS is not feasible, strong panel effects

# Check for cross-sectional dependence using Pesaran test
pcdtest(split.EUS.fe, test = c("cd"))  # does not return anything
pcdtest(EUS.fe, test = c("cd")) # does not return anything either

# Check for cross-sectional dependence using Breusch-Pagan LM test
pcdtest(split.EUS.fe, test = c("lm")) # does not return anything either

# Check for serial correlation in error term 
pbgtest(split.EUS.fe) # results indicate that there is serial correlation

# Checkf for unity roots/stationarity
library(tseries)
adf.test(panel$diff.EUS)  # process is not stationary, but weakly dependent, as 
# is evidenced by the small estimated rho from the prais-winsten estimation

# Conducting Hausman test for the two estimates
phtest(split.EUS.fe, split.EUS.re)

##########################
# Employing results from diagnostics
##########################

# calculating PCSE according to Beck and Katz (1995) for the estimates
PCSE.fe <- coeftest(split.EUS.fe, vcovHC)
stargazer(PCSE.fe)

# Estimating a Prais Winsten Model to account for the persistence

pw <- prais.winsten(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 



# Non-stationarity 

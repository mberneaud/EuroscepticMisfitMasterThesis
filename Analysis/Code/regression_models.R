############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 10.03.16
# Last edited: 03.05.16
# Contains estimation of my models used in the analysis of the eurosceptic misfit
# using random effects and fixed effects models

CYdata <- read.csv("Analysis/Merge/CYmerge.csv")

# loading necessary packages
library(dplyr)
library(plm)
library(stargazer)
library(lmtest)

# re-arranging data frame to fit with plm package (nation and year in front)
panel <- select(CYdata, nation, year, diff.EUS, avg.EUS, gen.EUS, inst.EUS, 
                pola.index, enop, member.dur, CEE)



write.csv(panel, "Analysis/Merge/panel.csv")

# creating a summary statistics table for the dataset in the analysis
panel2 <- select(panel, -nation, -year, -avg.EUS, -CEE)
stargazer(panel2, label = "fig: summarystatistics", title = "Summary Statistics",
          covariate.labels = c("Eurosceptic Misfit", "General Euroscepticism", "Instrumental Euroscepticism",
                               "Polarisation Index", "Effective Number of Parties", 
                               "Membership Duration", digits = 2),
          out = "Presentation/Latex/summary_statistics.tex")


# Changing the nation and year variables to be factors
panel$nation <- as.factor(panel$nation)
panel$year.f <- as.factor(panel$year)
panel$CEE.f <- as.factor(panel$CEE)

#setting data as plm panel
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



# Estimating a model which treats inst.EUS and gen.EUS as separate with the 
# same predictors

split.pool <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur +
                 CEE + factor(year), data = panel, model = "pooling")

split.EUS.re <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
                         data = panel, model = "random")

summary(split.EUS.re)  # Checking out the results

split.EUS.fe <- plm(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + member.dur + CEE, 
                 data = panel, model = "within")

summary(split.EUS.fe)  # Checking out the results



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
pwartest(split.EUS.fe) # There is no serial correlation

# Checkf for unity roots/stationarity
library(tseries)
adf.test(panel$diff.EUS)  # process stationary, but weakly dependent, as 
# is evidenced by the small estimated rho from the prais-winsten estimation

# Conducting Hausman test for the two estimates
phtest(split.EUS.fe, split.EUS.re)

##########################
# Employing results from diagnostics
##########################

# calculating PCSE according to Beck and Katz (1995) for the estimates
PCSE.fe <- coeftest(split.EUS.fe, vcovBK)
# Warning: Beck and Katz can really understate the errors when T not at least 3*N

# Regular white robust standard errors for RE and FE models
robust.fe <- coeftest(split.EUS.fe, vcovHC)
robust.re <- coeftest(split.EUS.re, vcovHC)


stargazer(robust.fe, robust.re, label = "tab: results", column.labels = c("FE", "RE"),
          title = "Fixed Effects and Random Effects Estimation with robust standard errors",
          dep.var.labels = "Eurosceptic Misfit", covariate.labels = 
            c("General Euroscepticism", "Instrumental Euroscepticism",
              "Polarisation Index", "Effective Number of Parties", 
              "Membership Duration", "Central/Eastern European"), digits = 2,
          out = "Presentation/Latex/regression_results.tex")



# extracting the fixed effects "intercepts"
fixeffs <- fixef(split.EUS.fe)
fixeffs <- as.vector(fixeffs)
write.table(fixeffs, "Analysis/Merge/fixeffs")


# Table
mytable <- table(EBMerge$gen.EUS, EBMerge$inst.EUS)
prop.table(mytable, 1)

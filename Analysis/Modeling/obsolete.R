############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 22.03.16
# Last edited: 22.03.16
# Contains panel model estimation using prais winsten transformation which 
# I abandoned later because they didn't allow me to correctly control for 
# various types of heteroscedasticity


# to include the intercepts for each country, the package prais requires me to
# use dummies for all countries except one as the function does not accept factors
levels <- levels(panel$nation)
c.names <- c("Sweden",	"Denmark",	"Finland",	"Belgium",	"The Netherlands",
             "Luxembourg",	"France",	"Italy",	"Spain",	"Greece",	"Portugal",
             "Cyprus",	"Malta",	"Germany",	"Austria",	"United Kingdom",	"Ireland",
             "Bulgaria",	"Czech Republic",	"Estonia",	"Hungary",	"Latvia",	"Lithuania",
             "Poland",	"Romania",	"Slovakia",	"Slovenia")  # useless because in
    # wrong order

for(i in seq_along(levels)) {
  used <- levels[i]
  panel$temp <- ifelse(panel$nation == levels[i], 1, 0)
  names(panel) <- sub("^temp$", paste0("dummy", ".", levels[i]), names(panel))
}

# Writing .csv for possible use in STATA
write.csv(panel, "Analysis/Modeling/panel_with_dummies.csv")

# Estimating a Prais Winsten Model to account for the persistence of non-stationarity

pw <- prais.winsten(diff.EUS ~ gen.EUS + inst.EUS + pola.index + enop + 
                      member.dur + dummy.13 + dummy.14 + dummy.31 +
                      dummy.32 + dummy.33 + dummy.34 + dummy.35 + dummy.36 +
                      dummy.37 + dummy.41 + dummy.42 + dummy.51 + dummy.53 +
                      dummy.80 + dummy.82 + dummy.86 + dummy.87 + dummy.88 +
                      dummy.92 + dummy.93 + dummy.96 + dummy.97, data = panel)


# creating summary statistics for the panel subset of the data 
panel2 <- select(panel, nation, year, diff.EUS, gen.EUS, inst.EUS,
                 pola.index, enop, member.dur, CEE)
panel2$CEE <- factor(panel2$CEE, labels = c("not CEE", "CEE"))
panel2$year <- as.factor(panel2$year)
stargazer(panel2, title = "Summary Statistics for Variables in the Models", covariate.labels =
            c("Eurosceptic Misfit", "General Euroscepticism", "Instrumental Euroscepticism",
              "Polarisation Index", "Effective Number of Parties", "Membership Duration"))




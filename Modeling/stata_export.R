# 
library(haven)

CYstata <- read.csv("Analysis/Merge/CYmerge.csv")

names(CYstata) <- c("X", "country_year", "MeanEUstance", "sdEUstance", "leftMean",
                   "polaSum", "polaIndex", "rileSum", "rilePolaIndex", "sumsEUSvote",
                   "nation", "year", "genEUS", "instEUS", "p2sum", "enop",
                   "member", "CEE", "memberDur", "avgEUS", "diffEUS")

write_dta(CYstata, "Analysis/Merge/CYstata.dta")

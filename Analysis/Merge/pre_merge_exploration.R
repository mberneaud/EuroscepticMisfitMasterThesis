############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 07.03.16
# Contains some exploration I did on the data sets I merged pre-merging
# steps here are optional when recreating the data

# Doing some analysis on the variables in the data sets
length(unique(MZESdata$party))
length(unique(EUmanifesto$party)) ## only one party ID which is not shared
filter(MZESdata, country == 14) %>% select(party)  # I thought I remembered some
# missing values from the Finnish observations

filter(EUmanifesto, country == 14) %>% select(party)  # no, everything fine

#checking for classes of merge categories
class(EUmanifesto$year)
class(MZESdata$year)

class(EUmanifesto$party)
class(MZESdata$party)


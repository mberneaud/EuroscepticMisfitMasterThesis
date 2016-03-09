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

# Tests prior to coding the Polarisation Index 

table(Merge1$vote) # has 18 -777 in it still
table(Merge1$rile_mrg)  # No zeros in there
table(Merge1$rile.mean) # also no zeros
table(Merge1$rile_mrg - Merge1$rile.mean) # there are 4 zeros in there 

# Checking out coder rating right-left scale as a possible alternative
table(Merge1$left)


# Miscellaneous stuff

select(Merge1, vote, left, left.mean)  %>% filter(country_year == "11_09") %>% table()

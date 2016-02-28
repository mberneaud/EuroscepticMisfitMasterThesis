# Data Used in the Analysis
This file contains information on all the files that are used in the analysis here and where I obtained them

### [European Election Studies](http://eeshomepage.net/)
Data is available through the [Data Archive of GESIS](http://www.gesis.org/home/) – Leibniz Institute for the Social Sciences. Data from GESIS is only available after prior registration on the website and is free for most non-commercial research uses.

### [Manifesto Project at WZB Berlin](https://manifesto-project.wzb.eu/)
Data on national parties and their stances on various policy issues is available through the API accessed via the `manifestoR` package.This requires an API-key, which can be downloaded after registration.

### [Euromanifesto Project at MZES Mannheim](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=5102&db=e&doi=10.4232/1.5102)
+ **the .dta file obtained from the link above goes into the same folder as this document for the analysis conducted**
+ Contains data on the positions of parties that participated in EU elections
+ from 1979 to 2009, so excludes last elections in 2014
+ straight-up codebook starts on page 83 (last chapter)
+ Interesting variables:
  + _pro_anti_EU_ : coded from -100 to 100 dimension on pro-vs-contra European integration (-100 anti-EU; 100 pro-EU)
  + _country_ : factor variable that denotes the country
  + _country_year_ : concatenated factor from the country ID (obscured by its label in R, but visible in Stata)
  + _vote_ : a country's vote share at the national level (which coincides with one of the control variables of my research)
  + _multicult_ : a variable coded from 1:10 expressing whether a party embraces multiculturalism (1) or ethnocentrism (10)

## Data on European election results
I probably have to use data from the European Election Studies instead of real aggregate vote data, as such data is not really available on the national level going back to 1979 in the form of a real database.
However, there's the European Election Database, which contains information on all European Parliament elections that have taken place since 1990, which is missing 3 election rounds. Their website can be found [here](http://www.nsd.uib.no/european_election_database/election_types/ep_elections/). Unfortunately, there are some problems with the data. For example, they are not all formatted the same way for all time periods and countries and they are also not all available in CSV. This means additional trouble when trying to work with the data. At least I don't have to collect all the data by hand. 

### [European Election Studies 1984](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=1321&db=e&doi=10.4232/1.10879) (coded ZA1321 by GESIS)
+ Because there was no possibility of conducting research for the 1984 EES, the questions were included into two different Eurobarometers.
+ Interesting variables:
  + v147 : contains information on the parties respondents voted for in the preceding 1984 elections. There are ~7000 observations of people who voted and not that many parties, so there might be some merit to using that data. Coding of the variables can be found in the corresponding codebook on page 151ff. (page 176ff in the PDF reader)

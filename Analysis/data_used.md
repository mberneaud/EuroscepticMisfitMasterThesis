# Data Used in the Analysis2
This file contains information on all the files that are used in the analysis here and where I obtained them

## Data on attitudes of European voters

### [European Election Studies](http://eeshomepage.net/)
Data is available through the [Data Archive of GESIS](http://www.gesis.org/home/) – Leibniz Institute for the Social Sciences. Data from GESIS is only available after prior registration on the website and is free for most non-commercial research uses.

### [Eurobarometer](https://dbk.gesis.org/dbksearch/PDESC2.asp?no=0001&search=&search2=&DB=e&tab=0&notabs=&nf=1&af=&ll=10)
I used the following Eurobarometers in my Analysis. All of them can be downloaded on the GESIS homepage after registration. All these files were put into the respective folders (named "Spring 1979 to Spring 2004") in the Data/Eurobarometer sub-folder for conducting the analysis. Without "reproducing" this step by hand, the files in my Analysis won't work.
+ [April 1979](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=1036&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10)
+ [April 1984](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=1320&db=e&doi=10.4232/1.10878)
+ [March/April 1989](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=1750&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10)
+ [March-May 1994](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=2490&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10)
+ [November-December 1995](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=2690)
+ [April-May 1996](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=2831)
  + [Source on dates of AT and FI elections](http://www.europarl.europa.eu/press/sdp/backg/en/1996/b961007.htm)
+ [March-May 1999](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=3171&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10)
+ [October-November 2004](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=4229)
+ [January-February 2009](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=4971)



## Data on European election results on the national level
There's the European Election Database, which contains information on all European Parliament elections that have taken place since 1990, which is missing 3 election rounds. Their website can be found [here](http://www.nsd.uib.no/european_election_database/election_types/ep_elections/). Unfortunately, there are some problems with the data. For example, they are not all formatted the same way for all time periods and countries and they are also not all available in CSV. This means additional trouble when trying to work with the data. At least I don't have to collect all the data by hand.

### [Mannheim documentation of the results of the European elections 1979 to 2004](http://www.mzes.uni-mannheim.de/d7/en/pages/mannheim-documentation-of-the-results-of-the-european-elections-1979-to-2004)
**The SPSS data file and the documentation is downloaded through sourcing [Analysis/Data/MZESData/downloading_MZES_data.R](Analysis/Data/MZESData/downloading_MZES_data.R)**
+ Contains the missing data from pre-1990 which I desperately need
+ available only in SPSS data format (.sav), but this can be read by R
+ For the analysis, the dataset is downloaded into

## Data on European parties and their policy stances

#### [Manifesto Project at WZB Berlin](https://manifesto-project.wzb.eu/)
Data on national parties and their stances on various policy issues is available through the API accessed via the `manifestoR` package.This requires an API-key, which can be downloaded after registration.

#### [Euromanifesto Project at MZES Mannheim](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=5102&db=e&doi=10.4232/1.5102)
**the .dta file obtained from the link above goes into the Data/Analysis/Euromanifesto folder**
+ Contains data on the positions of parties that participated in EU elections
+ from 1979 to 2009, so excludes last elections in 2014
+ straight-up codebook starts on page 83 (last chapter)
+ Interesting variables:
  + _pro_anti_EU_ : coded from -100 to 100 dimension on pro-vs-contra European integration (-100 anti-EU; 100 pro-EU)
  + _country_ : factor variable that denotes the country
  + _country_year_ : concatenated factor from the country ID (obscured by its label in R, but visible in Stata)
  + _vote_ : a country's vote share at the national level (which coincides with one of the control variables of my research)
  + _multicult_ : a variable coded from 1:10 expressing whether a party embraces multiculturalism (1) or ethnocentrism (10)

# Listing of external, restricted-access data in the analysis
This file contains information on all the files that are used in the analysis here and where I obtained them. These data are not openly available and must be downloaded by hand in order to reproduce the merging, aggregation and subsequent analysis of the data.

## Data on attitudes of European voters
### [Eurobarometer](https://dbk.gesis.org/dbksearch/PDESC2.asp?no=0001&search=&search2=&DB=e&tab=0&notabs=&nf=1&af=&ll=10)
I used the following Eurobarometers in my Analysis. All of them can be downloaded on the GESIS homepage after registration. All these files were put into their respective directories in the `Data/Eurobarometer` sub-directory. Please follow the links below to obtain the data and place them into the folders as indicated. **Note: Without "reproducing" this step by hand, the files in my Analysis won't work.**
+ [April 1979](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=1036&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10): -> `Spring 1979` subdirectory
+ [April 1984](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=1320&db=e&doi=10.4232/1.10878) -> `Spring 1984` subdirectory
+ [March/April 1989](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=1750&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10) -> `Spring 1989` subdirectory
+ [March-May 1994](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=2490&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10) -> `Spring 1994` subdirectory
+ [November-December 1995](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=2690) -> `Sweden 1995` subdirectory
+ [April-May 1996](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=2831) -> `Astria Finland 1996` subdirectory 
  + [Source on dates of AT and FI elections](http://www.europarl.europa.eu/press/sdp/backg/en/1996/b961007.htm) 
+ [March-May 1999](https://dbk.gesis.org/dbksearch/SDESC2.ASP?no=3171&db=e&search=&search2=&tab=0&notabs=&nf=1&af=&ll=10) -> `Spring 1999` subdirectory
+ [October-November 2004](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=4229) -> `Fall 2004` subdirectory
+ [January-February 2009](https://dbk.gesis.org/dbksearch/SDesc2.asp?ll=10&notabs=&af=&nf=&search=&search2=&db=E&no=4971) -> `January-February 2009` subdirectory


## Data on European parties and their policy stances and national European Parliament Election results
### [Euromanifesto Project at MZES Mannheim](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=5102&db=e&doi=10.4232/1.5102)
**the .dta file obtained from the link above goes into the `Analysis/Data/Euromanifesto` folder**
+ Contains data on the positions of parties that participated in EU elections
+ from 1979 to 2009, so excludes last elections in 2014
+ straight-up codebook starts on page 83 (last chapter)
+ Interesting variables:
  + _pro_anti_EU_ : coded from -100 to 100 dimension on pro-vs-contra European integration (-100 anti-EU; 100 pro-EU)
  + _country_ : factor variable that denotes the country
  + _country_year_ : concatenated factor from the country ID (obscured by its label in R, but visible in Stata)
  + _vote_ : a country's vote share at the national level (which coincides with one of the control variables of my research)


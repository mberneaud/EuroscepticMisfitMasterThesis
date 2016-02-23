# Data Used in the Analysis
This file contains information on all the files that are used in the analysis here and where I obtained them

* [European Election Studies](http://eeshomepage.net/): data is available through the [Data Archive of GESIS](http://www.gesis.org/home/) – Leibniz Institute for the Social Sciences. Data from GESIS is only available after prior registration on the website and is free for most non-commercial research uses.

* [Manifesto Project at WZB Berlin](https://manifesto-project.wzb.eu/): data on national parties and their stances on various policy issues is available through the API accessed via the `manifestoR` package.This requires an API-key, which can be downloaded after registration.

+ [Euromanifesto Project at MZES Mannheim](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=5102&db=e&doi=10.4232/1.5102)
  + **goes into the same folder as this document for the analysis conducted**
  + Contains data on the positions of parties that participated in EU elections
  + from 1979 to 2009, so excludes last elections in 2014
  + straight-up codebook starts on page 83 (last chapter)
  + Interesting variables:
    + _pro_anti_EU_ : coded from -100 to 100 dimension on pro-vs-contra European integration (-100 anti-EU; 100 pro-EU)
    + _country_ : factor variable that denotes the country
    + _country_year_ : concatenated factor from the country ID (obscured by its label in R, but visible in Stata)
    + _vote_ : a country's vote share at the national level (which coincides with one of the control variables of my research)
    + _multicult_ : a variable coded from 1:10 expressing whether a party embraces multiculturalism (1) or ethnocentrism (10)

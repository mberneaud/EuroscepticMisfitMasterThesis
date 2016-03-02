# Notes of my merge of the MZES Documentation on the European Parliament elections from 1979 to 2004 and the Euromanifesto data
This repo contains some general information, ideas and musings I wrote down for myself while preparing the merge of the two most important datasets available to me.
Accordingly, the content of this document will be only poorly structured as it is comprised mostly of snippets and things which popped into my head.

## General issues
+ There are roughly 300 observations more in the MZES data set as compared to the Euromanifesto data set
+ The MZES data set is encoded as a SPSS .sav file whereas the Euromanifesto data is encoded as a STATA data file (.dta)
+ Found out that it's best to pass both `read.dta` and `read.spss`the correct args to prevent R from using the value labels assigned to the data

## Ideas for unique identifier
+ Important: when reading data into R, best compatibility is achieved by letting R ignore value labels and using underlying coding in SPSS/STATA
+ Used the two variables _year_ and _party_ now
  + _party_ variable has the two-number country code "baked in"

# Some random notes on how I combined the data from the CSVs into one data set which I can use for building onto later
I loosely group those in the order by which they are carried out in the end.

## Idea on layout of the data set
Variables:
+ country
+ year
+ vote share of EUS party
+ Share of seats in national parliament
+ Number of parties up for election / number of effective parties
+ Polarisation index

### Problem of messy data in all .csv files
All the data I have in my .csv files are considered 'messy data' for my analysis as the observations I am interested in (national parties) are listed as columns. For that, I can use the gather() function from dplyr. However, at this point of the anaylsis, it would need me to change my function for the conversion in percent (exchange cbind and ncols fucntion with row-equivalents)

### Reducing data sets to just the last row, which contains the aggregated national data
+ easy using tail(..., n = 1L)
  + however, it is difficult to do so for all data frames automatically, as naming them seems to be a bit tricky with the names() function.
  + Maybe I can use `R names(df) <- strtrim(file.names[i], 8L)` or something similar to make stuff work.  

### Converting absolute vote data into percent shares
+ probably easiest to do it using the mutate function of dplyr or slightly more difficult syntax with base tools
+ Figure out a way to make it work for different numbers of parties
  + Upper/lower case differencing between party names and other vars doesn't work because of inconsistencies
  + Made a function now that requires too much user input though, as you need to specify the amount of leading non-party columns in the data frame

### Combining party names with indicators of EUS from the Euromanifesto project

### Opening Excel files
Use import function from rio package, or use Source_xlsx from repmis package (both are packages are written by Gandrud and exact names and syntax can be found in his slides).


### Manual changes in data
DKEP1999!Download_F1.csv had a last row which was trailing blanks, so I removed it by hand. The same was true for the following files also:
+ CYEP2009!Download_F1.csv
+ IEEP2009!Download_F1.csv
+ NLEP2004!Download_F1.csv
+ **GREP2009!Download_F1.csv** is all kinds of FUBAR'ed and needs adjustment
+ NLEP1999!Download_F1.csv had source information at the bottom

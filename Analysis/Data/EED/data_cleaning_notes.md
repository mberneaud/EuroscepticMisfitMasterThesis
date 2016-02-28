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

### Reducing data sets to just the last row, which contains the aggregated national data
+ easy using tail(..., n = 1L)
  + however, it is difficult to do so for all data frames automatically, as naming them seems to be a bit tricky with the names() function.
  + Maybe I can use ```R names(df) <- strtrim(file.names[i], 8L)``` or something similar to make stuff work.  

### Converting absolute vote data into percent shares
+ probably easiest to do it using the mutate function of dplyr or slightly more difficult syntax with base tools
+ Figure out a way to make it work for different numbers of parties
  + Upper/lower case differencing between party names and other vars doesn't work because of inconsistencies
  + Made a function now that requires too much user input though, as you need to specify the amount of leading non-party columns in the data frame

### Combining party names with indicators of EUS from the Euromanifesto project

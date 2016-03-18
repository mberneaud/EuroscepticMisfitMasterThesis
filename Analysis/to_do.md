# To-do of data cleaning and data merging for my analysis

### European national parties data
1. ~~Merging Euromanifesto data in with data for party vote shares~~
2. ~~Creating a "eurosceptic.party" dummy variable~~

### Data on attitudes of European voters
1. ~~Decide on which operational definition to use~~
   * ~~has to be available in all Eurobarometers~~ Used instrumental EUS and general EUS, as they were the only one available in appropriate Eurobarometers
2. ~~Download all the Eurobarometer data from GESIS~~
   * ~~Document all data sources, at least links~~
3. ~~Possible use attitudes from EES data~~
4. ~~Calculate national levels of Euroscepticism for all MS~~
   * Done from Eurobarometer data

### National contextual factors
1. ~~Get data on recipient / contributor status for EU Member States~~ no data readily available
2. ~~Calculate polarisation index for countries in the sample, use EU parties stance on integration computed variable from EMP~~
3. ~~Calculate effective number of parties~~

### Statistical analysis
1. ~~Create summary statistics of all variables in my data set~~
2. ~~Creating graphs of EUS party vote share, EUS attitudes and difference over time~~
3. b) create graphs of the above for all countries
4. c) create scatterplot matrices
5. Sequentially run models
  + Establish whether pooled OLS or random effects model with Breusch Pagan LM (Langrange Multipler) test ->
  + compared fixed effects and OLS using pFtest(fixed, ols)
  + ~~Establish whether fixed effect or random effects model (estimate with Hausman test routine in plm package)~~ -> both okay
  + ~~Find package to export results to LaTeX without needing to continue writing my thesis in RStudio~~ stargazer!
  + possibly include interaction effect -> CEE and something
6. Check for cross-sectional dependence in the panel
  + according to Baltagi () cross-sectional dependece is a problem in macro panels with long time series, but not so much in micro panels which have short time series and larger N
  + For large N and small t use cross-sectional dependency (CD) test (by Pesaran, Frees or Friedman)
      + Pesaran most useful for unbalanced panels as it also uses observations that are not available for all panel units
      + if sign of correlations is alternating between Friedman and Pesaran, the test is unreliable and test too optimistic as they cancel each other out
7. Check for serial correlation in the panel
  + use Woolridge (2002) test
  + if correlation is severe, need to apply Cochrane-Orcutt transformation to the data to remedy serial correlation
    + alternative is to include the first lag of the dependent variable to list of regressors
8. Check for panel heteroskedasticity in the data (variance within clusters is constant, but differs betweeen panel units)
  + use the Wald test for group-wise heterogeneity
9. Check for tolerance and VIF and in the model using both measures of EUS separately

### Graphs to do
1. Plotting avg. EUS in all old MS over the study period
2. Plotting heterogeneity across countries using plotmeans from the gplots package

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
1. Create summary statistics of all variables in my data set
2. Creating graphs of EUS party vote share, EUS attitudes and difference over time
3. Sequentially run models
  + Establish whether fixed effect or random effects model (estimate with Hausman test routine in plm package)
  + Find package to export results to LaTeX without needing to continue writing my thesis in RStudio
  + possibly include interaction effect

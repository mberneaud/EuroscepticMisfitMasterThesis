# Notes on coding of variables in the EU Manifesto Dataset as extracted from Stata 13 variable labels

**varname: integration**
label list INTEGRAT
INTEGRAT:
        -999 unavailable
        -777 unknown
           1 pro-EU-intergation
          10 anti-EU-integration
          99 no answer

**varname: pro_anti_EU**
Variable coded from -100 to 100 in theory indicating whether a party is for or against EU integration. Created by summing up pro-EU-intergation codes and substracting the sum of contra-EU-integration codes from it. For detailed list of codes see the data set codebook linked [here](./Analysis/Data/data_used.md).
_this variable could be possible very useful in calculating which parties are considered Eurosceptic in my final dataset, possibly with categorizing all parties as Eurosceptic which exhibit values < -1Z on this dimension_

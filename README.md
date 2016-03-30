# Eurosceptic Misfit Master Thesis
Here, data collection and analysis for my master thesis examining the 'Eurosceptic Misfit' between popular levels of Euroscepticism and electoral support for Eurosceptic parties in the EU will be published.

This is the first version of the repository and the analysis, which might be subject to further .

# Reproducing my research
If one wants to recreate the data, it is best to first have a look at the [Markdown file](./Analysis/Data/data_used.md) file documenting which data sets I used in my analysis, obtain them and arrange them into the repo's folders as outlined in the markdown. Afterwards, all parts of the analysis can be reproduced using my [master source file]((./Analysis/Data/master.R). As this links to all the sub-files containing parts of my analysis.

# Information on data used
The data used in my research is mostly not publicly accessible without former registration, so will be excluded from this repo for legal reasons. However, a detailed overview of the data used and where to obtain them can be found in this [Markdown file](./Analysis/Data/data_used.md).

# Overview of files and directories
_includes information on the structure of this repository for easier navigation_

## Important files
**[master.R](./Analysis/Data/master.R)**: links all other files used for data collection and merging together in the correct sequence. This is the go-to file if you have downloaded all the data necessary and want to recreate the analysis.

**[data_used.md](./Analysis/Data/data_used.md)**: This text file contains information on which data I used in my analysis, where and when I obtained it and where I saved it, in order to enable reproduction of the analysis. Also contains links to all the data files which are necessary for reproduction.

**[preparing_EB_data.R](Analysis/Data/Eurobarometer/preparing_EB_data.R)**: contains the source code for selecting, cleaning, merging and aggregating the Eurobarometer data I used.

**[preparing_EUM_data.R](Analysis/Data/Euromanifesto/preparing_EUM_data.R)**: contains the source code for cleaning and preparing the Euromanifesto data I used.

**[merging_recoding_data.R](Analysis/Merge/merging_recoding_data.R)**: contains the source code for merging together the Euromanifesto and Eurobarometer data, as well as the computation of variables I used in my analysis. 

**[merging_recoding_data](Analysis/Merge/aggregation_to_national_level.R)**: contains the source code for aggregating the data into nation-years

###Important directories
**[Analysis](./Analysis)**: This directory contains all files related to the analysis carried out in the context of my thesis.

**[Analysis/Data](./Analysis/Data)**: contains all scripts used for loading and gathering the data. Data downloaded for reproduction goes here. Different operations in the data are split into different source files. The file [master.R](./Analysis/Data/master.R) is the go to file which links all files together.

**[Analysis/Data/Merge](Analysis/Data/Merge)**: Contains the data sets obtained after merging and aggregating the data. Also contains various intermediate data sets, which I saved while the thesis was evolving.

**[Analysis/Data/Modeling](Analysis/Data/Modeling)**: Contains the source code for the statistical analysis and post-regression analytics I carried out and included in my thesis.

**[Analysis/Data/Graphs](Analysis/Data/Graphs)**: Contains the graphs used in my master thesis.


*The R source files and and nomenclature attempts to confirm to the [Google's R Styleguide](https://google.github.io/styleguide/Rguide.xml) for the most part*

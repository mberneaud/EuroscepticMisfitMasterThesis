# Eurosceptic Misfit Master Thesis
Here, data collection and analysis for my master thesis examining the 'Eurosceptic Misfit' between popular levels of Euroscepticism and electoral support for Eurosceptic parties in the EU will be published.

This is a work in progress, hence the present information is rudimentary at best right now, but will continue to grow as time goes on.

## Information on data used
The data used in my research is mostly not publicly accessible without former registration, so will be excluded from this repo for legal reasosns. However, a detailed overview of the data used can be found in [this Markdown file](./Analysis/Data/data_used.md).


## Overview of files and directories
_includes information on the structure of this repository for easier navigation_
### Important directories
**[Analysis](./Analysis)**: This directory contains all files related to the analysis carried out in the context of my thesis.

**[Analysis/Data](./Analysis/Data)**: contains all scripts used for loading and gathering the data. Data downloaded for reproduction goes here. Different operations in the data are split into different source files. The file [master.R](./Analysis/Data/master.R) is the go to file which links all files together.

**[ExternalDocumentation](./ExternalDocumentation)**: contains external documentation downloaded from the Internet pertaining to R packages used in the analysis conducted  

### Important files
**[initial_directory_setup.R](./initial_directory_setup.R)**: this is the most basic file. It contains information on the directory structure used in the analysis and how it was created.

**[data_used.md](./Analysis/Data/data_used.md)**: This text file contains information on which data I used in my analysis, where and when I obtained it and where I saved it, in order to enable reproduction of the analysis.

**[master.R](./Analysis/Data/master.R)**: links all other files used for data collection and merging together in the correct sequence.


*The R source files and and nomenclature attempts to confirm to the [Google's R Styleguide](https://google.github.io/styleguide/Rguide.xml) for the most part*

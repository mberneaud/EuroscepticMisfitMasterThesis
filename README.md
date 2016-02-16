# Eurosceptic Misfit Master Thesis
Here, data collection and analysis for my master thesis examining the 'Eurosceptic Misfit' between popular levels of Euroscepticism and electoral support for Eurosceptic parties in the EU will be published.

This is a work in progress, hence the present information is rudimentary at best right now, but will continue to grow as time goes on.

## Information on data used
The data used in my research as collected under the aegis of the [European Election Studies](http://eeshomepage.net/) and is available through the [Data Archive of GESIS](http://www.gesis.org/home/) – Leibniz Institute for the Social Sciences. Data from GESIS is only available after prior registration on the website and is free for most non-commercial research uses. Because of this, data files are excluded from this repo. However, a detailed overview of the data used can be found in [this Markdown file](./Analysis/Data/DataUsed.md).

## Overview of files and directories
_includes information on the structure of this repository for easier navigation_
### Important directories
**[Analysis](./Analysis)**: This directory contains all files related to the analysis carried out in the context of my thesis.

**[Analysis/Data](./Analysis/Data)**: contains all scripts used for loading and gathering the data. Data downloaded for reproduction goes here. Different operations in the data are split into different source files. The file [Master.R](./Analysis/Data/Master.R) is the go to file which links all files together.

**[ExternalDocumentation](./ExternalDocumentation)**: contains external documentation downloaded from the Internet pertaining to R packages used in the analysis conducted  

### Important files
**[SettingUpFilesAndDirectories.R](./SettingUpFilesAndDirectories.R)**: this is the most basic file. It contains information on the directory structure used in the analysis and how it was created.

**[DataUsed.md](./Analysis/Data/DataUsed.md)**: This text file contains information on which data I used in my analysis, where and when I obtained it and where I saved it, in order to enable reproduction of the analysis.

**[Master.R](./Analysis/Data/Master.R)**: links all other files used for data collection and merging together in the correct sequence.


*The R source files and and nomenclature attempts to confirm to the [Google's R Styleguide](https://google.github.io/styleguide/Rguide.xml) for the most part*

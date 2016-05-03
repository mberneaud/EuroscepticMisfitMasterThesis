# Eurosceptic Misfit Master Thesis
Here, data collection and analysis for my master thesis examining the 'Eurosceptic Misfit' between popular levels of Euroscepticism and electoral support for Eurosceptic parties in the EU will be published.

This is the first version of the repository and the analysis, which might be subject to further .

# Reproducing my research
If you want to reproduce the research, please follow these steps:

1. Have a look at the [Markdown file](./data_used.md) file documenting which data sets I used in my analysis (includes links)
2. Obtain all the data from GESIS and arrange them into the repo's folders as outlined in the markdown 
3. Reproduce the analysis by sourcing my [master file]((./master.R). This file links to all the sub-files containing parts of my analysis

# Information on data used
The data used in my research is mostly not publicly accessible without former registration, so will be excluded from this repo for legal reasons. However, a detailed overview of the data used and where to obtain them can be found in this [Markdown file](./data_used.md).

# Overview of files and directories
_includes information on the structure of this repository for easier navigation_

## Important files
**[thesis.pdf](./Presentation/Latex/thesis.pdf)**: My finalised master thesis in PDF format as generated from its [tex file](./Presentation/Latex/thesis.tex).

**[master.R](./master.R)**: links all other files used for data collection and merging together in the correct sequence. This is the go-to file if you have downloaded all the data necessary and want to recreate the analysis.

**[data_used.md](./data_used.md)**: This text file contains information on which data I used in my analysis, where and when I obtained it and where I saved it, in order to enable reproduction of the analysis. Also contains links to all the data files which are necessary for reproduction.

###Important directories
**[Analysis](./Analysis)**: This directory contains all files related to the analysis carried out in the context of my thesis.

**[Analysis/Code](./Analysis/Code)**: Contains all R source scripts which are used in the analysis

**[Analysis/Graphs](Analysis/Graphs)**: Contains the graphs used in my master thesis.

**[Presentation/Latex](./Presentation/Latex)**: Contains all the LaTeX-files for the creation of the PDF-version of my thesis. 

*The R source files and and nomenclature attempts to confirm to the [Google's R Styleguide](https://google.github.io/styleguide/Rguide.xml) for the most part*

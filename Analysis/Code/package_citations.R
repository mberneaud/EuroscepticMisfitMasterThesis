############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 29.03.16
# Last edited: 03.05.16
# Creates the bibtex file used for the package citations in my master thesis 

# Packages for package citations


pkglist <- c("ggplot2", "dplyr", "car", "haven", "plm", "stargazer", "lmtest",
             "knitr")


knitr::write_bib(pkglist, "Presentation/Latex/packages.bib")
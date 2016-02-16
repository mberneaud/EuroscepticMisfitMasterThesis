##### Downloading external documentatio
# Author: Malte Berneaud-Kötz
# Date: 16.02.2016

# manifestoR package vignette
fileURL <- "https://cran.r-project.org/web/packages/manifestoR/vignettes/manifestoRworkflow.pdf"
download.file(fileURL, "./ExternalDocumentation/manifestoRworkflow.pdf",
              method = "curl")

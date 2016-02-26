############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 23.02.16
# Last edited: 23.02.16
# Contains my attempts to access the REST API of the Norwegian Social
# Science Data Services (NSD) called Nesstar. 

library(httr)
APIUrl <- "http://129.177.90.166:80"
r <- GET(APIUrl, 
         query = list(format = "CSV"))
head(r)

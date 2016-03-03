#####Exploring data available from the manifestoR package
# Author: Malte Berneaud-Kötz
# Date: 16.02.2016

# Loading the necessary libraries
library(manifestoR)

mp_setapikey("./Analysis/Data/Euromanifesto/manifesto_apikey.txt")
data <- mp_maindataset()

# Selected only EU Member States and saved them to a new .csv in Data folder
EUMS <- filter(data, eumember == 10)
write.csv(EUMS, file = "./Analysis/Data/Euromanifesto/CMP_EUMS.csv")
dateDownloaded <- date()
write(dateDownloaded, file = "./Analysis/Data/Euromanifesto/CMP_EUMS_download_date")

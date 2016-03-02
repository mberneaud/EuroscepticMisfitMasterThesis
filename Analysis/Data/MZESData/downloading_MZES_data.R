############################
# Eurosceptic Misfit Master Thesis
# Author: Malte Berneaud-Kötz
# Date created: 02.03.16
# Last edited: 02.03.16
# Messing around and inspecting the "Mannheim documentation of the results of
# the European Parliament" data set

# Importing needed packages 
library(foreign)

# Downloading SPSS file
ifelse(!dir.exists("./Analysis/Data/MZESData/"), dir.create("./Analysis/Data/MZESData/"),
       print("destdir exists"))
file.URL <- "http://www1.mzes.uni-mannheim.de/projekte/euro_elections/EER_Release_1_1.sav"
download.file(file.URL, destfile = "./Analysis/Data/MZESData//EER_Release_1_1.sav")
dateDownloaded <- date()
write(dateDownloaded, file = "./Analysis/Data/MZESData//EUZMS_data_download_date")

# Downloading documentation
docURL <- "http://www1.mzes.uni-mannheim.de/projekte/euro_elections/EER_Release_1_1_en.pdf"
download.file(docURL, destfile = "./Analysis/Data/MZESData/Doc_EER_Release_1.1_en.pdf")

resultsURL <- "http://www1.mzes.uni-mannheim.de/projekte/euro_elections/Europawahlergebnissen-21-06-2007.pdf"
download.file(resultsURL, destfile = "./Analysis/Data/MZESData/Results_EER_Release_1.1_en.pdf")


# reading dataawriting the dataframe created into a csv file
MZESdata <- data.frame(read.spss("./Analysis/Data/MZESData/EER_Release_1_1.sav"))
write.csv(MZESdata, file ="./Analysis/Data/MZESData/EER_Release_1_1.csv")

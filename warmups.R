# 6th of 9 courses...
#install.packages('tidyverse')

library(tidyverse)
library(readxl)
library(dslabs)
rm(list=ls())

MyName <- readline("Okay, so what's your name? ")
print(paste("Then let's get started, ", MyName, sep=""))
readline("Tap any key to continue on to the course....")


path <- system.file("extdata", package = "dslabs")
files <- list.files(path)
files

filename <- "murders.csv"
murdat <- read_csv(file.path(path, filename))
murdat
murdat$region <- as.factor(murdat$region)
head(murdat)
rm(list=ls())


XlFile <- file.path("C:", "Users", "Charles", "OneDrive", "Desktop", "TempStuff", "Analytics", "Affordability.xlsm")
#alternatively:  XlFile <- ("C:\\Users\\Charles\\OneDrive\\Desktop\\TempStuff\\NYvsUSA.xlsx")
SheetList <- excel_sheets(XlFile)
length(SheetList)
for (i in 1:length(SheetList)){print(paste(i,SheetList[i],sep=": "))}

# assessment 1 Part 2

URLStr <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
URLdf <- read_csv(URLStr, col_names = FALSE)
URLdf

rm(list=ls())
# ==================================================


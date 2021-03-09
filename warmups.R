# 6th of 9 courses...

library(tidyverse)
library(readxl)
library(dslabs)

# MyName <- readline("Okay, so what's your name? ")
# print(paste("Then let's get started, ", MyName, sep=""))
# readline("Tap any key to continue on to the course....")

path <- system.file("extdata", package = "dslabs")
files <- list.files(path)
files

filename <- "murders.csv"
murdat <- read_csv(file.path(path, filename))
murdat
murdat$region <- as.factor(murdat$region)
head(murdat)
rm(list=ls())


XlFile <- file.path("C:", "Users", "Charles", "OneDrive", "Desktop", "TempStuff", "NYvUSA.xlsx")
#alternatively:  XlFile <- ("C:\\Users\\Charles\\OneDrive\\Desktop\\TempStuff\\NYvsUSA.xlsx")
SheetList <- excel_sheets(XlFile)
length(SheetList)
for (i in 1:length(SheetList)){print(paste(i,SheetList[i],sep=": "))}

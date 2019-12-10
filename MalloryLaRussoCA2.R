# Name: Mallory LaRusso
# Date: January 13, 2019
# Group Member: Aidan McCarthy
# Activity 2 serves as practice for reading data, writing data, and accessing parts of a data frame.

library("readr")
library("readxl")
install.packages("haven")
library("haven")

# 1. Set the working directory using R code.
setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Topic 2/datasets")


#2. What is the delimiter? What is the most common delimiter that statisticians use?
# A delimiter is a character used to create boundaries between seperate data sets. The comma is the most common delimiter.


#3a. Read in the BreastCancer.dat file. Save the data to an R object called cancerData.
cancerData <- read_tsv("BreastCancer.dat")

#3b.Print out just the size column of cancerData data frame.
cancerData[,"size"]

#3c. Print out the first three rows of the cancerData data frame.
cancerData[1:3,]


#4a. Read in mosquito.txt file and save R object as mosquitoData.
mosquitoData <- read_delim("mosquito.txt", delim = "&")

#4b. Read in mosquito2.txt file. Since this file does not have column names, use the same column names from mosquitoData. Save this as mosquitoData2.
mosquitoData2 <- read_tsv("mosquito2.txt", col_names = c("Day", "Cage", "trt", "Response"))

#4c. Create a combined version of the data sets and save it as the object mosquitoFullData. Then, in a comment below the code, describe what the rbind function does.
mosquitoFullData <- rbind(mosquitoData, mosquitoData2)
#rbind takes in a sequence of vector, matrix, or data-frame arguments and combines them by rows. cbind is the same thing, only combining by columns.

#4d. Write the mosquitoFullData out to a .csv file.
write_csv(mosquitoFullData, path = "/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Topic 2/datasets/mosquitoFullData.csv")


#5a. Read in effort.dta file.
effortData <- read_dta("effort.dta")

#5b. Print rows 5, 7, 9, and 11 for columns 3 and 4 of your data frame.
effortData[c(5,7,9,11), 3:4]


#6. Read in the second sheet of the Chickens excel file. Save object as sheepData.
read_excel("Chickens.xlsx", sheet = "Sheep")

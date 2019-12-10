####################################
##R Class - ST 308 - PCA 3
##Name: Mallory LaRusso
##Date: January 21, 2019
####################################

library("readr")
install.packages("dplyr")
library("dplyr")
#Create an R script that will do the following
#1.  Read in the California Health Information Survey (CHIS.csv) (available on web - remember to run library(readr)!)
chis <- read_csv("CHIS.csv")

#2.  Have R print out a vector of TRUE/FALSE values corresponding to which height values are greater than 73.
chis$Height > 73

#3.  Have R return all of the rows from the data set which have a height greater than 73 (run library(dplyr) to use filter if you'd like!)
filter(chis, Height > 73)

#4. Repeat steps two and three but for the condition that the height values are greater than 73 or less than 61
(chis$Height > 73) | (chis$Height < 61)

filter(chis, (Height > 73) | (Height < 61))

#5. Write an ifelse() statement that returns "TallShort" if the height value is greater than 73 or less than 61 and returns "Medium" otherwise
ifelse((chis$Height > 73) | (chis$Height < 61), "TallShort", "Medium")

#####Save this script and upload it to the wolfware page

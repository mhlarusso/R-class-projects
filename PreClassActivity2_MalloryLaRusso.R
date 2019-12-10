####################################
##R Class - ST 308 - PCA 2
##Name: Mallory LaRusso
##Date:
####################################

#Download the donner.csv and donner.xls files from the course website (datasets folder in the Resources section).  Place these files in a folder called datasets.

#Create an R script that answers the questions below:

#1. Set your working directory to the datasets folder using
setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Topic 2/datasets")

#2. Load in the readr package

install.packages("readr")
library("readr")

#3. Read in the donner.csv file using the read_csv function. (You can save as an R object or just print the results to the console.)
csv_file <- read_csv(file = "donner.csv")

#4. Load in the readxl package
install.packages("readxl")
library("readxl")

#5. Read in the donner.xls file using the read_excel function.  (You can save as an R object or just print the results to the console.)

xls_file <- read_excel("donner.xls", sheet = "donner")








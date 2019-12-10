####################################
##R Class - ST 308 - PCA 4
##Name: Mallory LaRusso
##Date: January 27, 2019
####################################

library(readr)
install.packages("tidyverse")
library(tidyverse)
library("dplyr")

#Create an R script that will do the following (use dplyr functions where possible):
#1.  Read in the California Health Information Survey (CHIS.csv) (available on web - remember to run library(tidyverse)!)
CHIS <- read_csv("CHIS.csv")

#2. Create and add to the data set a column corresponding to a height to weight ratio for each student (replace your data set object)
CHIS %>% mutate(BodyRatio = Height/Weight)
#3. Use chaining to filter the data set by students with BMI over 23, then select only the Weight, BMI, and Asian columns, and finally sort the data set by BMI.  Save this as a new R object.
FilteredData <- CHIS %>% filter(BMI >= 23) %>% select(Weight:Asian) %>% arrange(BMI)

#4. Summarise the overall mean weight for your new data set.
summarise(FilteredData, mean(Weight))

#5. Summaries the mean weight for the Asian = 0 and Asian = 1 groups

AsianZero <- CHIS %>% filter(Asian == 0)
summarise(AsianZero, mean(Weight))

AsianOne <- CHIS %>% filter(Asian == 1)
summarise(AsianOne, mean(Weight))


#####Save this script and upload it to the wolfware page

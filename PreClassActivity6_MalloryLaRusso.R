####################################
##ST 308 - Topic 6 Preclass activity
##Name: Mallory LaRusso

####################################

###########################################################
##Vectorized Functions
###########################################################

#We'll use the built-in 'CO2' data set. Write R code to do the following:

install.packages("matrixStats")
install.packages("microbenchmark")
library(microbenchmark)
library(dplyr)
#1. Suppose we want to create a "group" indicator variable that tells us which Type*Treatment group we are in 
#(i.e Quebec-nonchilled, Quebec-chilled, Mississippi-nonchilled, Mississippi-chilled, group 1, 2, 3, 4, respectively). 
#Use ifelse to create this new variable and add it to the data set.
CO2 <- tbl_df(CO2)

group <- vector()

for (i in 1:dim(CO2)[1]){
  ifelse(CO2$Treatment[i] == "nonchilled" & CO2$Type[i] == "Quebec", group[i] <- 1, ifelse(CO2$Treatment[i] == "nonchilled" & CO2$Type[i] == "Mississippi", group[i] <- 3, ifelse(CO2$Treatment[i] == "chilled" & CO2$Type[i] == "Mississippi", group[i] <- 4, group[i] <- 2)))
}

CO2$group <- group


#2. Report the means of each numeric column.
CO2 %>% select(group, conc, uptake) %>% colMeans()


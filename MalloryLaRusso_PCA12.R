####################################
##R Class - ST 308 - PCA 12
##Name: Mallory LaRusso
##Date: 4/14/2019
####################################

library(dplyr)

#Create an R script that will do the following

setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Week 4")

#1.  Read in the California Health Information Survey (CHIS.csv) from the Week 4 pre-activity, but this time use read.csv (from base R) and not read_csv (from dplyr).  This produces a dataframe (not a tibble). Print the first and last 6 rows to the screen using the R functions head and tail.

chis <- read.csv("CHIS.csv")
head(chis)
tail(chis)

#2. Create and add to the data set a column corresponding to a height to weight ratio for each student (hint: chis = data.frame(chis,ratio=chis$Height/chis$Weight).

chis = data.frame(chis,ratio=chis$Height/chis$Weight)

#3. Get the dimensions of the new data set.

dim(chis)

#4. Create a new data set that only has students with BMI over 23. (Hint: chis2=chis[(chis$BMI > 23),])

chis2 = chis[(chis$BMI > 23),]

#5. Get the dimensions of this new data set (say chis2).

dim(chis2)

#6. Sort this data set by BMI  and put it into chis2 (hint: chis2=chis2[order(chis2$BMI),]). Verify this by printing to the screen the first 20 values of BMI.

chis2=chis2[order(chis2$BMI),]
print(chis2[1:20, ])

#7. Find the mean of the Weight variable for your new data set.

mean(chis2$Weight)

#8. Find the mean of weight for the Asian = 0 and Asian = 1 groups.

chis2asian <- chis2 %>% filter(Asian == 1) 
chis2notasian <- chis2 %>% filter(Asian == 0)

mean(chis2asian$Weight)
mean(chis2notasian$Weight)

#####Save this script and upload it to the wolfware page
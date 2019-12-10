####################################
##R Class - ST 308 - Activity 3
##Name: Mallory LaRusso
##Group Members: Aidan McCarthy
##Date: January 27, 2019
##Purpose:  practice using functions from the dplyr package.
####################################


library(dplyr)
library(readr)
library(tidyverse)
setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Week 4")
#1. Read in the titanic.csv data set.
titanic <- read_csv("titanic.csv")

#2. Print to the console names and ages for females in the second class who are younger than 10.
fyoung <- titanic %>% filter(Sex =="female", Pclass == 2, Age < 10) %>% select("Name", "Age")
print(fyoung)

#3. Print to the console the average survival rate for female passangers in each class.
survivalrates <- titanic %>% filter(Sex == "female") %>% group_by(Pclass) %>% summarise(avg = mean(Survived))
arrange(survivalrates, avg)

#4. Print to the console the names, ages, and classes for all passangers whose fairs are more than the average fare.
avgfare <- titanic %>% summarise(mean(Fare))
fares <- titanic %>% filter(Fare > as.numeric(avgfare)) %>% select(Name, Age, Pclass)
print(fares)

#5. Print the same list but with age in descending order.
filt_fares <- titanic %>% filter(Fare > as.numeric(avgfare)) %>% select(Name, Age, Pclass) %>% arrange(desc(Age))
print(filt_fares)

#6. Find the survival rates for passangers older than 15 for each gender and class. Sort the data based on the survival rate in ascending order
avgsurvival <- titanic %>% filter(Age > 15) %>% group_by(Sex, Pclass) %>% summarise(avg = mean(Survived))
arrange(avgsurvival, avg)
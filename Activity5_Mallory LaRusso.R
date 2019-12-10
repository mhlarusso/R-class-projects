
#ST 308 Activity 5

#For this activity you will create an R program and upload the program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#Name: Mallory LaRusso
#Group Member: Aidan McCarthy

#The purpose of this activity  is to get more practice manipulating data and using for loops.

#To Do:  Write  an R script corresponding to the questions below.  Note that  you should have comments throughout your program explaining what you are doing and also you are asked to place some answers in a comment. Use tidyverse functions to read in and manipulate data when possible.


library(tidyverse)
library(readr)
library(dplyr)

install.packages("tidyr")
library(tidyr)

#Question 1

#Create a matrix using the following code.

set.seed(342)
A  <-  matrix(abs(rnorm(30,  0,  5)),  6,  5)

#Use a for loop to calculate the mean value of each column. Save the means into a new object.
means <- c()

for (i in 1:5){
  means[i] <- (mean(A[,i]))
}

#Question 2

#Create a nested for loop (a loop within a loop) that will go through each element of A, and do the following: if the decimal part of the element is greater than 0.7, then round up to the next integer; if it is less than 0.3, then round down to the nearest integer; otherwise keep its original value.

for (i in 1:dim(A)[1]){
  for (j in 1:dim(A)[2]){
    if ((A[i, j] - trunc(A[i, j])) > 0.7) {
      A[i, j] <- ceiling(A[i, j])
    } else if ((A[i, j] - trunc(A[i, j])) < 0.3){
      A[i, j] <- trunc(A[i, j])
    }
      
  }
  
}

#Question 3

#The formula to calculate the Euclidean distance between two vectors (x, y) is

#d(x, y) = sqrt(sum((xi - yi )^2)).

#Read in the scores.csv file (right below where you got the Activity 5) and use a for loop to sum over 
#the observations to calculate the Euclidean distance between AFinal and HFinal (away and home final scores).
#Note: this could be done without for loops, but practicing is fun!


scores <- read_csv("scores.csv")
euclidean <- c()
sum <- 0

for (i in 1:dim(scores)[1]){
  euclidean[i] <- sqrt(sum((scores$AFinal[i] - scores$HFinal[i])^2))
  sum <- sum + euclidean[i]
}

print(sum)

#Question 4

#Create a subset of the scores data set that only includes the first 20 columns, but remove the day column. 
#If you notice the scores per quarter and the final score, this data is in wide format. 
#Create a new data set from this subset that has an observation for each team's quarter and final scores (AQ1 through AFinal).  
#Sort the new data set by season, week, and awayTeam.
scores_subset <- scores %>% select(1:20, -"day")
scores_subset1 <- gather(scores, quarter, score, 5:11)
scores_subset2 <- scores_subset[order(scores_subset$season, scores_subset$week, scores_subset$awayTeam),]



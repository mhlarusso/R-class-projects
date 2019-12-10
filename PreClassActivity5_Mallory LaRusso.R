####################################
##ST 308 - Topic 5 Preclass Activity
##Name: Mallory LaRusso
####################################

#Create an R script that will do the following
#1.  Create a for loop that will print out the numbers 5:15 in sequence

for (i in 5:15){
  print(i)
}

#2.  For this part, use the dataframe below.  Create a for loop that will loop through the 
#columns and find the standard deviation for columns 1, 2, and 3.  You can save these
#in a new vector or just have r print out the values in the loop
set.seed(156)
df<-data.frame(V1 = rgamma(n=30,shape=3,scale=2), V2 = runif(n=30), V3 = rnorm(n=30), Obs = paste("Observation",1:30))

for (i in 1:3){
  print(sd(df[, i]))
}

#####Save this script and upload it to the wolfware page
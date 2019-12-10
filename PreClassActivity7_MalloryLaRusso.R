####################################
##ST 308 - Topic 7 Preclass activity
##Name: Mallory LaRusso
####################################

###########################################################
##Function Writing 
###########################################################

#Write R code to do the following:

#1. Write your own absolute value function called myAbsoluteValue. There are two options for the input
#If x is positive or zero, return x.
#If x is negative, return -x.
#Check your function works by plugging in a few values.


myAbsoluteValue <- function(x){
  if (x > 0) {
    return(x)
  }
  if (x < 0) {
    return(-x)
  }
  }

####################################
##Pre-Class Activity 8
##Name: Mallory LaRusso
####################################

#Create an R script that will do the following:

#We'll use the data set built into ggplot2 called msleep
library(ggplot2)
library(dplyr)
msleep<-tbl_df(msleep)
msleep

#A data frame with 83 rows and 11 variables
#name. common name
#genus.
#vore. carnivore, omnivore or herbivore?
#order.
#conservation. the conservation status of the animal
#sleep\_total. total amount of sleep, in hours
#sleep\_rem. rem sleep, in hours
#sleep\_cycle. length of sleep cycle, in hours
#awake. amount of time spent awake, in hours
#brainwt. brain weight in kilograms
#bodywt. body weight in kilograms

#Description
#This is an updated and expanded version of the mammals sleep dataset. 
#Updated sleep times and weights were taken from V. M. Savage and 
#G. B. West. A quantitative, theoretical framework for understanding 
#mammalian sleep. Proceedings of the National Academy of Sciences, 
#104 (3):1051-1056, 2007.

#1.  Use ggplot to graph a scatterplot of the bodywt (y) and awake (x) 
#variables.  Color code the points by the variable vore and add the least #squares line (method=lm), also color coded by variable vore. 
#(Hint: Add an aes(color=vore) within geom_point and geom_smooth.)

g <- ggplot(data=msleep,aes(x=awake,y=bodywt))
g + geom_point(aes(color=vore)) + geom_smooth(aes(color=vore),method="lm")

#2.  Recreate the same plot but use the log of the bodywt. Also add se=F within geom_smooth to get rid of grey standard errors.

m <- ggplot(data=msleep,aes(x=awake,y=log(bodywt)))
m + geom_point(aes(color=vore)) + geom_smooth(aes(color=vore),method="lm", se=F)

#3.  Make the points on your plot size 3 and use a different plotting shape for the points (size= and shape= within geom_point).

m + geom_point(aes(color=vore), size = 3, shape = 2) + geom_smooth(aes(color=vore),method="lm", se=F)

#4.  Make the line thicker (this can be done in a way similar to 3. with size=).

m + geom_point(aes(color=vore), size = 3, shape = 2) + geom_smooth(aes(color=vore),method="lm", se=F, size = 2)


#5. Instead of having a constant size for each point, make the size depend on the variable sleep_total (hint: in contrast to the above, this one goes inside aes).

m + geom_point(aes(color=vore, size = sleep_total), shape = 2) + geom_smooth(aes(color=vore),method="lm", se=F, size = 2)


#####Save this script and upload it to the wolfware page

##ST 308 Activity 8
##Name: Mallory LaRusso
##Group Members: Aidan McCarthy, Jordan Lewis

#For this activity you will create an R program and upload that program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#To Do -- Practice with ggplot.

#-------------------------------------------------------------------------------

#1. Set working directory. Run given code to read in data.
# recreate the scatterplot below using ggplot. x axis label = "Date", y axis label = "Temperature"

setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Topic 9")
library(tidyverse)
nmmaps <- read_csv("chicagodata.csv")
nmmaps$date <- as.Date(nmmaps$date)
nmmaps$year <- substring(nmmaps$date, 1, 4)

a <- ggplot(data = nmmaps, aes(x = date, y = temp))
a + geom_point() + xlab("Date") + ylab("Temperature") + ggtitle("Chicago Air")


#2. Make another scatterplot as in Q1 but color the points on plot based on season the observation was taken in.
# Change title of legend. 
a + geom_point(aes(color = season)) + xlab("Date") + ylab("Temperature") + ggtitle("Chicago Air") + labs(color = 'Seasons')


#3. Create 2 x 2 multi-panel plot using facet_wrap, each sub-panel includes data for a certian year.

a + geom_point() + facet_wrap("year")


#4. Create a plot like question three but the scales can "roam free". 

a + geom_point() + facet_wrap("year", scales = "free")


#5. Recreate given boxplot for o3 by year. Color of box = gold1.

b <- ggplot(data = nmmaps, aes(x=year, y=o3))

b + geom_boxplot(fill = "gold1") + geom_point(position = "jitter") + ggtitle("Boxplot of O3 by Year")


#6. Recreate plot below for o3 of each year.

b + geom_violin(fill = "gold1") + ggtitle("Violin Plot of O3 by Year")

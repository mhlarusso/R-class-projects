##ST 308 Activity 8
##Name: Mallory LaRusso
##Group Members: Aidan McCarthy, Jordan Lewis

#For this activity you will create an R program and upload that program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#To Do -- Write an R script that answers each number below. Note that you should have comments throughout your program explaining what you are doing and also you may be asked to place some answers in a comment.

#-------------------------------------------------------------------------------

#1. load the ggplot2 and dplyr package. Run the following code to generate an object called "data" which contains the non missing rows from the txhousing data set.

library(ggplot2)
library(dplyr)
data <- txhousing %>% filter(complete.cases(txhousing))

#Then create an initial ggplot object with sales as the x variable and listings as the y variable.

g <- ggplot(data = data, aes(x = sales, y = listings))

#2. Create a scatter plot. Color the dots in red and change the size to 0.8.

g + geom_point(color = "red", size = 0.8)

#3. create a scatter plot. Color the dots by month and still assign the size to be 0.8.

g + geom_point(aes(color = month), size = 0.8)

#4. On top of the plot in 3., add a linear regression line (method=lm)and color it red. 
#Add another line with color green and no method=.  
#(This is a way to check to see if a straight line is a reasonable model.)

g + geom_point(aes(color = month), size = 0.8) + geom_smooth(color = "red",method="lm") + geom_smooth(color = "green")

#5. Based on the plot in 4., make a new ggplot object replacing the x and y variables by their square roots. 
#Then use similar code as in 4 to see if a straight line is appropriate.

m <- ggplot(data = data, aes(x = sqrt(sales), y = sqrt(listings)))
m + geom_point(aes(color = month), size = 0.8) + geom_smooth(color = "red",method="lm") + geom_smooth(color = "green")

#6. Based on the plot in 5., add a title "Sqrt Listings vs. Sqrt Sales for Housing in Texas".

m + geom_point(aes(color = month), size = 0.8) + geom_smooth(color = "red",method="lm") + geom_smooth(color = "green") + ggtitle("Sqrt Listings vs. Sqrt Sales for Housing in Texas")

#7. Create a new ggplot object from data with date as the x variable, inventory as the y variable, and city as the group variable.

c <- ggplot(data = data, aes(x = date, y = inventory, group = inventory))

#8. Using the new object in 7., draw a spaghetti plot, i.e., 
#a set of lines connecting each point for each city's inventory time series. 
# Assign different color to different lines according to the city variable. 
#Hint: use the geom_line() function--look it up in help.  
# The group=city code in 7. tells geom_line which points to connect. Then add a new statement 

c + geom_line(aes(color = city)) + theme(legend.position = "none") 

#to get rid of all th city names in the legend (they take up too much room!).


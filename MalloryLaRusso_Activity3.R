####################################
##R Class - ST 308 - Activity 3
##Name: Mallory LaRusso
##Group Members: Aidan McCarthy
##Date: January 21, 2019
##Purpose: practice with logical statements, if then else logic, coercion, and basic data manipulation. 
####################################

library("readr")
library("dplyr")
#1. Set working directory and read in the data set and save it to an R object.
setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Week 3")
pollution <- read_csv("pollution_us_2000_2016.csv")

#2. Print to the console only observations from NC.
filter(pollution, state == "North Carolina")

#3. Create R object with only observations from Arizona in county code 13.
arizona13 <- filter(pollution, (state == "Arizona") & (countyCode == 13))

#4. Find basic summary statistics of the NO2Mean column of arizona13.
summary(arizona13$NO2Mean)

#5. Write if then else statement that takes in the first value of the NO2Mean variable and return safe, watch, or danger.
arizona13_no2meanrating <- ifelse(arizona13$NO2Mean <= 22.5, print("Safe"), ifelse(arizona13$NO2Mean <= 30, print("Watch"), print("Danger")))

#6. Do the same thing for the entire data set
no2meanrating <- ifelse(pollution$NO2Mean <= 22.5, print("Safe"), ifelse(pollution$NO2Mean <= 30, print("Watch"), print("Danger")))

#7. Find the proportion of values in the object you just created that are in the Danger category.
length <- length(no2meanrating)
sum <- sum(no2meanrating == "Danger")
sum/length

#8. Add the new vector to your Arizona/county code 13 object by modifying the code given.
newData <- tbl_df(cbind(arizona13, arizona13_no2meanrating))

#9. Run the given code and modify it to match the object names we have been using. Answer questions:
paste0("Avg NO2 value is ", newData$NO2Mean, newData$NO2Units, ". Status is ",
       newData$arizona13_no2meanrating)

# What does paste0 do? How does this differ from paste()? 
# paste0 concatenates vectors after converting to character. This is different from paste() because you need to specify the spacing using sep, whereas paste0 does not need it.


#10. Explain coercion. Where was it used in the previous problem and in problem 7? What is the most and least flexible object types from logical, character, and numeric?

#Coercion is when R tries to combine different data types so it needs to convert types in a specific order. It was used in the previous problem and in problem 7 because danger is a character, but we were trying to do numeric operations with it, so we had to be careful about the order we did things.
#The least to most flexible types are logical, numerical, and character.






  
#####################################################################
##R Class - ST 308 - ICA 1
##Getting familiar with R objects.
##Name: Mallory LaRusso
##Group members: Aidan McCarthy
##Date:January 8, 2019
######################################################################

#########################################################
##Part 1
##Vector practice

#1.  Create a vector from 4 to 16 in steps of 3.
skip <- seq(from = 4, to = 16, by = 3)

#2. add 8 to each element
skip + 8

#3. square each element
skip^2

#4. Create a vector that is the skip vector repeated 8 times
Repeat <- rep(skip, 8)

#5. Create a vector that is the skip vector w/ each element repeated 8 times
elementRepeat <- rep(skip, each =8)

#6. Add Repeat and elementRepeat vectors together
Repeat + elementRepeat
# R does the addition of vectors by adding each individual element together. The first element of each is added, and so on.

#7. Multiply Repeat and elementRepeat vectors together
Repeat * elementRepeat
# R does the multipication of vectors by multiplying each individual element together. The first element of each is multiplied, and so on.



# Part 2

#1. Create character vector of length 4 consisting of adjectives
adj <- c("happy", "sad", "excited", "upset")

#2. Create another character vector of the same length consisting of nouns
nouns <- c("basketball", "soccer", "baseball", "football")

#3. Paste the two character vectors together
paste(adj, nouns)

#4. Paste the character vectors together but change the seperator to be an underscore
paste(adj, nouns, sep = "_")




# Part 3

#1. Determine which type of object ToothGrowth is
# ToothGrowth is a Data frame
str(ToothGrowth)

#2. Have R print out just the dose column using two different methods
ToothGrowth[, "dose"]
ToothGrowth$dose

#3. Have R print out values of len and dose for the VC observations (first 30)
ToothGrowth[1:30, c("len", "dose")]

#4. Describe the major difference between a matrix object in R and a data frame object in R.

# Matrices are homogenous, meaning they must have the same type of object in them, all numbers or all characters.
# Data frames, however, are heterogenous, so they can contain letters and numbers.

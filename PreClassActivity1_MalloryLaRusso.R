####################################
##R Class - ST 308 - PCA 1
##Name: Mallory LaRusso
##Date: 1/7/2019
####################################

#Create an R script that answers the questions below:

#Run the four lines of code below to create some objects
#Create and save a vector of 26 random values between 0 and 1 
set.seed(1)
unif <- runif(n = 26)

#Create and save a sequence from 10 to 100 of length 26
sequence <- seq(from = 10, to = 100, length = 26)

#Create a character sequence
charSeq <- sample(letters, replace = FALSE)

#To do
#1. Use the matrix command to create an R object that is a matrix 
#whose first column is unif and second is sequence  
#Notice the byrow = FALSE option!  This fills the matrix by filling the columns first  (may want to use help(matrix)).

m <- matrix(c(unif, sequence), nrow = 26, ncol = 2, byrow = FALSE)

#2. Print out the 5th row of the data object

m[5, 1:2]

#3. Print out the 4th, 10th, and 15th-20th rows of the data object

m[c(4, 10, 15:20), 1:2]

#4.  In a comment below, explain why we can't add charSeq as a
#column of our data object matrix

# charSeq has letters, not numbers. Matrices must have the same type of element in them because they are homogeneous.

#5. Use the data.frame command to create an R object that is a data frame
#that has the columns corresponding to unif, charSeq, and sequence (in that order)

dataframe <- data.frame(unif, charSeq, sequence)

#6. Print the charSeq column from your data frame using the $

dataframe$charSeq

#####Save this script and upload it to the wolfware page



#ST 308 Activity 6

# Name: Mallory LaRusso
# Group Member: Aidan McCarthy
#For this activity you will create an R program and upload that program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#To Do -- Note that you should have comments throughout your program explaining what you are doing and also you are asked to place some answers in a comment.

#For Task 1 to Task 4, you will work with the built-in R object called UCBAdmissions. 
#This data set contains information about the Admissions, Sex, and Department for potential students at UCB (University of California at Berkeley).
#(This is a famous data set illustrating Simpson's Paradox--that part is not covered here.)  
#UCBAdmissions is a special type of array called a table. 
#A matrix or dataframe has two dimensions, rows and columns. Arrays can have any number of dimensions.

#(Hint: you can simplify your typing life by setting z=UCBAdmissions.
#Also you might want to save the output from Task 1 below and the result of printing z to the console.  That way you can easily check your answers.)

#Task 1. Use the structure function str() to check the UCBAdmissions object. 
#How many dimensions are there in the UCBAdmissions object? 
#Also use dim() to see just the length of each dimension--report those lengths.
str(UCBAdmissions)
u = UCBAdmissions
dim(u)

#There are three dimensions. The respective lengths of the dimensions are 2 2 6.


#Task 2.
#(a) Use R code to print the number of admitted female students in Department C.
#(b) Use R code to print the two-by-two table for Admit and Sex (called Gender here) for just Department E.

#a
u[1,2,3]


#b
u[,,5]

#Task 3. Use the apply() function to print the following to the console (you'll have to play around with the MARGIN):


#(a) total number of admissions and total number of rejections across all Departments.
apply(u, 1, sum)

#(b) total number of applications in each of the Department.
apply(u, 3, sum)

#Task 4. Use rowSums() or colSums() function to create the following 2-way frequency table. 

#(a) Gender vs. admission / rejection
rowSums(u[1:2, 1:2, ], dims = 2)

#(b) Department vs. Gender
colSums(u[1:2, , 1:6], dims = 1)

#For Task 5 to Task 7, you will work with the built-in R object called iris.

#Task 5. Use the tapply() function to answer the following questions.
i <- iris
#(a) What is the mean Sepal.Length for each Species?

tapply(i$Sepal.Length, list(i$Species), mean)

#(b) What is the standard deviation in Sepal.Length for each Species?
tapply(i$Sepal.Length, list(i$Species), sd)

# Task 6. Use the code below that uses the split() function to create a list object called irislist with 3 elements.
# The first element is a vector of Sepal.Length for setosa; the second element is a vector of Sepal.Length for versicolor; the third element is a vector of Sepal.Length for virginica.


irislist <- split(iris$Sepal.Length, iris$Species)

# Task 7. Use the lapply() to conduct 1-sample t-tests on each of the 3 vectors in irislist. 
# The function for t-test is t.test(). The null hypothesis is H0: ? = 6. The alternative hypothesis is H1: ? > 6. 
# See the help for t.test for specification of these hypotheses.  
# You will need to give additional arguments for t.test to lapply (similar to how we gave na.rm with apply() in the video).

lapply(irislist, t.test, mu = 6, alternative = "greater")



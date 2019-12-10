#In-class Activity 7

# Name: Mallory LaRusso
# Group Members: Aidan McCarthy, Jordan Lewis

#For this activity you will create an R program and upload that program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#To Do:  Write R code that answers the questions below.  Note that you should have comments throughout your program explaining what you are doing and also you are asked to give output and answers in some places. (No need to comment them out, though.)

#1. Write a simple function (call it skew) that takes in a vector of numbers, a sample x=(X1, ..., Xn), and returns the 3rd moment skewness coefficient,

#skew=mean((Xi-Xbar)^3)/Sn^3,

#where Xbar is the sample mean, Sn^2 is the sample variance with divisor n (not n-1), and Sn^2=mean((Xi-Xbar)^2).


skew <- function(x){
  Xbar = mean(x)
  Sn = mean((x-Xbar)^2)^0.5
  Sn2 = mean((x-Xbar)^2)
  Skew=mean((x-Xbar)^3)/Sn^3
  return(Skew)
}
#2. Write a second simple function (call it kurt) that takes in a vector of numbers, a sample x=(X1, ..., Xn), and returns the 4rd moment kurtosis coefficient,

#kurt=mean((Xi-Xbar)^4)/Sn^4.

#Skewness (skew) for any symmetrically distributed data such as the normal distribution is zero. The exponential distribution has skew=2, indicating large right skewness. The kurtosis (kurt) of normal distributions is 3.  The kurtosis of the uniform distribution is 1.8, and the t with 5 degrees of freedom has kurt=6.  So kurtosis measures tail behavior or peakedness of distributions---those with kurtosis higher than 3 tend to have more outliers (large in
#absolute value) than the extremes from a normal sample with similar standard deviation.

kurt <- function(x){
  Xbar = mean(x)
  Sn = mean((x-Xbar)^2)^0.5
  Kurt = mean((x - Xbar)^4)/Sn^4
  return(Kurt)
}
#3. Read in the following data set

rectangles=c(.693,.749,.654,.670,.662,.672,.615,.606,.690,.628,
          .668,.611,.606,.609,.601,.553,.507,.844,.576,.933)

#These are width/length ratios of 20 beaded rectangles of Shoshoni Indians (Larsen and Marx, 2001, p. 15). One might be interested in whether these ratios are close to the ratio 0.618 of so-called "golden rectangles."

#Find skew and kurt for the rectangles data. State whether the data appear normally distributed.

skew(rectangles)
# skew = 1.340384
kurt(rectangles)
# kurt = 4.91799

# No, based on the skew and kurt values it does not appear to be normally distributed. Both values are higher than what they should be for it ot be normal



#4.  Now make a more general function, call it stats1, that returns a list with the following components: sample size, sample mean, sample standard deviation, sample skewness (calling skew from within the function), and sample kurtosis (using kurt). Show the output from stats1(rectangles).

stats1 <- function(x){
  n = length(x)
  xbar = mean(x)
  sd = sd(x)
  skew = skew(x)
  kurt = kurt(x)
  
  return(list(n, xbar, sd, skew, kurt))
}

stats1(rectangles)

#5. Make a second function, like stats1 above, call it stats2, that returns a data frame with five columns named n,mean,sd,skew,kurt. (Hint: return(data.frame(n=...,mean=...,sd=...,skew=...,kurt=...))) Show the output from stats2(rectangles).

stats2 <- function(x){
  n = length(x)
  xbar = mean(x)
  sd = sd(x)
  skew = skew(x)
  kurt = kurt(x)
  
  return(data.frame(n, xbar, sd, skew, kurt))
}

stats2(rectangles)
#6. Recall that NA values cause problems for the mean function (and all the above functions as well). So, create a 3rd function, stats3, that adds the following lines

#n.orig=length(x)
#x=x[complete.cases(x)]
#n.comp=length(x)

stats3 <- function(x){
  n.orig=length(x)
  x=x[complete.cases(x)]
  n.comp=length(x)
  xbar = mean(x)
  sd = sd(x)
  skew = skew(x)
  kurt = kurt(x)
  
  return(data.frame(n.orig, n.comp, xbar, sd, skew, kurt))
}
r2=c(rectangles,NA,NA)

stats2(r2)
#   n xbar sd skew kurt
#  22   NA NA   NA   NA

stats3(r2)
# n.orig n.comp    xbar         sd     skew    kurt
#    22     20 0.65735 0.09673092 1.340384 4.91799


#at the beginning and returns the original sample as well as the complete case sample size.  Check it by setting r2=c(rectangles,NA,NA) and computing stats2(r2) and then stats3(r2).  Show your output.

#7. Write your own t test function, say my.ttest, that calls t.test but only returns the sample size, the type of alternative, mu, and the p-value. 
# To do this, you will need to do an example with t.test, put the result in out, and type names(out) to see what t.test returns. 
# Then use my.ttest to test that the ratios come from a population with ratio 0.618.  Show you output and state your conclusion.

my.ttest <- function(x,mu){
  a <- t.test(x,mu=mu)
  n <- length(x)
  list <- list(n, a$alternative, mu, a$p.value)
  return(list)
  
}

my.ttest(rectangles, 0.618)

#[[1]]
#[1] 20

#[[2]]
#[1] "two.sided"

#[[3]]
#[1] 0.618

#[[4]]
#[1] 0.08466814

# Because the p-value is low, we reject the null hypothesis and conclude that the population does not come from a ratio of 0.618.


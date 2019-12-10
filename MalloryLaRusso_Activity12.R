####################################
##R Class - ST 308 - Activity 12
##Name: Mallory LaRusso
##Group Member: Aidan McCarthy
##Date: 4/15/19
####################################

#You should have installed the Rlab package and loaded it.  The problems come from the end of the labs in 

#https://www.stat.ncsu.edu/people/boos/courses/st308/Rlab/
  
 # You are to do problems 6 and 8 of Rlab 1, problems 1 and 2 of Rlab 6, and problems 1 and 2 of Rlab 7.  Except for graphs, include your output on your submitted file.

#####Save this script and upload it to the wolfware page

install.packages("Rlab")
library(Rlab)

# RLab 1

#6a. Read in data using code given below.
pres <- scan( what=list(name="",age=0) )
pres <- data.frame(pres)
pres

#6b. make a histogram using hplot.

hplot(pres$age,6)
stem(pres$age)

# The histogram and stem plots are roughly right-skewed.

#6c. does this data accurately represent the life expectancies of presidents?

# Yes, this does seem to be an accurate representation of president's age of death.

#8. plot and analyze the snow data.

z <- raleigh.snow
z
stats(z)
plot(z$year, z$snow)

#There appears to be no pattern over time, the dots are randomly scattered.

plot(z$year,z$snow,type="l")


# There seems to be more of a pattern here, there is a constant rise and fall in snow amounts relating to the year.
# There is a big peak around 1977.

plot(z$snow[1:29],z$snow[2:30])

# There is a slight upward trend to the right in this graph. An upward trend to the right would mean that there is an increase in snow from year to year in Raleigh. 

# Rlab 6.

#1. 

hplot(randomdata) 
seq(0,5,length=500) -> x 
dexp(x,beta =.4) -> y 
lines(x,y)

# This graph of random numbers has a right-skewed density curve. Therefore, an exponential line would better fit it.

#2. Find the correct density plots for precip$may and precip$aug.

hplot(precip$may)
seq(0,8,length = 500) -> x
dnorm(x, mean = 3.841, sd = 1.59) -> y
lines(x,y)

hplot(precip$aug)
seq(0,13,length = 500) -> x
dgamma(x, alpha = 2.94167, beta =1.51773) -> y
lines(x,y)

#Rlab 7.

#1. Large population w/ mu = 3.84 and sigma = 1.6. 
# How reliable is "large" sample 90% conf interval when applied to samples of only 4 observations?
# What about 12 observations?

# 4 obs

set.seed(1927)
samples <- simulatesamples(1000, 4, DIST = rnorm, mean = 3.84, sd = 1.6)
ci.lower <- samples$m - (1.645*samples$s)/sqrt(4)
ci.upper <- samples$m + (1.645*samples$s)/sqrt(4)
bad.lower <- sum(3.84 < ci.lower)
bad.upper <- sum(ci.upper < 3.84)
bad.frac <- (bad.lower + bad.upper) / 1000
bad.frac


# Since the bad fraction is .191, which is quite far from .10, the 90% confience interval for 4 observations is not reliable.

#12 obs

samples <- simulatesamples(1000, 12, DIST = rnorm, mean = 3.84, sd = 1.6)
ci.lower <- samples$m - (1.645*samples$s)/sqrt(12)
ci.upper <- samples$m + (1.645*samples$s)/sqrt(12)
bad.lower <- sum(3.84 < ci.lower)
bad.upper <- sum(ci.upper < 3.84)
bad.frac <- (bad.lower + bad.upper) / 1000
bad.frac

#Since the bad fraction is .133, this is closer to .10, so the 90% confidence interval for 12 observations is much more reliable than 4 observations. 

#2. Exponential dist'n w/ beta = 4. What is mu?

rexp(1000, beta = 4) -> z
meanz <- mean(z)


# our best guess for mu based on 1000 random variables is 4.092088.

# How reliable is the small sample t 95% conf interval when number of obs is 12? How about 30? 

critvalue12 <- qt(.975,df=11)

critvalue30 <- qt(.975,df=29)


samples2 <- simulatesamples(1000, 12, DIST = rexp, beta = 4)
ci.lower <- samples2$m - (critvalue12*samples2$s)/sqrt(12)
ci.upper <- samples2$m + (critvalue12*samples2$s)/sqrt(12)
bad.lower <- sum(meanz < ci.lower)
bad.upper <- sum(ci.upper < meanz)
bad.frac <- (bad.lower + bad.upper) / 1000
bad.frac


bad.frac.lower = bad.lower/1000 #.001 which is not close to .025 at all
bad.frac.upper = bad.upper/1000 #.104 which is also not close to .025
sumoffracs = bad.frac.lower + bad.frac.upper
sumoffracs

# the fraction's sums are .104 which is nowhere near close to .05.

# bad frac of .105 for 12 obs -- fairly reliable


samples2 <- simulatesamples(1000, 30, DIST = rexp, beta = 4)
ci.lower <- samples2$m - (critvalue30*samples2$s)/sqrt(30)
ci.upper <- samples2$m + (critvalue30*samples2$s)/sqrt(30)
bad.lower <- sum(meanz < ci.lower)
bad.upper <- sum(ci.upper < meanz)
bad.frac <- (bad.lower + bad.upper) / 1000
bad.frac


# bad frac of .071 for 30 obs -- even more reliable.

bad.frac.lower = bad.lower/1000 #.008 which is not close to .025 at all
bad.frac.upper = bad.upper/1000 #.063 which is also not close to .025
sumoffracs = bad.frac.lower + bad.frac.upper
sumoffracs


# The sum is 0.071 which is pretty close to .05, but not very. 







#ST 308 Project 3

#Name: Mallory LaRusso
#Group Members: Aidan McCarthy, Jordan Lewis

#For this activity you will create an R program and upload that program to wolfware. Each member of your group must submit their own code. Be sure that your R file adheres to the R file submission guidelines (available on wolfware). You should also write down your group members? names as you will need those when you submit your file.

#To Do -- Write an R script that answers each question below. Note that you should have comments throughout your program explaining what you are doing and also you will need to answer questions.  You may include output if it will help your explanation.

#In the first part of this this project (qestions 1-5), you are going to re-work part of what you did in project 1 but without using tidyverse functions and chaining.

#Starting Steps:
#Step 1. Set the working directory. Load the ?Rlab' package.

setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Projects/Project 1")
library(Rlab)

#Step 2. Read in both sheets in the aphasia_study.xlsx data, and save them as two R data frames, phasic and nonphasic. You do this by clicking on aphasia_data.xlsx and saving the sheets as two different .csv files.  Then read them into aphasic and nonaphasic using the base R function read.csv. Use the head function to take a look at each data frame.
aphasic <- read.csv("aphasic.csv")
nonaphasic <- read.csv("nonaphasic.csv")

head(aphasic)
head(nonaphasic)

#Use colnames1 as defined below for the variable names in the ?aphasic? sheet; use colnames2 as defined below for the variables names in the ?nonaphasic? sheet.

      colnames1 <- c("gender","group","duration","words_per_sec",
               "utter_per_sec","AQ","edu_yr","words","nonword",
               "phon_nonword","phon_word",
               "demonstratives","nouns","pronouns","verbs")

      colnames2 <- c("gender","group","duration","words_per_sec",                    			     
                     "utter_per_sec","edu_yr","pronouns",
                     "verbs","nouns","demonstratives")

names(aphasic) <- colnames1
names(nonaphasic) <- colnames2

#1. Give the number of rows and columns for each data set.

dim(aphasic)
dim(nonaphasic)


# aphasic has 138 rows and 15 columns
# nonaphasic has 143 rows and 10 columns

#2. Use the rbind() function to combine the two R objects from step 1 into a new data frame called full.data using only the columns they have in common.  
# The names in colnames2 are a subset of those in colnames1.  (Hint: aphasic[,colnames2] will pick out the right columns from aphasic to match with those in nonphasic.) 

full.data <- rbind(aphasic[,colnames2], nonaphasic)

#3. Check that full.data has the correct number of rows and columns.

dim(full.data)

# full.data has 281 rows and 10 columns.


#4. Use unique(full.data$group) to find the possible values of the group variable.
# Then delete all rows with group value "NotAphasicByWAB" and define a new variable added to full.data, atype, which is equal to "aphasia" if group is not equal to "control" and is equal to "control" otherwise. 

unique(full.data$group)

full.data <- full.data[full.data$group != "NotAphasicByWAB", ]
full.data$atype <- ifelse(full.data$group == "control", "control", "aphasic")

#5. Use the stats function from Rlab to find descriptive statistics for the variables nouns and verbs by atype. 

stats(full.data$nouns, full.data$atype)
stats(full.data$verbs, full.data$atype)

#NOUNS              
#                 aphasic   control
#N              120.000000 143.00000
#mean             8.908333  22.84615
#Std.Dev.         7.276064  13.90476
#min              0.000000   6.00000
#Q1               4.000000  14.00000
#median           8.000000  20.00000
#Q3              11.250000  25.00000
#max             55.000000 100.00000
#missing values   0.000000   0.00000


#VERBS
#                  aphasic   control
#N              120.000000 143.00000
#mean             5.775000  15.37762
#Std.Dev.         6.476152  11.80762
#min              0.000000   4.00000
#Q1               1.000000   8.00000
#median           4.000000  12.00000
#Q3               9.000000  18.00000
#max             44.000000  73.00000
#missing values   0.000000   0.00000

#6. The data in ozone are the monthly mean concentration (in Dobson units) of the ozone layer at Arosa, Switzerland, from 1926 to 1971 (from Andrews and Herzberg, 1985, p. 75-76).  (Taken from Rlab).  Print the first few rows to see what it looks like.

ozone[1:10, ]

#a. First use set.panel(m,n) or par(mfrow = c(m, n)) to set the plot two have 2 plots, one over the other (m=2,n=1).
# Then use boxplot(ozone~month,data=ozone) followed by bplot(ozone$ozone,by=ozone$month).
# The bplot is much better for seeing trends over months than the one produced by boxplot. 
# What is the difference between the two plots? 

set.panel(2,1)
boxplot(ozone~month, data=ozone)
bplot(ozone$ozone, by = ozone$month)

# The boxplot does not go in time order. The months are april, august, december, ect.
# Also, the boxes on the box plot are a lot larger and it is difficult to see if there is a trend, especially since they are not in time order. Outliers are more present in the boxplot as well.
# The bplot is effective at showing the trends over the months and the boxes are smaller and easier to read.


#b. Next, we want to look at the means and standard deviations by month.  To do that, enter stats(ozone$ozone,by=ozone$month)->temp and round(temp,1) to see what is in temp.
# What type of R object is temp?

temp <- stats(ozone$ozone,by=ozone$month)
round(temp,1)
str(temp)

# temp is a list of two objects. 


#c. Next we want to plot the means versus month on the top figure and the standard deviations on the bottom (using rows of temp).
# To get started, put the 12 means into o.mean and the standard deviations into o.sd, and see what you get with 

o.mean <- temp[2, 1:12]
o.sd <- temp[3, 1:12]
lplot(colnames(temp),o.mean)
lplot(colnames(temp),o.sd)

#Note that the basic R function "plot" will not work here because colnames(temp) is a character variable.  Thus we use the special Rlab function "lplot." 
# Now let us spiffy the graph up by replotting and adding some code to the lplot statement.

#)  Make the plotting symbols large with tcex= (.7 is the default). Just try a few values and pick one that looks good.

lplot(colnames(temp),o.mean, tcex = 1)
lplot(colnames(temp),o.sd, tcex = 1)

#ii) add a ylim=c(y_1,y_2) to each lplot, where y_1 is below the minimum and y_2 is above the maximum. 
# Again, trial and error is the best--I just don't like a point to be too close to the bottom or top. Add a label to the yaxis with ylab="Mean Ozone" and one for the standard deviation plot.
# Apparently we can't add an xlabel within lplot.

lplot(colnames(temp),o.mean, tcex = 1, ylim=c(250,450), ylab = ("Mean Ozone"))
lplot(colnames(temp),o.sd, tcex = 1, ylim=c(0, 35), ylab = ("Spread of Ozone"))

#iii) add a title to each plot with a separate statement title("...") after each lplot statement.

lplot(colnames(temp),o.mean, tcex = 1, ylim=c(250,450), ylab = ("Mean Ozone"))
title("Mean Ozone Concentration by Month")
lplot(colnames(temp),o.sd, tcex = 1, ylim=c(0, 35), ylab = ("Spread of Ozone"))
title("Spread in Ozone Concentration by Month")

#Finally, after making your plot, describe what you see about the means and standard deviations.

# The mean ozone concentration starts moderately high, dips down from august - november, and then rises again until about april until beginning to dip down agian.
# The standard deviation in ozone concentration starts off low in july and stays realitively steady for about 4 months. It then rises from november to feburary, peaking at feburary. Then, it begins to fall again, less rapidly then it grew.

#7. The data set draft contains average lottery numbers by month for the 1970 Draft Lottery (randomly drawn in Dec. 1969).
# These numbers determined the order by which draft age youth were drafted in 1970. 
# For example, a person whose birthday received number 63 was drafted fairly early in 1970; a person with number 300 was not drafted at all. 
# One of the variables, draft$order, breaks the months into two groups: "first" is for January through June and "second" is for July through December. 
# If the draft numbers (1-366) were actually random, then monthly averages of draft$lottnum should be close to 183.5. 
# Use any or all of lplot, bplot (or boxplot), stats, or t.test along with draft$order and draft$lottnum. 
# What can you conclude about the randomness of the lottery numbers? 


draft
draft$order

stats(draft$lottnum, by = draft$order)


# The mean of the first group is 160.8333 and the mean of the second group is 206.3333. So far, we think that the draft numbers are not random.
# Carry out a t-test to be sure. True difference in means should be 0. 

t.test(lottnum ~ order, data = draft, alternative = "two.sided")

# Since the p-value (.00335) is less than alpha (.05), we reject H0.
# We can conclude that there is in fact a difference in means of the lottery numbers of the first and second pick. 
# Therefore, we can conclude that the lottery numbers are not random and it is more common to get drafted earlier if you have an earlier birthday.





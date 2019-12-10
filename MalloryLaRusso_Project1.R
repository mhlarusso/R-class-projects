
#ST 308 Project

#For this activity you will create an R program and upload the program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#Name: Mallory LaRusso
#Group Member: Aidan McCarthy, Jordan Lewis

#Date: 1/17/2019
#The purpose of this activity is to determine if aphasic and nonaphasic subjects differ in the way they respond to the same question.

#To Do:  Write  an R script corresponding to the questions below. Use tidyverse functions to read in and manipulate data when possible.

#Step 1. Set the working directory. Load the 'readxl' and 'dplyr' packages.

setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Project 1")

library(readxl)
library(dplyr)

#Step 2. Read in both sheets in the aphasia_study.xlsx data and save them as two R objects.
 #  Use colnames1 for the variable names in aphasic sheet amd colnames2 for variables names in nonaphasic sheet.
colnames1 <- c("gender","group","duration","words_per_sec",
               "utter_per_sec","AQ","edu_yr","words","nonword",
               "phon_nonword","phon_word","sem_related","sem_unrelated",
               "demonstratives","nouns","pronouns","verbs")
colnames2 <- c("gender","group","duration","words_per_sec",
               "utter_per_sec","edu_yr","pronouns",
               "verbs","nouns","demonstratives")

aphasic <- read_excel("aphasia_study.xlsx", sheet = "aphasic", col_names = colnames1, skip = 1)
nonaphasic <- read_excel("aphasia_study.xlsx", sheet = "nonaphasic", col_names = colnames2, skip = 1)

#1. Give the number of rows and columns for each data set.

dim(aphasic)
dim(nonaphasic)
# Number of rows in aphasic: 138
# Number of columns in aphasic: 15

# Number of rows in nonaphasic: 143
# Nummber of columns in nonaphasic: 10



#Use rbind() function to combine the two R objects from step 1 into a new R object. 
#Then, use the tbl_df() function to convert that new R object into a tbl object and name it full_data.

a <- rbind(aphasic[,colnames2], nonaphasic)
full_data <- tbl_df(a)

#3. Check to make sure full_data has the correct number of rows and columns
dim(full_data)

#Yes, it is correct.

#4. Use unique(full_data$group) to find the possible values of the group variable. 
# Then delete all rows with group value "NotAphasicByWAB" 
# define a new variable added to full_data, atype, which is equal to "aphasia" if group is not equal to "control" and is equal to "control" otherwise. 

unique(full_data$group)
new_data <- subset(full_data, group != "NotAphasicByWAB")

new_data$atype <- ifelse(new_full_data$group != "control", "aphasia", "control")

#5. Use t.test and boxplot to compare the variables nouns and verbs by atype for the new_data data set. 
# Give 95% confidence intervals for the difference between
# the control and aphasia group means for nounds and verbs and round to 2 decimal places.

t.test(nouns~atype, data = new_data)
t.test(verbs~atype, data = new_data)
boxplot(nouns~atype, data = new_data)
boxplot(verbs~atype, data = new_data)


# Nouns 95% confidence interval: (-16.46, -11.23) 
# Verbs 95% confidence interval:  (-11.93, -7.44)

#6. Use new_data, select edu_yr and duration variables for
# female subjects whose atype is 'aphasia' and sort the result by descending order of edu_yr.
# What is the duration for the second row in the result?

number6 <- new_data %>% filter(gender == "female" & atype == "aphasia") %>% select(c(edu_yr, duration)) %>% arrange(desc(edu_yr))

# The duration for the second row in the result is 13

#7. Using new_data, compute the median for the duration, words_per_sec, and utter_per_sec for each atype, and sort the result by ascending atype. 

number7 <- new_data %>% group_by(atype) %>% summarise(median(duration), median(words_per_sec), median(utter_per_sec)) %>% arrange(atype)


#8. Using new_data, for those subjects who spoke at least one word, i.e. verbs + nouns + pronouns + demonstratives > 0,
# summarize the mean proportion of nouns for each atype category (mean of proportions). 
# In a comment, give the mean proportion of nouns spoken by aphasia subjects. 
# (Hint: define a new variable equal to the sum of those words, say sumword, and filter it when > 0. 
# Then add a variable equal to nouns/sumwords and get its mean.)

sumword = new_data$verbs + new_data$nouns + new_data$pronouns + new_data$demonstratives
new_data$proportion = new_data$nouns / sumword
number8 <- new_data %>% filter(sumword > 0) %>% group_by(atype) %>% summarise(mean(proportion))

# Mean proportion of nouns spoken by aphasia subjects : .451

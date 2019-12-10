####################################
##Pre-Class Activity 10
##Name: Mallory LaRusso
####################################

#Create an R script that will do the following:

library(readr)
library(dplyr)

riverData <- read_csv("https://raw.githubusercontent.com/jbpost2/IntermediateR/master/datasets/river.csv")

riverData <- riverData %>%
  mutate(Size = ifelse(Size_km2 < 15000, "Small",
                       ifelse(Size_km2 < 100000, "Medium",
                              ifelse(Size_km2 < 350000, "Sizeable",
                                     ifelse(Size_km2 < 700000, "Large", "Great")))))
riverData$Size <- ordered(riverData$Size, levels = c("Small", "Medium", "Sizeable", "Large", "Great"))

riverData %>% group_by(Size) %>% summarise(mean(Rc, na.rm = TRUE))


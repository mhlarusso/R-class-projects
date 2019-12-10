##Project 2
##Name: Mallory LaRusso
##Group Members: Aidan McCarthy, Jordan Lewis

#For this activity you will create an R program and upload that program to wolfware. Be sure that your R file adheres to the R file submission guidelines (available on wolfware).

#To Do -- Practice with ggplot.

#-------------------------------------------------------------------------------

library(tidyverse)
library(readxl)
install.packages("microbenchmark")
library(microbenchmark)
#Create functions for use later on. Running this code makes these functions available to us.
#Given a census column name such as LLL######D, extract the last two numbers (which represent a year usually)

grabYear <- function(string){
  m <- regexpr(pattern = "(\\d+)", string)
  match <-regmatches(string, m)
  year <- gsub(pattern = "\\d\\d\\d\\d", replacement = "", x = match)
  return(as.numeric(year))
}

is.County <- function(countyString){
  if(length(grep(pattern = ", \\w\\w", countyString))>0){
    return(1)
  } else {
    return(0)
  }
}
#vectorize it instead and use as a logical for indexing
is.CountyVec <- Vectorize(FUN = is.County, USE.NAMES = FALSE)

setwd("/Users/mallorylarusso/Desktop/Spring 2019/ST 308 (R)/Project 2")
mastdata <- read_excel("Mastdata.xls")[2193:2214, ]
public_school_ennrollment_variables <- list(mastdata[ ,1])

# read in the public school enrollment variables for edu01.
edu01 <- read_excel("EDU01.xls", sheet = 1)
edu02 <- read_excel("EDU01.xls", sheet = 2)
edu03 <- read_excel("EDU01.xls", sheet = 3)


# keep columns that start w/ Area_name, STCOU, end with d, remove District of Columnia, and make it in "long" form.
long01 <- edu01 %>% select(Area_name, STCOU, ends_with("D")) %>% filter(Area_name != "District of Columbia") %>% gather(key = "a", value = "enrollment", ends_with("D"))
long02 <- edu02 %>% select(Area_name, STCOU, ends_with("D")) %>% filter(Area_name != "District of Columbia") %>% gather(key = "a", value = "enrollment", ends_with("D"))
long03 <- edu03 %>% select(Area_name, STCOU, EDU015207D, EDU015208D) %>% filter(Area_name != "District of Columbia") %>% gather(key = "a", value = "enrollment", ends_with("D"))


# make it a data frame
edu_together <- rbind(long01, long02, long03)
edu_dataframe <- data.frame(edu_together)

# make variable called numYear using grabYear

edu_dataframe$numYear <- grabYear(edu_dataframe$a)
#get four digit year as numeric
edu_dataframe$numYear <- ifelse(edu_dataframe$numYear >80, as.numeric(paste0("19",edu_dataframe$numYear)), ifelse(edu_dataframe$numYear >9, as.numeric(paste0("20",edu_dataframe$numYear)), as.numeric(paste0("200",edu_dataframe$numYear))))

# for loop and is.Country() function to create an indexing vector that is 1 if row is county level and 0 if row is any other observation.
county <- list()
for (i in edu_dataframe$Area_name){
    county[i] <- (is.County(i))
}


# use vecterized version, is.CountyVec(), to create the same indexing vector.

CountyVec <- is.CountyVec(edu_dataframe$Area_name)

edu_dataframe[CountyVec==1,]

# create two data sets, one with only county level data and one with non-county data
edCountyData <- edu_dataframe[CountyVec==1,] %>% select(-a)
edSummaryData <- edu_dataframe[CountyVec ==0,] %>% select(-a)


# create a function that takes in a data frame that contains the non-county data,
# adds a column to the data set called "Division" corresponding to the state's classification fo division.
# and returns the data frame. If row corresponds to a non-state, return ERROR for Division

Division <- function(data_frame){
  Division1 <- c("CONNECTICUT", "MAINE", "MASSACHUSETTS", "NEW HAMPSHIRE", "RHODE ISLAND", "VERMONT")
  Division2 <- c("NEW JERSEY", "NEW YORK", "PENNSYLVANIA")
  Division3 <- c("ILLINOIS", "INDIANA", "MICHIGAN", "OHIO", "WISCONSIN")
  Division4 <- c("IOWA", "KANSAS", "MINNESOTA", "MISSOURI", "NEBRASKA", "NORTH DAKOTA", "SOUTH DAKOTA")
  Division5 <- c("DELAWARE", "FLORIDA", "GEORGIA", "MARYLAND", "NORTH CAROLINA", "SOUTH CAROLINA", "VIRGINIA", "DISTRICT OF COLUMBIA", "WEST VIRGINIA")
  Division6 <- c("ALABAMA", "KENTUCKY", "MISSISSIPPI", "TENNESSEE")
  Division7 <- c("ARKANSAS", "LOUISIANA", "OKLAHOMA", "TEXAS")
  Division8 <- c("ARIZONA", "COLORADO", "IDAHO", "MONTANA", "NEVADA", "NEW MEXICO", "UTAH", "WYOMING")
  Division9 <- c("ALASKA", "CALIFORNIA", "HAWAII", "OREGON", "WASHINGTON")
  
  for (i in 1:dim(data_frame)[1]){
    if (data_frame$Area_name[i] %in% Division1){
      data_frame$Division[i] = "Division 1"
  } else if (data_frame$Area_name[i] %in% Division2){
    data_frame$Division[i] = "Division 2"
  } else if (data_frame$Area_name[i] %in% Division3){
    data_frame$Division[i] = "Division 3"
  } else if (data_frame$Area_name[i] %in% Division4){
    data_frame$Division[i] = "Division 4"
  } else if (data_frame$Area_name[i] %in% Division5){
    data_frame$Division[i] = "Division 5"
  } else if (data_frame$Area_name[i] %in% Division6){
    data_frame$Division[i] = "Division 6"
  } else if (data_frame$Area_name[i] %in% Division7){
    data_frame$Division[i] = "Division 7"
  } else if (data_frame$Area_name[i] %in% Division8){
    data_frame$Division[i] = "Division 8"
  } else if (data_frame$Area_name[i] %in% Division9){
    data_frame$Division[i] = "Division 9"
  } else data_frame$Division[i] = "Error"
  }
  
return(data_frame)

}

edSummaryData <- Division(edSummaryData)

#  Create summary statistics for overall mean in each division. Do it once w/ tapply() and once w/ tidyverse method.
tapply(edSummaryData$enrollment, edSummaryData$Division, mean)
edSummaryData %>% group_by(Division) %>% summarise(mean(enrollment))

# Use microbenchmark to compare the speeds.
microbenchmark(tapply(edSummaryData$enrollment, edSummaryData$Division, mean))
microbenchmark(edSummaryData %>% group_by(Division) %>% summarise(mean(enrollment)))

# Mean time to run the tapply function was 217.9843 milliseconds
# Mean time to run tidyverse function was 1.377 milliseconds, so it seems that the tidyverse approach is quicker.


# Create a function. Read in particular sheet of a census type data set.
# Select columns as abpve. Filter out "District of Columbia" rows. Include only non-county data
# Filter to include only non-county data.
# there should be a "long" form option and an option to include the divison.

formatData <- function(path, sheet = 1, gather = TRUE, colValue = "value", division = TRUE){
  require(tidyverse)
  data <- read_excel(path, sheet = sheet)
  filtered_data <- data %>% select(Area_name, STCOU, ends_with("D")) %>% filter(Area_name != "District of Columbia")
  CountyVec <- is.CountyVec(filtered_data$Area_name)
  nonCounty <- data.frame()
  nonCounty <-filtered_data[CountyVec ==0,]
  if (gather == TRUE){
    long_nonCounty <- nonCounty %>% gather(key = "a", value = "colValue", ends_with("D"))
    long_nonCounty$numYear <- grabYear(long_nonCounty$a)
    long_nonCounty$numYear <- ifelse(long_nonCounty$numYear >80, as.numeric(paste0("19",long_nonCounty$numYear)), ifelse(long_nonCounty$numYear >9, as.numeric(paste0("20",long_nonCounty$numYear)), as.numeric(paste0("200",long_nonCounty$numYear))))
    
      if (division == TRUE){
        long_nonCounty$Division=0
        b <- Division(long_nonCounty) 
      return(b %>% select(-a))
    } else if (division == FALSE){
      return(long_nonCounty %>% select(-a))
    }
  }
  
return(nonCounty)
}

formatData("PST01.xls", sheet = 2, colValue = "Population", division = TRUE, gather = TRUE)
formatData("PST01.xls", sheet = 2, gather = FALSE)

  
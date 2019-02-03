# Week 4 Live Code 

# first thing, remember to pull your repository from GitHub!

# Intro to Dataframes

download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv")

#hit tab/complete to understand what arguments you need within a given function

surveys <- read.csv <- read.csv(file = "data/portal_data_joined.csv")

#read.csv will turn it into a manipulatbale dataframe in R

surveys #will print a LOT

head(surveys)

#let's look at structure: 30:35
str(surveys)

dim(surveys) #rows, #columns
nrow(surveys) #rows
ncol(surveys) #columns

tail(surveys) #bottom of data

names(surveys) #all character vectors
rownames(surveys) #each row number in this case

#SUMMARY: another really useful tool

summary(surveys)

#SUBSETTING DATAFRAMES

#subset vectors by giving them a location
animal_vec <- c("mouse", "rat", "cat")
animal_vec[2]

#dataframes are 2D!
surveys[1,1] #[row,column]
head(surveys)
surveys[2.1] 

surveys[1,6]
surveys[33000,1]

#Bracket notation gets us the whole first column as a vector
surveys[,1] #blank before comma means ALL ROWS

#using a single number w/ no comma (,) gives us a dataframe with one column
surveys[1]
head(surveys[1]) 

surveys[1:3,6] #pulls out first three entries within the 6th column

animal_vec[c(1,3)]
c(1,3) #simply a vector w/ 1,3

surveys[5,] #pulls out a whole single observation; blank after comma means ALL columns

#use negative sign to exclude certain data
surveys[1:5,-1] #excludes entire first column
str(surveys[-c(10:34786),]) #get back everything except rows 10:34768

surveys[c(10,15,20),]
surveys[c(10, 15, 20, 10), ] #repeats 10 at the end
surveys[c(1,1,1,1,1),]

#more ways to subset
surveys["plot_id"] # produces single column as data.frame
surveys[,"plot_id"] # produces single column as a vector
surveys[["plot_id"]] # also produces a single column as a vector 

#we will eventually learn about lists, which are flexible, which can be more challenging to subset, so [[]] can be useful in that regard

surveys$year # '$' is essentially "by" 

## challenge!
#Create a data.frame (surveys_200) containing only the data in row 200 of the surveys dataset.
surveys_200 <- surveys[1:200,]  
surveys_200

#use nrow() to find last column
nrow(surveys) #identified last row of data
survey_lastrow <- surveys[34786,] #pulled out last row in data.frame
survey_lastrow #prints only last row
tail(surveys) #prints last6 rows

surveys_last <- nrow(surveys)
surveys_last <- surveys[nrow(surveys),] #create a new dataframe with the last row of data
surveys_last

# create a data.frame w/ the middle row fo the dataset
surveys_middle <- surveys[nrow(surveys)/2,]
surveys_middle

#combine nrow() with the '-' notation to reproduce the heavior of head(surveys, keeping only rows 1-6)
surveys_head <- surveys[-c(7:nrow(surveys)),]
surveys_head

#Factors!
surveys$sex

#Create our own factor!
sex <- factor(c("male", "female", "female", "male"))
sex
class(sex) #class() function used to create vector
typeof(sex) #typeof() describes what a factor is

#levels() prints character vector of levels
levels(sex)
levels(surveys$genus)

nlevels(sex) #nlevels tells you the number of levels

concentration <- factor(c("high", "medium", "high", "low"))
concentration

concentration <- factor(concentration,c("low", "medium", "high"))
concentration

#let's try adding to a factor
concentration <- c(concentration, "very high")
concentration 

#prints character vectors if you add a value that doesn't match a current level, so you can make them characters!
as.character(sex)

#factors with numeric levels
year_factor <- factor(c(1990, 1923, 1965, 2018))
year_factor
as.numeric(year_factor)
as.numeric(as.character(year_factor)) #this prints a numeric vector

#why are we even doing all this stuff with the factors?!
surveys_no_factors <- read.csv(file="data/portal_data_joined.csv", stringsAsFactors = FALSE) 
surveys_no_factors

#recommended way to obtain factors
as.numeric(levels(year_factor)) [year_factor] # [] helps subset integer values: 1923, 1965, 1990, 2018

#rename factors
sex <- surveys$sex
sex
levels(sex)
levels(sex)[1] 

levels(sex)[1] <- "undetermined" #[] w/ number is a way to add a new level!
levels(sex)
head(sex)

#working with dates
library(lubridate)
my_date <- ymd("2015-01-01")
my_date
str(my_date)

my_date <- ymd(paste("2015", "05", "17", sep = "-")) #paste will change dates & separate ("sep" argument) these numbers using a '-'

my_date
str(my_date)

paste(surveys$year, surveys$month, surveys$day, sep = "-") #stitches all these factors together and seperates them using the '-' 

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
surveys$date
surveys$date[is.na(surveys$date)]

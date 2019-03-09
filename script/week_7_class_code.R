#Week 7 Live Code

#how to install a package form GitHub
devtools::install_github("thomasp85/patchwork")

install.packages("viridis")
library(viridis) #now default in ggplot2

#### Data Import and Export ======================

library(tidyverse)
wide_data <- read_csv("data/wide_eg.csv", skip = 2)
#'skip' argment will 'skip' a certain numebr of rows in the csv
wide_data

#can generate a new csv file with 'write_csv'

#loaded an RDA file that contained a single R object; RDA files can contain 1+ R objects
load("data/mauna_loa_met_2001_minute.rda")

saveRDS(wide_data, "data/wide_data.rds")
rm(wide_data)

readRDS("data/wide_data.rds")
wide_data_rds <- readRDS("data/wide_data.rds")
wide_data_rds


#saveRDS() and readRDS() for .rds files, and we use save() and load() for .rda files

#installed packages: readxl, googlesheets, and googledrive, foreign, rio

library(rio)
rio::import("data/wide_data.rds")

#### Working with Dates and Times in R ===============


library(lubridate)

sample_dates1 <- c("2016-02-01", "2016-03-17", "2017-01-01")

as.Date(sample_dates1)
sample.date2 <- c("02-01-2001", "04-04-1991")

as.Date(sample.date2, format = "%m-%d-%Y")

as.Date("2016/01/01", format = "%Y/%m/%d")

#%m - month
#%d - day
#Y - year

#Jul 04, 2017

as.Date("Jul 04, 2017", format = "%b%d,%Y")
#b represents shortened month, B is full month name

#Date Calculations

dt1 <- as.Date("2017-07-11")
dt2 <- as.Date("2017-04-22")
dt1

#Time Difference In Days
print (dt1 - dt2)

#Time Difference In Weeks
print(difftime(dt1, dt2, units = "week"))

six.weeks <- seq(dt1, length = 6, by = "week")
six.weeks

#Create a sequence of 10 dates starting at dt1 with 2 week intervals

tendates.twoweeks_way1 <- seq(dt1, length = 10, by = 14)
tendates.twoweeks_way2 <- seq(dt1, length = 10, by = "2 week")
tendates.twoweeks_way1
tendates.twoweeks_way2

ymd("2016/01/01")

dmy("04.04.91")

mdy("Feb 19, 2005")

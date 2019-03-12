#Week 8 Live Code

#### Lubridate continued ================

library(lubridate)
library(tidyverse)

load("data/mauna_loa_met_2001_minute.rda")

as.Date("02-01-1998", format = "%m-%d-%Y")

mdy("02-01-1998")
tm1 <- as.POSIXct("2016-07-24 23:55:26 PDT")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2
#need to include all of the parts of the time, can't just provide format for some of it

tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT") # tz sets the timezone
tm3

#specifying timezone and date format in the same call
tm4 <- as.POSIXct(strptime("2016/04/04 14:47", format = "%Y/%m/%d %H:%M"), tz = "America/Los_Angeles")
tm4

tz(tm4)

Sys.timezon() #default timezone on your computer

#Do the same thing with lubridate

ymd_hm("2016/04/04 14:47", tz = "America/Los_Angeles")

ymd_hms("2016-05_04 22:14:11") #automatically converts to UTC, will have to specify timezone if we don't want to use UTC

nfy <- read_csv("data/2015_NFY_solinst.csv") #this didn't work right ... 

nfy1 <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip = 12) #from collaborative google notes
nfy1

nfy2 <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip = 12, col_types = "ccidd")
nfy2

glimpse(nfy2)

nfy2 <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip = 12, col_types = cols(.default = "c", Level = "C"))
nfy2

nfy2 <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFY_solinst.csv", skip = 12, col_types = cols(Date = col_date()))
nfy2

#read everything as normal, but just read the column Date as a different thing

nfy2$datetime <- paste(nfy2$Date, " ", nfy2$Time, sep = "")
nfy2$datetime

glimpse(nfy2)
nfy2$datetime_test <- ymd_hms(nfy2$datetime, tz = "America/Los_Angeles")

nfy2$datetime <- ymd_hms(nfy2$datetime, tz = "America/Los_Angeles")

tz(nfy2$datetime)

glimpse(nfy2)

summary(mloa_2001)

mloa_2001$datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)
glimpse(mloa_2001)

mloa_2001$datetime <- ymd_hm(mloa_2001$datetime)

na.omit(mloa_2001$rel_humid, mloa_2001$temp_C_2m, mloa_2001$windSteady)

mloa2 <- mloa_2001 %>%
  filter(rel_humid != -99, rel_humid != -999) %>%
  filter(temp_C_2m != -99, temp_C_2m != -999) %>%
  filter(windSpeed_m_s != -99, windSpeed_m_s != -999)

mloa3 <- mloa2 %>% 
  mutate(which_month = month(datetime, label = TRUE)) %>% #label = TRUE is shortened month, label = FALSE is lengthened month
  group_by(which_month) %>%
  summarize(avg_temp = mean(temp_C_2m))

mloa3 %>% 
  ggplot()+
  geom_point(aes(x = which_month, y = avg_temp), size = 3, color = "blue") +
  geom_line(aes(x = which_month, y = avg_temp))
#ISSUES: Michael is checking this out ...

####FUN-CTIONS===================
log(5)
#Function can return a plot, data.frame, matrix, etc.

#Really simple function:
my_sum <- function(a, b){
  the_sum <- a + b
  return(the_sum)
}

my_sum(3, 7)

#Can set default values:
my_sum <- function(a = 1, b = 2){
  the_sum <- a + b
  return(the_sum)
}

my_sum(a=5, b=8)

#Create a function that converts the temp in K to the temp in C (subtract 273.15)
Ktemp_to_Ctemp <- function(K) {
  Ctemp <- K - 273.15
  return(Ctemp)
}

Ktemp_to_Ctemp(90)

list <- c(8,9,130)

Ktemp_to_Ctemp(list)


#### Iteration =========================
#If you think you'll be repeating something more than 3x, you should learn to iterate them

x <- 1:10
log(x)

# for loops
for(i in 1:10) {
  print(i) #run everything inside the loop with i = 1
}

#Same as ... 
print(1)
print(2)
print(3)

# Use 'i' as an index value

for(i in 1:15) {
  print(i) #run everything inside the loop with i = 1
}

for(i in 1:10){
  print(i)
  print(i^2)
}

for(i in 1:10) {
  print(letters[i])
  print(mtcars$wt[i])
}

# make a results vector ahead of time

results <- rep(NA, 10)

for(i in 1:10) {
  results[i] <- letters [i]
}

results

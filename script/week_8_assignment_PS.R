#Week 8 Homework

#### PART 1 =====

#### Make a datetime column by using paste to combine the date and time columns; remember to convert it to a datetime! ====


library(tidyverse)
library(lubridate)
library(ggthemes)

am_riv <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFA_solinst_08_05.csv", skip = 13)

glimpse(am_riv)

am_riv$datetime <- paste(am_riv$Date, " ", am_riv$Time, sep = "")
am_riv$datetime

#### Calculate the weekly mean, max, and min water temperatures and plot as a point plot (all on the same graph) =====


am_riv_avg_wk <- am_riv %>%
  mutate(week = week(datetime)) %>%
  group_by(week) %>%
  summarize(mean_temp = mean(Temperature))

am_riv_min_wk <- am_riv %>%
  mutate(weekmin = week(datetime)) %>%
  group_by(weekmin) %>%
  summarize(min_temp = min(Temperature)) 

am_riv_max_wk <- am_riv %>%
  mutate(weekmax = week(datetime)) %>%
  group_by(weekmax) %>%
  summarize(max_temp = max(Temperature)) 

am_riv_allwk <- cbind(am_riv_avg_wk, am_riv_max_wk, am_riv_min_wk)
am_riv_allwk$weekmax <- NULL
am_riv_allwk$weekmin <- NULL

am_riv_allwk %>%
  ggplot()+
  geom_point(aes(x = week, y = mean_temp), size = 3, color = "blue") +
  geom_point(aes(x = week, y = max_temp), size = 4, color = "red") +
  geom_point(aes(x = week, y = min_temp), size = 2, color = "green") +
  theme_tufte() +
  theme(panel.grid = element_blank())
    

#### Calculate the hourly mean Level for April through June and make a line plot (y axis should be the hourly mean level, x axis should be datetime) ====


### THIS IS HARD. I AM STUCK

glimpse (am_riv)

am_riv_AprJun <- am_riv %>% 
  mutate(MonthNumb = month(datetime, label = FALSE)) %>% 
  filter(MonthNumb >= 4, MonthNumb <= 6)
  
glimpse (am_riv_AprJun)
tail(am_riv_AprJun)


dt1 <- as.Date("2015-04-01 00:00:00", format = "%dY-%m-%d %H:%M:%S")

# Number of hours between April & June 2015: 2184
(24*30) + (24*30) + (24*31)


am_riv_AprJun$hrs <- hour(am_riv_AprJun$datetime)
am_riv_AprJun

mean_Levels <- am_riv_AprJun %>% 
  group_by(hrs) %>% 
  summarize(avg_Levels = mean(Level))

glimpse(mean_Levels)
tail(mean_Levels)

mean_Levels %>%
  ggplot()+
  geom_point(aes(x = hrs, y = avg_Levels), size = 3, color = "blue") +
  geom_smooth(aes(x = hrs, y = avg_Levels, alpha = 2, color = "black")) +
  theme_tufte() +
  theme(panel.grid = element_blank())


#### PART 2 ====================

####  Use the mloa_2001 data set. Remeber to remove the NAs (-99 and -999) and to create a datetime column (we did this in class).

library(lubridate)
library(tidyverse)
library(ggthemes)

load("data/mauna_loa_met_2001_minute.rda")

summary(mloa_2001)

mloa_2001$datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)

mloa_2001$datetime <- ymd_hm(mloa_2001$datetime)

na.omit(mloa_2001$rel_humid, mloa_2001$temp_C_2m, mloa_2001$windSteady)

mloa2 <- mloa_2001 %>%
  filter(rel_humid != -99, rel_humid != -999) %>%
  filter(temp_C_2m != -99, temp_C_2m != -999) %>%
  filter(windSpeed_m_s != -99, windSpeed_m_s != -999)


# Then, write a function called plot_temp that returns a graph of the temp_C_2m for a single month. The x-axis of the graph should be pulled from a datetime column (so if your data set does not already have a datetime column, you'll need to create one!)


temp_C_2m_Jan <- mloa2 %>% 
  filter (month == 1) 
glimpse (temp_C_2m_Jan)
tail (temp_C_2m_Jan)

plot_temp <- temp_C_2m_Jan %>% 
  ggplot() +
  geom_point(aes(x = datetime, y = temp_C_2m), size = 3, color = "blue") +
  theme_tufte() +
  theme(panel.grid = element_blank())
 
plot_temp
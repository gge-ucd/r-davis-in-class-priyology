#Week 5 live code
library(tidyverse)
library(dplyr)

surveys <- readr::read_csv("data/portal_data_joined.csv")
surveys
str(surveys)

#'select': can be used to work with specific data frames

select(surveys, plot_id, species_id, weight)

#can 'filter' specific data, will need to use '=='

filter(surveys, year == 1995)

surveys2 <- filter(surveys, weight < 5)
surveys2

surveys_sml <- select(surveys2, species_id, sex, weight)
surveys_sml

#but, this can be *really* clunky ... so use a PIPE in dplyr

#Pipes %>% on a PC, shortcut is control-shift-M, pipe shifts what's on the right of the pipe to the left of the pipe

surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

#Challenge! Susbet surveys to include individuals collected before 1995 and retain only the columns year, sex, and weight

surveys %>%
  filter(year < 1995) %>%
  select(year, sex, weight)  

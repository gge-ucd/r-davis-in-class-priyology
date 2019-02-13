#Week 6 Live Code

library(tidyverse)

###### finishing up dplyr ========================
surveys <- read_csv("data/portal_data_joined.csv")

#take out all NAs from weight, hindfoot_length, and sex

surveys_complete <- surveys %>%
  filter(!is.na(weight)) %>% 
  filter(!is.na(hindfoot_length)) %>% 
  filter(!is.na(sex)) 

surveys_complete <- surveys %>%
  filter(!is.na(weight), !is.na(hindfoot_length), !is.na(sex)) 
  
species_counts <- surveys_complete %>% 
  group_by(species_id) %>% 
  tally() %>% 
  filter(n >= 50)

surveys_complete <- surveys_complete %>% 
  filter(species_id %in% species_counts$species_id)

species_keep <- c("DM", "DO") #example of list we could use instead of the row in a dataframe

#writing your dataframe to .csv

write_csv(surveys_complete, path = "data_output/surveys_complete.csv")


# Wed Feb 13 10:16:08 2019 ------------------------------
## ^ made via 'ts + TAB'

####ggplot time! ======================
library(ggplot2)

#ggplot(data = DATA, mapping = aes(MAPPINGS)) + 
#geom_function()

ggplot(data = surveys_complete)

#define a mapping 

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

# saving a plot object
surveys_plot <- ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

surveys_plot +
  geom_point()

## Challenge! try making a hexbin plot
surveys_plot +
  geom_hex()

# we're going to build plots form the ground up
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1)
  

##57:00


## Create a new script in your r-davis-in-class-yourname project, and name it w_5_assignment_ABC.R, with your initials in place of ABC. Save it in your scripts folder.

## Read portal_data_joined.csv into R using the tidyverse’s command called read_csv(), and assign it to an object named surveys.

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

## Using tidyverse functions and pipes, subset to keep all the rows where weight is between 30 and 60, then print the first few (maybe… 6?) rows of the resulting tibble.


surveys_less30 <- surveys %>% 
  filter(weight > 30) %>%
  filter(weight < 60) %>%
  head()
surveys_less30


## Make a tibble that shows the max (hint hint) weight for each species+sex combination, and name it biggest_critters. 

biggest_critters <- surveys %>%
  filter(!is.na(sex)) %>%
  filter(!is.na(weight)) %>%
  group_by(species, sex) %>%
  arrange(sex, species, desc(weight)) %>%
  summarize(max_weight = max(weight, na.rm = TRUE)) %>% View


## Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange 'here.
  
surveys %>%
  filter(!is.na(weight)) %>%
  select(species_id, sex, hindfoot_length, weight) %>% 
  arrange(sex, hindfoot_length, weight) 

surveys %>%
  filter(!is.na(sex)) %>%
  select(species_id, sex, hindfoot_length, weight) %>% 
  arrange(sex, hindfoot_length, weight) 

surveys %>%
  filter(!is.na(hindfoot_length)) %>%
  select(species_id, sex, hindfoot_length, weight) %>% 
  arrange(sex, hindfoot_length, weight) 


surveys %>%
  tally(is.na(weight))

surveys %>%
  tally(is.na(hindfoot_length))

## Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight. The resulting tibble should have 32,283 rows.

surveys_avg_weight <- surveys %>%
  select(species, sex, weight) %>% 
  filter(!is.na(weight)) %>%
  group_by(species, sex) %>% 
  summarize (avg_weight = mean(weight, na.rm = TRUE)) %>% 
  mutate(avg_weight) %>% 
  arrange(species, sex, desc(avg_weight)) %>% View

## Challenge: Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).

surveys_avg_weight %>% 
  filter(!is.na(sex)) %>% View

%>%
  select(species, sex, weight, avg_weight) 

%>% 
  mutate(above average = is.logical(avg_weight > weight)
      
    above_average = (weight > avg_weight)) %>% View

## Extra Challenge: Figure out what the scale function does, and add a column to surveys that has the scaled weight, by species. Then sort by this column and look at the relative biggest and smallest individuals. Do any of them stand out as particularly big or small?
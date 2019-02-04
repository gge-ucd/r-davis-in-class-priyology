
## Read portal_data_joined.csv into R using the read.csv command and create a dataframe named surveys (just like we did in class).
surveys <- read.csv("data/portal_data_joined.csv")

## Subset to just the first column and columns five through 8. Include only the first 400 rows. Save this as a dataframe called  surveys_subset.
surveys_subset <- surveys[1:400,c(1, 5:8)]
surveys_subset

## CHALLENGE: Select all rows that have a hindfoot_length greater than 32, save these in a new data.frame named  surveys_long_feet, then plot its hindfoot_length values as a histogram using the hist function.
surveys_long_feet <- surveys_subset[surveys_subset$hindfoot_length > 32, ]
surveys_long_feet
complete.cases(surveys_long_feet)
surveys_long_feet <- na.omit(surveys_long_feet)
surveys_long_feet
hist(surveys_long_feet$hindfoot_length)
hindfoot_lengths <- as.character(surveys_long_feet$hindfoot_length)
hindfoot_lengths
hist(hindfoot_lengths)

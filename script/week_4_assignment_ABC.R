
## Read portal_data_joined.csv into R using the read.csv command and create a dataframe named surveys (just like we did in class).
surveys <- read.csv("data/portal_data_joined.csv")

## Subset to just the first column and columns five through 8. Include only the first 400 rows. Save this as a dataframe called  surveys_subset.
surveys_subset <- surveys[1:400,c(1, 5:8)]
surveys_subset

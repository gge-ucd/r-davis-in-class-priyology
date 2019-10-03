week_3_class_code

read.csv("data/tidy.csv")

x <- 4

#vectors

weight_g <- c(50, 60, 31, 89)
weight_g

#characters
animals <- c("mouse", "rat", "dog", "cat")
animals

#vector exploration tools

##length tells you how many data points are in a given vector

length(weight_g)
length(animals) 

##class tells you the data "type"

class(weight_g)
class(animals)

##str helps you look at all of that together
str(x)
str(weight_g)
str (animals)

#Tab Complete
 # R givues us a lot of options

## you can add values to a vector
weight_g <- c(weight_g, 105) #if you run this line multiple times, it will add the value multiple times
weight_g

weight_g <- c(25, weight_g) #where you put the new value will change where the new value appears in the sequence of data
weight_g

# 6 types of atomic vectors: "numeric" ("double"), "character", "logical", "integer", "complex", "raw"

##atomic means it's irreducible --> simplest expression that R understands

## first 4 are the ones we'll work with the most frequently: "numeric" ("double"), "character", "logical", "integer"

typeof(weight_g)

weight_integer <- c(20L, 21L, 85L)
class(weight_integer)
typeof(weight_integer)

#"vector type" challenge
num_char <- c(1, 2, 3, "a")
typeof(num_char)

num_logical <- c(1, 2, 3, TRUE)
typeof(num_logical)

char_logical <- c("a", "b", "c", TRUE)
typeof(char_logical)

tricky <- c("a", "b", "c", TRUE)
class(tricky)

combined_logical <- c(num_logical, char_logical)
combined_logical
typeof(combined_logical)

#subsetting vectors
animals
animals[3]

animals[c(2, 3)]
animals[c(3, 1, 3)]

#conditional subsetting
weight_g
str(weight_g) #remember, 'str' is the "structure" of a specific vector
weight_g[c(T, F, T, T, F, T)]
weight_g > 50
weight_g[weight_g > 50]

#multiple conditions "|" <-- OR, "==" <-- exactly equal to
weight_g[weight_g < 30 | weight_g > 50]

weight_g[weight_g >= 30 & weight_g == 89]

#searching for characters '%in%' <-- gives entries within a specific vector
animals[animals == "cat" | animals == "rat"]

animals[animals %in% c("rat", "antelope", "jackalope", "hippogriff")]

#challenge: characters are ordered alphabetically when using >
"four" > "five"
"six" > "five"
"eight" > "five"
"z" > "y"

#missing values

heights <- c(2, 4, 4, NA, 6)
str(heights)

mean(weight_g)

mean(heights)
max(heights)

# 'na.rm' <-- removes all NAs from a dataset

mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

?max

min(heights, na.rm = TRUE)

is.na(heights)
na.omit(heights)
?na.omit
complete.cases(heights)
?complete.cases

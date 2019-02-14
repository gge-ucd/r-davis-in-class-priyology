#### Week 6 assignment: ggplot!!! ===================
library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

str(gapminder)

gapminder %>% 
  arrange(desc(year)) %>% View

#### Challenge #1A: Modify the following code to make a figure that shows how life expectancy has changed over time ================================

## ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

ggplot(gapminder, aes(x = year, y = lifeExp)) +
  geom_point()

#### Challenge #1B: Look at the following code. What do you think the scale_x_log10() line is doing? What do you think the geom_smooth() line is doing? ====

## Hint: There's no cost to tinkering! Try some code out and see what happens with or without particular elements.

## ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point(aes(color = continent), size = .25) + scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#### Challenge #1C: Modify the above code to size the points in proportion to the population of the county. Hint: Are you translating data to a visual feature of the plot? ==================================

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

last_plot()

ggsave("wk6_gapminder_figure.tiff", width = 6, height = 6)

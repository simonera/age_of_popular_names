# for step-by-step details, see:
# https://github.com/simonera/age_of_popular_names/blob/main/age_popular_names.Rmd

# libraries
library(readr)
library(ggplot2)
library(ggrepel)
library(scales)

# import data
popular_age <- read_csv("https://raw.githubusercontent.com/simonera/age_of_popular_names/main/most_popular_names_in_the_us_vs_age.csv")

# plot
myplot <- ggplot(data = popular_age, 
                 aes(x = Age, y = Count, colour = Sex, label = Name)) + 
  scale_y_continuous(labels = comma) +
  geom_point() + 
  geom_text_repel(aes(label=ifelse(Count>1000000, Name, '')), max.overlaps = Inf, show.legend   = FALSE) +
  geom_text_repel(aes(label=ifelse(Age<40, Name, '')), max.overlaps = Inf, show.legend  = FALSE) +
  stat_smooth(method = 'gam', se = FALSE) +
  labs(title = "Predicted Age of the Top Names in the US, 1922-2021",
       subtitle = "Based on a sample of 177,238,032 male births and 172,053,794 female births",
       caption = "Sources: United States Social Security Administration; Agify.io
       Created by Simone Rambotti, August 2022")

myplot


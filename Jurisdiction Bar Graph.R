# load packages

library(tidyverse)
library(ggplot2)

# disable scientific notation

options(scipen = 999)

# Create base plot

MTAboxplot <- ggplot(filter(MTAdata, !is.na(Jurisdiction)), aes(Jurisdiction))

# Create box plot

MTAboxplot +
  geom_bar(aes(fill = Jurisdiction), color = "black") +
  scale_x_discrete(guide = guide_axis(n.dodge = 3)) +
  scale_y_continuous(breaks = seq(0, 30, 2)) +
  labs(title = "Numerical Distribution For MTA Jurisdiction", y = "Count",
       subtitle = "Joshua Soriano") +
  theme(axis.title.x = element_text(color = "gold4", size = 20),
        axis.title.y = element_text(color = "purple3", size = 20),
        axis.text.x = element_text(color = "maroon4", size = 13),
        axis.text.y = element_text(color = "cyan4", size = 15),
        legend.position = "",
        plot.title = element_text(color = "navy", size = 25),
        plot.subtitle = element_text(color = "navy", size = 15))

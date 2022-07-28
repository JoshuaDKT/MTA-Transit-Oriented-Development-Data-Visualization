# load packages

library(ggplot2)
library(tidyverse)
library(scales)

# disable scientific notation

options(scipen = 999)

# Create scatterplot of Station.Type and Track.Crossing

ggplot(filter(MTAdata, !is.na(Station.Type) & !is.na(Track.Crossing)),
       aes(factor(Station.Type), factor(Track.Crossing))) +
  geom_jitter(aes(color = factor(Modes.Served)), width = 0.2, height = 0.2) +
  labs(title = "MTA Station Classifications", x = "Station Type",
       y = "Track Crossing", subtitle = "Joshua Soriano") +
  scale_color_discrete(name = "Modes Served") +
  theme(axis.title.x = element_text(color = "royalblue4", size = 20),
        axis.title.y = element_text(color = "plum4", size = 20),
        axis.text.x = element_text(color = "turquoise4", size = 15),
        axis.text.y = element_text(color = "gold4", size = 12, angle = 45),
        legend.title = element_text(color = "magenta4", size = 20),
        legend.text = element_text(size = 15),
        plot.title = element_text(color = "navyblue", size = 25),
        plot.subtitle = element_text(color = "navyblue", size = 15))

# load packages

library(ggplot2)
library(tidyverse)

# Disable scientific notation

options(scipen=999)

# Create base plot

MTAbarplot <- ggplot(MTAdata, aes(Rail.Lines.Served))

# Bar graph for rail lines served

MTAbarplot + 
  geom_bar(filter(MTAdata, !is.na(Rail.Lines.Served)), stat = "count", 
           mapping = aes(fill = Rail.Lines.Served), color = "black") +
  scale_x_discrete(guide = guide_axis(n.dodge = 3)) +
  labs(title = "Rail Lines Served", x = "Rail Line", y = "Lines Served",
       subtitle = "Joshua Soriano") +
  scale_fill_discrete(name = "Rail Line") +
  theme(axis.title.x = element_text(color = "navyblue", size = 20),
        axis.title.y = element_text(color = "firebrick", size = 20),
        axis.text.x = element_text(color = "violetred4", size = 12),
        axis.text.y = element_text(color = "violetred4", size = 15),
        legend.title = element_text(color = "navyblue", size = 20),
        legend.text = element_text(size = 10),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        plot.title = element_text(color = "blueviolet", size = 25),
        plot.subtitle = element_text(color = "blueviolet", size = 15))

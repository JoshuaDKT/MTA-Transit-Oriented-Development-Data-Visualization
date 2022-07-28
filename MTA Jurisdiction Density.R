# load packages

library(ggplot2)
library(tidyverse)

# Create Base Plot

MTAdensplot <- ggplot(filter(MTAdata, !is.na(Jurisdiction)), aes(Station.ID, 
                                   after_stat(count),
                                   fill = Jurisdiction))

# Create Density Plot

MTAdensplot + 
  geom_density(position = "fill") +
  labs(x = "Station ID", y = "Jurisdiction Density", 
       title = "MTA Jurisdiction Density", subtitle = "Joshua Soriano") +
  theme(axis.title.x = element_text(size = 20, color = "darkorange4"),
        axis.title.y = element_text(size = 20, color = "navyblue"),
        axis.text.x = element_text(size = 15, color = "darkgoldenrod"),
        axis.text.y = element_text(size = 15, color = "firebrick4"),
        legend.title = element_text(size = 20, color = "yellow4"),
        legend.text = element_text(size = 15, color = "darkgoldenrod"),
        plot.title = element_text(size = 25, color = "dodgerblue4"),
        plot.subtitle = element_text(size = 15, color = "dodgerblue4"))

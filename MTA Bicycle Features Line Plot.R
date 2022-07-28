# load packages

library(ggplot2)
library(tidyverse)
library(scales)
library(reshape2)

# Disable scientific notation

options(scipen = 999)

# Melt data for multicolumn plotting

MTAbikedf <- 
  data.frame(Station_ID = MTAdata$Station.ID,
                        MTAdata$Number.of.Bicycle.Racks,
                        MTAdata$Number.of.Bicycle.Lockers,
                        MTAdata$Number.of.Bicycle.Lockers.Occupied) %>%
  melt(id.vars = "Station_ID", variable_name = "series")

# Create line plot of bicycle features at MTA Stations

ggplot(filter(MTAbikedf, !is.na(value)), 
       aes(Station_ID, value, color = variable)) +
  geom_line(size = 1) +
  scale_color_discrete(name = "Feature", 
                       labels = c("Number of Bicycle Racks",
                                  "Number of Bicycle Lockers",
                                  "Number of Bicycle Lockers Occupied")) +
  scale_x_continuous(breaks = seq(0, 100, 5)) +
  scale_y_continuous(breaks = seq(0, 100, 5)) +
  labs(title = "MTA Bicycle Features Line Plot", x = "Station ID", y = "Count",
       subtitle = "Joshua Soriano") +
  theme(axis.title.x = element_text(size = 20, color = "navy"),
        axis.text.x = element_text(size = 15, color = "cyan4"),
        axis.title.y = element_text(size = 20, color = "violetred"),
        axis.text.y = element_text(size = 15, color = "gold3"),
        legend.title = element_text(size = 20, color = "deepskyblue4"),
        legend.text = element_text(size = 15, color = "darkorchid4"),
        plot.title = element_text(size = 25, color = "maroon4"),
        plot.subtitle = element_text(size = 15, color = "maroon4"))

ggplot(MTAdata, aes(Station.ID)) +
  geom_line(aes(y = Number.of.Bicycle.Racks))

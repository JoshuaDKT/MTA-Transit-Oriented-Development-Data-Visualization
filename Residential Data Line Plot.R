# load packages

library(scales)
library(ggplot2)
library(tidyverse)
library(reshape2)

# disable scientific notation

options(scipen = 999)

# Melt data for multicolumn plotting

MTAresdf <- data.frame(Station_ID = MTAdata$Station.ID,
                       MTAdata$Residential.Alterations..units.,
                       MTAdata$Residentail.Alterations..permits.,
                       MTAdata$Residential.New.Construction..units.,
                       MTAdata$Residential.New.Construction..permits.) %>%
  melt(id.vars = "Station_ID", variable.name = "series")

# Create plot for residential data

ggplot(MTAresdf, aes(Station_ID, value, color = series)) +
  geom_line(size = 1) +
  scale_x_continuous(breaks = seq(0, 100, 5), ) +
  scale_y_continuous(breaks = seq(0, 9000, 100)) +
  scale_color_discrete(name = "Residential Data Type", 
                   labels = c("Residential Alterations Units",
                              "Residential Alterations Permits",
                              "New Construction Units",
                              "New Construction Permits")) +
  labs(title = "Residential Data Line Plot", x = "Station ID", y = "Value",
       subtitle = "Joshua Soriano") +
  theme(axis.title.x = element_text(color = "steelblue4", size = 20),
        axis.text.x = element_text(color = "darkorchid4", size = 15),
        axis.title.y = element_text(color = "turquoise4", size = 20),
        axis.text.y = element_text(color = "aquamarine4", size = 15),
        legend.title = element_text(color = "indianred4", size = 20),
        legend.text = element_text(color = "violetred4", size = 15),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        plot.title = element_text(color = "royalblue4", size = 20),
        plot.subtitle = element_text(color = "royalblue4", size = 15))

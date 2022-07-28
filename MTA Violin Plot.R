# load packages

library(ggplot2)
library(tidyverse)
library(scales)

# disable scientific notation

options(scipen = 999)

# Create violin plot for TOD place type population density

ggplot(filter(MTAdata, !is.na(TOD.Place.Type)), 
       aes(factor(TOD.Place.Type), Area_Population_2010)) +
  geom_violin(aes(fill = factor(TOD.Place.Type))) +
  scale_y_continuous(labels = comma, breaks = seq(0, 800000, 50000)) +
  labs(title = "Population Density For TOD Place Type", 
       subtitle = "Joshua Soriano", x = "TOD Place Type", 
       y = "Area Population 2010", 
       caption = "TOD = Transit-Oriented Development") +
  scale_fill_discrete(name = "TOD Place Type") +
  theme(axis.title.x = element_text(color = "indianred3", size = 20),
        axis.title.y = element_text(color = "darkblue", size = 20),
        axis.text.x = element_text(color = "cyan4", size = 15),
        axis.text.y = element_text(color = "maroon4", size = 15),
        legend.title = element_text(color = "indianred3", size = 20),
        legend.text = element_text(size = 15),
        legend.position = "",
        plot.title = element_text(color = "slateblue4", size = 25),
        plot.subtitle = element_text(color = "slateblue4", size = 15))

# Create violin plot for Station Type Population Density

ggplot(filter(MTAdata, !is.na(Station.Type) & 
                Station.Type != "Urban Neighborhood"), 
              aes(factor(Station.Type), Area_Population_2010)) +
  geom_violin(aes(fill = Station.Type)) +
  labs(x = "Station Type", y = "2010 Area Population", 
       title = "2010 Area Population Based On Station Type",
       subtitle = "Joshua Soriano") +
  scale_fill_discrete(name = "Station Type") +
  scale_y_continuous(labels = comma, breaks = seq(0, 800000, 50000)) +
  theme(axis.title.x = element_text(size = 20, color = "royalblue3"),
        axis.title.y = element_text(size = 20, color = "gold3"),
        axis.text.x = element_text(size = 15, color = "plum3"),
        axis.text.y = element_text(size = 15, color = "aquamarine4"),
        legend.position = "",
        plot.title = element_text(size = 25, color = "turquoise4"),
        plot.subtitle = element_text(size = 15, color = "turquoise4"))

# Create violin plot for Station.Type and Track.Crossing

ggplot(filter(MTAdata, !is.na(Station.Type) & !is.na(Track.Crossing)), 
              aes(factor(Track.Crossing), Area_Population_2010)) +
  geom_violin(aes(fill = Track.Crossing), 
              draw_quantiles = c(0, 0.25, 0.5, 0.75)) +
  scale_y_continuous(labels = comma, breaks = seq(0, 600000, 100000)) +
  scale_x_discrete(guide = guide_axis(n.dodge = 3)) +
  scale_fill_discrete(name = "Track Crossing") +
  labs(title = "Area Population Based On Track Crossing", x = " Track Crossing",
       y = "Area Population 2010", subtitle = "Joshua Soriano") +
  theme(axis.title.x = element_text(color = "lightseagreen", size = 20),
        axis.title.y = element_text(color = "springgreen3", size = 20),
        axis.text.x = element_text(color = "cyan4", size = 15),
        axis.text.y = element_text(color = "dodgerblue", size = 15),
        legend.title = element_text(color = "lightseagreen", size = 20),
        legend.text = element_text(color = "cyan4", size = 15),
        plot.title = element_text(color = "khaki4", size = 25))

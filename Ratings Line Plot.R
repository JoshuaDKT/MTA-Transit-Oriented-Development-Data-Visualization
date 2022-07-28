# load packages

library(ggplot2)
library(tidyverse)
library(reshape2)

# Disable scientific notation

options(scipen=999)

# Create data frame for MTA

MTAdf <- data.frame(Station_ID = MTAdata$Station.ID,
                          MTAdata$Transit.Score,
                          MTAdata$Station.Facility.Score,
                          MTAdata$Parking.Score,
                          MTAdata$Bike.Access.Score,
                          MTAdata$Ped.Access.Score,
                          MTAdata$TOD.Zoning.Score,
                          MTAdata$Development.Market)

MTAdf <- melt(MTAdf,  id.vars = 'Station_ID', variable.name = 'series')

# Line Plot For Ratings

ggplot(MTAdf, aes(Station_ID, value)) +
  geom_smooth(aes(color = series), se = F, method = 'loess', 
              formula = 'y ~ x') +
  labs(title = "MTA Ratings Line Graph", x = "Station ID Number",
       y = "Rating", subtitle = "Joshua Soriano") +
  scale_color_manual(name = "Station Name", 
                     labels = c("Transit Score", "Station Facility Score",
                                 "Parking Score", "Bike Access Score",
                                 "Pedestrian Access Score", "TOD Zoning Score",
                                 "Development Market"),
                     values = c("Blue", "Red", "Green", "Purple", "Orange",
                                "Cyan4", "Plum")) +
  scale_x_continuous(breaks = seq(0, 100, 5)) +
  scale_y_continuous(breaks = seq(0, 5, 1), limits = c(0, 5)) +
  theme(axis.title.x = element_text(color = "royalblue4", size = 20),
        axis.title.y = element_text(color = "turquoise3", size = 20),
        axis.text.x = element_text(color = "hotpink4", size = 15),
        axis.text.y = element_text(color = "deepskyblue3", size = 15),
        legend.title = element_text(color = "royalblue4", size = 20),
        legend.text = element_text(color = "indianred4", size = 15),
        plot.title = element_text(color = "seagreen4", size = 25),
        plot.subtitle = element_text(color = "seagreen3", size = 15))

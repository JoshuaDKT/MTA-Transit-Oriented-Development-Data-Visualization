# load packages

library(ggplot2)
library(tidyverse)
library(scales)
library(reshape2)

# disable scientific notation

options(scipen = 999)

# Create data frame for MTAdata including only features

MTAfeaturedf <- 
  data.frame(Station_ID = MTAdata$Station.ID, 
             (MTAdata[,c("Schedule.Information", "Route.Information", 
                         "Ticket.Booth.Machine", "Shelter", "Benches", 
                         "Public.Restrooms", "Public.Phones", "Parking.Fee")])) %>%
  melt(id.vars = "Station_ID", variable.name = "series")

# Create bar plot for MTA features

ggplot(filter(MTAfeaturedf, value == "Yes"), aes(series, fill = series)) +
  geom_bar(color = "black") +
  labs(title = "MTA Feature Bar Graph", x = "Feature", y = "Count",
       subtitle = "Joshua Soriano") +
  scale_x_discrete(guide = guide_axis(n.dodge = 3), 
                   labels = c("Schedule Information", "Route Information", 
                              "Ticket Booth Machine", "Shelter", "Benches",
                              "Public Restrooms", "Public Phones", 
                              "Parking Fee")) +
  scale_y_continuous(breaks = seq(0, 80, 5)) +
  theme(axis.title.x = element_text(size = 20, color = "navy"),
        axis.text.x = element_text(size = 15, color = "purple4"),
        axis.title.y = element_text(size = 20, color = "goldenrod4"),
        axis.text.y = element_text(size = 15, color = "cyan4"),
        legend.position = "None",
        plot.title = element_text(size = 25, color = "orchid4"),
        plot.subtitle = element_text(size = 15, color = "darkslateblue"))

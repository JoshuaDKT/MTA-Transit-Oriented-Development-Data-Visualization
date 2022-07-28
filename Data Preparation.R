# load packages

library(tidyverse)

# Import Data

MTAdata <- read.csv("MTA_Transit_Oriented_Development__TOD__Data.csv", 
                    na.strings = c(""))
MTAexpdata <- read.csv("MTA_Transit_Oriented_Development__TOD__Data.csv", 
                       na.strings = c(""))

# Rename Columns

colnames(MTAdata)[7] <- "Area_Population_2010"

# Order data by Station.ID

MTAdata <- MTAdata[order(MTAdata$Station.ID),]

# Median Imputation For Numeric Values

MTAdata[is.na(MTAdata$Vehicles.Parked..2010.), "Vehicles.Parked..2010."] <- 
  median(MTAdata$Vehicles.Parked..2010., na.rm = T)

MTAdata[is.na(MTAdata$Vehicles.Parked..2014.), "Vehicles.Parked..2014."] <- 
  median(MTAdata$Vehicles.Parked..2014., na.rm = T)

MTAdata[,sapply(MTAdata, is.numeric)] <- lapply(MTAdata[,sapply(MTAdata, is.numeric)], 
                                        function(x){
                                          x <- ifelse(is.na(x), median(x, na.rm  = TRUE), x)
                                        }
)

# Default Value Imputation For MTA Features

MTAdata[!complete.cases(MTAdata[,c(42:48, 50, 66)]),c(42:48, 50, 66)] <- "No"

# Remove empty columns

empty_columns <- colSums(is.na(MTAdata) | MTAdata == "") == nrow(MTAdata)

MTAdata <- MTAdata[, !empty_columns]

# Replace "N/A" with NA

MTAdata$Type.of.Bicycle.Racks <- gsub("N/A", NA, MTAdata$Type.of.Bicycle.Racks)

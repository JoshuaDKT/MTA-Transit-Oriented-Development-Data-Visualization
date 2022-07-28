nrow(MTAdata)
ncol(MTAdata)
head(MTAdata)
tail(MTAdata)
str(MTAdata)

a <- c("4", "4", "6", "7", "8")
a
typeof(a)
b <- as.numeric(a)

z <- factor(c("4", "4", "6", "7", "8"))
z

y <- as.numeric(z)
y

x <- as.numeric(as.character(a))
x
typeof(x)

str(MTAexpdata)
MTAexpdata$Station <- factor(MTAexpdata$Station)
typeof(MTAexpdata$Station)

# factor to non factor

MTAexpdata$Area.Population..2010. <- factor(MTAexpdata$Area.Population..2010.)
str(MTAexpdata)

# dont factor into as.numeric()
# dont factor into as.numeric()
# dont factor into as.numeric()

?sub
MTAexpdata$Rail.Lines.Served <- gsub("WMATA", "Big Chungus", MTAexpdata$Rail.Lines.Served)
str(MTAexpdata)

MTAexpdata$TOD.Place.Type <- sub(NA, "Unknown", MTAexpdata$TOD.Place.Type)

MTAexpdata$Station.ID <- gsub("", "$", MTAexpdata$Station.ID)

MTAexpdata$Station.ID <- gsub("\\$", "", MTAexpdata$Station.ID)

MTAexpdata$Area.Population..2010. <- gsub("", "%", 
                                          MTAexpdata$Area.Population..2010.)
MTAexpdata$Area.Population..2010. <- gsub("%", "", MTAexpdata$Area.Population..2010.)

# replace all empty cells with NA values

MTAexpdata$Rail.Lines.Served <- gsub("", NA, MTAexpdata$Rail.Lines.Served)

complete.cases(MTAexpdata)

MTAexpdata[!complete.cases(MTAexpdata),]

# Geom_area

# Generate data
huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
h <- ggplot(huron, aes(year))

h + geom_ribbon(aes(ymin=0, ymax=level))
h + geom_area(aes(y = level))

h + geom_area(aes(x = level, y = year), orientation = "y")

h +
  geom_ribbon(aes(ymin = level - 1, ymax = level + 1), fill = "grey70") +
  geom_line(aes(y = level))

# ----------------------------------Geom_Density

ggplot(diamonds, aes(carat)) +
  geom_density()
# Map the values to y to flip the orientation
ggplot(diamonds, aes(y = carat)) +
  geom_density()

ggplot(diamonds, aes(carat)) +
  geom_density(adjust = 1/5)
ggplot(diamonds, aes(carat)) +
  geom_density(adjust = 5)

ggplot(diamonds, aes(depth, colour = cut)) +
  geom_density() +
  xlim(55, 70)
ggplot(diamonds, aes(depth, fill = cut, colour = cut)) +
  geom_density(alpha = 0.1) +
  xlim(55, 70)


# Stacked density plots: if you want to create a stacked density plot, you
# probably want to 'count' (density * n) variable instead of the default
# density

# Loses marginal densities
ggplot(diamonds, aes(carat, fill = cut)) +
  geom_density(position = "stack")
# Preserves marginal densities
ggplot(diamonds, aes(carat, after_stat(count), fill = cut)) +
  geom_density(position = "stack")

# You can use position="fill" to produce a conditional density estimate
ggplot(diamonds, aes(carat, after_stat(count), fill = cut)) +
  geom_density(position = "fill")

# --------------------------------geom_violin

p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_violin()

# Orientation follows the discrete axis
ggplot(mtcars, aes(mpg, factor(cyl))) +
  geom_violin()


p + geom_violin() + geom_jitter(height = 0, width = 0.1)

# Scale maximum width proportional to sample size:
p + geom_violin(scale = "count")

# Scale maximum width to 1 for all violins:
p + geom_violin(scale = "width")

# Default is to trim violins to the range of the data. To disable:
p + geom_violin(trim = FALSE)

# Use a smaller bandwidth for closer density fit (default is 1).
p + geom_violin(adjust = .5)

# Add aesthetic mappings
# Note that violins are automatically dodged when any aesthetic is
# a factor
p + geom_violin(aes(fill = cyl))
p + geom_violin(aes(fill = factor(cyl)))
p + geom_violin(aes(fill = factor(vs)))
p + geom_violin(aes(fill = factor(am)))

# Set aesthetics to fixed value
p + geom_violin(fill = "grey80", colour = "#3366FF")

# Show quartiles
p + geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))

# Scales vs. coordinate transforms -------
if (require("ggplot2movies")) {
  # Scale transformations occur before the density statistics are computed.
  # Coordinate transformations occur afterwards.  Observe the effect on the
  # number of outliers.
  m <- ggplot(movies, aes(y = votes, x = rating, group = cut_width(rating, 0.5)))
  m + geom_violin()
  m +
    geom_violin() +
    scale_y_log10()
  m +
    geom_violin() +
    coord_trans(y = "log10")
  m +
    geom_violin() +
    scale_y_log10() + coord_trans(y = "log10")
  
  # Violin plots with continuous x:
  # Use the group aesthetic to group observations in violins
  ggplot(movies, aes(year, budget)) +
    geom_violin()
  ggplot(movies, aes(year, budget)) +
    geom_violin(aes(group = cut_width(year, 10)), scale = "width")
}

# Reference Code For plotting multiple columns

ggplot(MTAdata[,c(42:48, 50, 66)], aes(stat = "count")) +
  geom_bar(aes(x = MTAdata[,42]))

MTAdf <- data.frame(Station_ID = MTAdata$Station.ID,
                    MTAdata$Transit.Score,
                    MTAdata$Station.Facility.Score,
                    MTAdata$Parking.Score,
                    MTAdata$Bike.Access.Score,
                    MTAdata$Ped.Access.Score,
                    MTAdata$TOD.Zoning.Score,
                    MTAdata$Development.Market)

MTAdf <- melt(MTAdf,  id.vars = 'Station_ID', variable.name = 'series')


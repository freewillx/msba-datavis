library(ggplot2)
library(ggthemes)
library(scales)

# Exercise F
hiv <- read.csv("./data/pakistan.childHIV.csv")
sa <- read.csv("./data/southasia.csv")

# A bar graph representing children with HIV in Pakistan from 2001 to 2013
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  scale_x_continuous(breaks = seq(2001,2013, 1)) +
  ylab ("Children Living with HIV (Ages 0-14)")

# A histogram representing children with HIV in Pakistan from 2001 to 2013
ggplot(hiv, aes(childHIV)) +
  geom_histogram(stat = "bin", binwidth = 75) +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  scale_x_continuous(breaks = seq(2001,2013, 1)) +
  xlab ("Children Living with HIV (Ages 0-14)") +
  ylab("Frequency")

# A line graph representing the trend of children with HIV in Pakistan from 2001 to 2013
ggplot(hiv, aes(Year, childHIV)) +
  geom_line() +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  scale_x_continuous(breaks = seq(2001,2013, 1)) +
  ylab ("Children Living with HIV (Ages 0-14)")

# A pint graph representing the trend of children with HIV in Pakistan from 2001 to 2013
ggplot(hiv, aes(Year, childHIV)) +
  geom_point() +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  scale_x_continuous(breaks = seq(2001,2013, 1)) +
  ylab ("Children Living with HIV (Ages 0-14)")

# Density plot of life expectancy at birth to indicate the number of years a newborn infant would live
ggplot(data=sa[9:16, 1:2], aes(Life.expectancy)) + 
  geom_density(kernel= "gaussian") + 
  xlab("Life expectancy at birth, total(years) in 2013")

# Box plot of life expectancy at birth to indicate the number of years a newborn infant would live
ggplot(data=sa[1:16, 5:6], aes(Year, Southasia.life.expectancy.avg)) + 
  geom_boxplot() +  labs(title= "Life Expectancy in Developing South Asian Countries", x = NULL, y = "Life Expectancy")

# Cartesian Coordinate
ggplot(data=hiv, aes(childHIV)) + 
  geom_bar(binwidth=50) + xlab("Children Living with HIV (Ages 0-14)") + 
  coord_cartesian(xlim=c(-2000, 2000), ylim=c(-5, 5))

# Flipped Cartesian coordinates
ggplot(data=hiv, aes(childHIV)) + 
  geom_bar(binwidth=50) + xlab("Children Living with HIV (Ages 0-14)") + 
  coord_flip(xlim=c(-2000, 2000), ylim=c(-5, 5))

# Facet into columns
ggplot(data=sa[9:16, 1:4], aes(Out.of.pocket.health.expenditure, Infant.deaths)) + 
  geom_point() + facet_grid(.~Country) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  scale_y_continuous(labels=comma) + 
  labs(x = "Out of Pocket Health Expenditure (% of total expenditure on health)", y = "Number of Infant Deaths")

#Facet into rows 
ggplot(data=sa[9:16, 1:4], aes(Out.of.pocket.health.expenditure, Infant.deaths)) +  
  geom_point() + facet_grid(Country~.) + 
  scale_y_continuous(breaks=c(0, 500000, 1000000), labels=comma) + 
  labs(x = "Out of Pocket Health Expenditure (% of total expenditure on health)", y = "Number of Infant Deaths")

# Change bar graph fill color
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity", fill= "red") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)")

# Change point graph color scale to value
ggplot(hiv, aes(Year, childHIV)) +
  geom_point(aes(colour = Life.expectancy)) +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)")

# Change point graph size scale to value
ggplot(hiv, aes(Year, childHIV)) +
  geom_point(aes(size = Life.expectancy)) +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)")

# Apply classic theme
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)") +
  theme_classic()

# Apply black and white theme
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)") +
  theme_bw()

# Apply minimal theme
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)") +
  theme_minimal()

# Apply economist theme
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)") +
  theme_economist()

# Apply Tufte theme
ggplot(hiv, aes(Year, childHIV)) +
  geom_bar(stat="identity") +
  ggtitle("Children Living with HIV in Pakistan from 2001 to 2013") + 
  ylab ("Children Living with HIV (Ages 0-14)") +
  theme_tufte()
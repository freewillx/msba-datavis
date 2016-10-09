library(ggplot2)
library(ggthemes)
library(lattice)

## Exercise E

# China Internet Usage - source: world bank 2012
chinainternet <- read.csv("./data/chinainternet.csv")
summary(chinainternet)

ggplot(data=chinainternet, aes(x=Year, y=Internet.Usage)) +
  geom_line(size=3) +
  ggtitle("Internet Usage in China: 1990 to 2011") +
  labs(x="",y="Usage") +
  theme(panel.grid = element_blank(),
        panel.background=element_blank())

# China Export
chinaexports <- read.csv("./data/chinaexports.csv")
names(chinaexports) <- c("2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011")
summary(t(chinaexports))

# Wait for ggplot
Sys.sleep(0.5)
barplot(as.matrix(chinaexports), border = NA, space = 0.25, ylim = c(0,40),
        ylab = "% of GDP",
        main = "Exports of Goods and Services in China as % of GDP: 2000 to 2011")


# Exercise F - 20 world exporters
worldexports <- read.csv("./data/worldexports_transform.csv")
summary(worldexports)

# Remove outliers
worldexports.plot <- worldexports[worldexports$volume > 0,]
summary(worldexports.plot)

worldexports.plot$year <- as.character(worldexports.plot$year)

h <- histogram(~ volume | year, data = worldexports.plot, layout=c(4,4),
          scales=list(
            y=list(at=seq(20,60,20),labels=seq(20,60,20)),
            x=list(at=seq(0,120,40),labels=seq(0,120,40))
            ))

update(h, index.cond=list(c(1,14:16,5:2,9:6,13:10)))

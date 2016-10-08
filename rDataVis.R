library(ggplot2)
library(ggthemes)

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


library(ggplot2)
library(ggthemes)

# source: world bank 2012
chinainternet <- read.csv("./data/chinainternet.csv")
summary(chinainternet)

chinainternet <- chinainternet[-c(1:3),]

qplot(Year, Internet.Usage, data=chinainternet, geom="line", main="Internet Usage in China: 1990 to 2011", xlab="Year", ylab="Usage", stat="identity")

ggplot(data=chinainternet, aes(x=Year, y=Internet.Usage)) + geom_line() + theme_tufte()



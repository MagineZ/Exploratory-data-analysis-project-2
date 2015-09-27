setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI24510  <- NEI[NEI$fips=="24510", ]
PM25TotalByType <- aggregate(Emissions ~ year + type, NEI24510, sum)
png("plot3.png", width=640, height=480)
library(ggplot2)
g <- ggplot(PM25TotalByType, aes(year, Emissions, color = type))
g <- g + geom_line() +xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
plot(g)
dev.off()
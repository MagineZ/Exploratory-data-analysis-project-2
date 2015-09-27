setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI24510  <- NEI[NEI$fips=="24510", ]
PM25total <- aggregate(Emissions ~ year, NEI24510, sum)
png('plot2.png')
barplot(height=PM25total$Emissions, names.arg=PM25total$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
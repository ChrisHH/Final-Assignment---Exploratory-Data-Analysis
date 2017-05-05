setwd("/Users/cjaehn/Documents/Exploratory Data Analysis/Final Assignment")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

###Solution###
#Concept: calculate total emission for the US over the years via aggregate
##an plot the result.

totalemission<-aggregate(NEI$Emissions, sum, by=list(NEI$year) )
png(file="plot1.png")
barplot(height = totalemission$x,names.arg = totalemission$Group.1,xlab="Year",ylab="PM2.5 emitted (tons)",main="Development of total PM2.5 emitted (US)")
dev.off()
##Answer: decrease in PM2.5 emission over time

setwd("/Users/cjaehn/Documents/Exploratory Data Analysis/Final Assignment")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

###Solution###
#Concept: calculate total emission for Maryland over the years via aggregate
##an plot the result.


NEI_MD<-NEI[NEI$fips=="24510",]
totalemission_MD<-aggregate(NEI_MD$Emissions, sum, by=list(NEI_MD$year) )
png(file="plot2.png")
barplot(height = totalemission_MD$x,names.arg = totalemission_MD$Group.1,xlab="Year",ylab="PM2.5 emitted (tons)",main="Development of total PM2.5 emitted (MD)")
dev.off()
##Answer: alternating decrease
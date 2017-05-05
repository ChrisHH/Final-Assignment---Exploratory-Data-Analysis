setwd("/Users/cjaehn/Documents/Exploratory Data Analysis/Final Assignment")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999–2008?

coal<-SCC[grep("coal",SCC$Short.Name),]
Coal<-SCC[grep("Coal",SCC$Short.Name),]
coal<-rbind(coal,Coal)
coal<-unique(coal$SCC)
NEI_coal<-subset(NEI, NEI$SCC %in% coal)
totalemission<-aggregate(NEI_coal$Emissions, sum, by=list(NEI_coal$year) )
png(file="plot4.png")
barplot(height = totalemission$x,names.arg = totalemission$Group.1,xlab="Year",ylab="PM2.5 emitted (tons)",main="Development of coal combusted total PM2.5 emitted (US)")
dev.off()
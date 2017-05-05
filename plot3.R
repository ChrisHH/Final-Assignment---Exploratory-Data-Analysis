setwd("/Users/cjaehn/Documents/Exploratory Data Analysis/Final Assignment")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the 
#𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases 
#in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
NEI_MD<-NEI[NEI$fips=="24510",]

barplot<-ggplot(data=NEI_MD) + geom_bar(aes(x=as.factor(year),y=Emissions),stat = "identity") + facet_wrap(~type)
barplot<-barplot + ggtitle(expression('PM'[2.5]*' Emissions from various sources in Baltimore, MD (1999-2008)'))
barplot <- barplot + ylab(expression('Tons of PM'[2.5]))
barplot <- barplot + xlab('Years')
print(barplot)

png(file="plot3.png")
print(barplot)
dev.off()
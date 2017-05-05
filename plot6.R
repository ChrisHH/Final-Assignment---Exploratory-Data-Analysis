setwd("/Users/cjaehn/Documents/Exploratory Data Analysis/Final Assignment")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼
#𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?


mvehicles<-SCC[SCC$Data.Category==c("Onroad"),]
NEI_vehicles<-subset(NEI, NEI$SCC %in% mvehicles$SCC)

NEI_vehicles_LA<-NEI_vehicles[NEI_vehicles$fips=="06037",]
NEI_vehicles_BM<-NEI_vehicles[NEI_vehicles$fips=="24510",]

LA_agg<-aggregate(NEI_vehicles_LA$Emissions, sum, by=list(NEI_vehicles_LA$year))
BM_agg<-aggregate(NEI_vehicles_BM$Emissions, sum, by=list(NEI_vehicles_BM$year))

BM_agg$County <- "Baltimore"
LA_agg$County <- "Los Angeles"

agg<-rbind(BM_agg,LA_agg)


library(ggplot2)
png("plot6.png")
ggplot(agg, aes(x=factor(Group.1), y=x)) +
  geom_bar(stat="identity") + 
  facet_grid(County  ~ ., scales="free") +
  ylab("total emissions (tons)") + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission BM and LA"))
dev.off()
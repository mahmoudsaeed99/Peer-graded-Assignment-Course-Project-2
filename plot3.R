library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[which(NEI$fips=="24510"),]

getNewData <-  aggregate(NEI$Emissions, by=list(NEI$type,NEI$year), FUN=sum)

names(getNewData) <- c("Type" ,"Year" , "TotalEmission")


qplot(Year , TotalEmission , data = getNewData  , color = getNewData$Type , main = "Baltimore City")+geom_smooth()

dev.copy(png , file = "plot3.png")
dev.off()


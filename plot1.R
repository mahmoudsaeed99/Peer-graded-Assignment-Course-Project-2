NEI <- readRDS("summarySCC_PM25.rds")

##get sum of Emission by year
getNewData <-  aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)

names(getNewData) <- c("Year" , "TotalEmission")

##dataSummary <- summary(getNewData$TotalEmission)

plot(getNewData$Year , getNewData$TotalEmission ,main = "US" ,  type = "l"  , xlab = "Year" , ylab = "Emission",
     col = "blue")

dev.copy(png , file = "plot1.png")
dev.off()




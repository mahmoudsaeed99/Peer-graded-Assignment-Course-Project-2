NEI <- readRDS("summarySCC_PM25.rds")

NEI <- NEI[which(NEI$fips=="24510"),]

getNewData <-  aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)

names(getNewData) <- c("Year" , "TotalEmission")


plot(getNewData$Year , getNewData$TotalEmission ,main = "US" ,  type = "l"  , xlab = "Year" , ylab = "Emission",
     col = "blue")



dev.copy(png , file = "plot2.png")
dev.off()
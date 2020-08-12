library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

mergeData <- merge(NEI, SCC, by="SCC")

coal  <- grepl("coal", mergeData$Short.Name, ignore.case=TRUE)
getNewData <- mergeData[coal, ]

getNewData <- aggregate(Emissions ~ year, getNewData, sum)


g <- ggplot(getNewData, aes(factor(year), Emissions))+ geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("TotalEmissions")) +
  ggtitle('Total Emissions from coal sources (1999 to 2008)')
print(g)

dev.copy(png , file = "plot4.png")
dev.off()


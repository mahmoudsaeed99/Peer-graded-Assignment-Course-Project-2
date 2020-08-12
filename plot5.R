library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")


subNEI <- NEI[which(NEI$fips=="24510" & NEI$type=="ON-ROAD"),]

subNEI <-  aggregate(Emissions ~ year, subNEI, FUN=sum)


g <- ggplot(subNEI, aes(factor(year), Emissions))+ geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("TotalEmissions")) +
  ggtitle('motor vehicle sources changed from 1999-2008 in Baltimore City')
print(g)

dev.copy(png , file = "plot5.png")
dev.off()



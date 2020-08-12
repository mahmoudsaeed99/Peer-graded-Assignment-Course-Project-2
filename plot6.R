library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

names(sub1NEI)

sub1NEI <- NEI[which((NEI$fips=="24510" |NEI$fips=="06037")& NEI$type=="ON-ROAD"),]

sub1NEI <-  aggregate(Emissions ~ year  + fips, sub1NEI, FUN=sum)

sub1NEI$fips[sub1NEI$fips=="24510"] <- "Baltimore, MD"
sub1NEI$fips[sub1NEI$fips=="06037"] <- "Los Angeles, CA"

g <- ggplot(sub1NEI, aes(factor(year), Emissions)) +
  facet_grid(. ~ sub1NEI$fips)+geom_bar(stat="identity")+ xlab("year") +
  ylab(expression("TotalEmissions")) +
  ggtitle('motor vehicle sources changed from 1999-2008 in Baltimore City vs motor vehicle sources changed from 1999-2008 in Angeles County City')

print(g)
dev.copy(png , file = "plot6.png")
dev.off()


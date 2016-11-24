# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Aggregate total emissions from motor vehicles in Baltimore
Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
Baltimore$year <- factor(Baltimore$year, levels = c('1999', '2002', '2005', '2008'))
BaltimorePM2.5 <- cbind(aggregate(Baltimore[, "Emissions"], by = list(Baltimore$year), sum), City = "Baltimore")
colnames(BaltimorePM2.5) <- c("year", "Emissions", "City")

# Aggregate total emissions from motor vehicles in Los Angeles
LosAng <- subset(NEI, fips == "06037" & type == "ON-ROAD")
LosAng$year <- factor(LosAng$year, levels = c('1999', '2002', '2005', '2008'))
LosAngPM2.5 <- cbind(aggregate(LosAng[, "Emissions"], by = list(LosAng$year), sum), City = "Los Angeles")
colnames(LosAngPM2.5) <- c("year", "Emissions", "City")

BaltLA <- rbind.data.frame (BaltimorePM2.5, LosAngPM2.5)

# Plot bar chart for comparison 
ggplot(BaltLA, aes(year, Emissions)) + geom_bar(aes(fill = year), stat = "identity") + facet_grid(. ~ City) + 
    ggtitle("Total Emissions from motor vehicles in Baltimore and in Los Angeles") + 
    ylab(expression("Emissions of PM"[2.5]* " (in tons)")) + xlab("Year") + 
    geom_text(aes(label=round(Emissions), size = 2, hjust = 1, vjust = -1)

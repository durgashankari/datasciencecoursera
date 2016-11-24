# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Aggregate total emissions from motor vehicles in Baltimore
Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
Baltimore$year <- factor(Baltimore$year, levels = c('1999', '2002', '2005', '2008'))
BaltimorePM2.5 <- aggregate(Baltimore[, "Emissions"], by = list(Baltimore$year), sum)
colnames(BaltimorePM2.5) <- c("year", "Emissions")

# Create barplot
ggplot(BaltimorePM2.5, aes(x = year, y = Emissions)) + geom_bar(aes(fill=year), stat="identity") +  
  ylab(expression("Emissions of PM"[2.5]* " (in tons)")) + xlab("Year") + 
  ggtitle("Total Emissions of Motor Vehicles in Baltimore") +
  geom_text(aes(label = round(Emissions), size = 3, hjust = 1, vjust = 0))
  

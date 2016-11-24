# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Merge coal related SCC and NEI data set
SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
CoalEmission <- merge(NEI, SCC.coal, by = "SCC")
# Aggregate total emissions from coal-related combustion, convert from tons to kilotons
CoalEmissionPM2.5 <- aggregate(CoalEmission[, "Emissions"]/1000, by = list(CoalEmission$year), sum)
colnames(CoalEmissionPM2.5) <- c("year", "Emissions"

# Create line plot
ggplot(CoalEmissionPM2.5, aes(x = year, y = Emissions)) + 
  geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 1, col = Emissions)) + 
  ylab(expression("Emissions of PM"[2.5]* " (in kilotons)")) + xlab("Year") +
  ggtitle("Total emissions from Coal Combustion (1999-2008)")

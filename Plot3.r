# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.

require(ggplot2)

Baltimore <- subset(NEI, fips == "24510")
BaltimorePM2.5 <- aggregate(Baltimore[c("Emissions")], list(type = Baltimore$type, year = Baltimore$year), sum)

# Create line plot
qplot(year, Emissions, data = BaltimorePM2.5, color = type, geom = "path", xlab = "Year", 
    ylab = expression("Emissions of PM"[2.5]* " (in tons)"), 
    main = expression("Total emissions from PM"[2.5]* " in Baltimore City, MD (1999-2008)")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Aggregate total emissions in Baltimore, convert from tons to kilotons
Baltimore <- subset(NEI, fips == "24510")
BaltimorePM2.5 <- tapply((Baltimore$Emissions)/1000, Baltimore$year, sum)

# Plot the bar chart
barplot(BaltimorePM2.5, xlab = "Year", ylab = expression("Emissions of PM"[2.5]* " (in kilotons)"), 
    main = expression("Total emissions from PM"[2.5]* " in Baltimore City, MD (1999-2008)"), 
    col = c("red", "blue", "grey", "green"))

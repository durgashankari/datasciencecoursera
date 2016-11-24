# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate total emissions from PM2.5, convert from tons to kilotons
attach(NEI)

EmissionsPM2.5 <- tapply((Emissions)/1000,year,sum)

barplot(EmissionsPM2.5, xlab = "Year", ylab = expression("Emissions of PM"[2.5]* " (in kilotons)"), 
    main = expression("Total emissions from PM"[2.5]* " in US (1999-2008)"), col = c("red", "blue", "green", "grey") )

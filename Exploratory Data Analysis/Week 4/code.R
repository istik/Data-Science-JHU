library(ggplot2)
library(dplyr)

setwd("/Users/istiklinn/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_all_years <- tapply(NEI$Emissions,NEI$year,sum,na.rm = T)
total_all_years <- data.frame(year = names(total_all_years), total = total_all_years)
total_all_years$year <- as.character(total_all_years$year)
with(total_all_years, plot(year,total, type = "l" , xlim=c(1999,2008)))
axis(1,at=1999:2008,labels=1999:2008)
with(total_all_years, points(year,total))


sub_Baltimore <- subset(NEI, NEI$fips == "24510")
Baltimore_all_yeas <- with(sub_Baltimore,tapply(Emissions,year,sum,na.rm=T))
Baltimore_all_yeas <- data.frame(year = names(Baltimore_all_yeas), total = Baltimore_all_yeas)
Baltimore_all_yeas$year <- as.character(Baltimore_all_yeas$year)
with(Baltimore_all_yeas, plot(year,total, type = "l" , xlim=c(1999,2008)))
axis(1,at=1999:2008,labels=1999:2008)
with(Baltimore_all_yeas, points(year,total))


Baltimore_all_yeas_by_type <- aggregate(Emissions ~ year + type,data = sub_Baltimore, sum, na.rm= T)
ggplot(Baltimore_all_yeas_by_type,aes(x = year, y = Emissions, group = type, colour = type)) + geom_line()


coal_related_code  <- SCC[grep("Coal",SCC$Short.Name),]
coal_related_emissions <- NEI %>% filter(SCC %in% coal_related_code$SCC) 
coal_related_emissions <- aggregate(Emissions ~ year,data = coal_related_emissions, sum, na.rm = T)
ggplot(coal_related_emissions,aes(x = year, y = Emissions)) + geom_line() +geom_point(size=4)


motor_vehicles_code <- SCC[grep("vehicle",SCC$SCC.Level.Two, ignore.case = T),]
Baltimore_motor <- subset(sub_Baltimore, sub_Baltimore$SCC %in% motor_vehicles_code$SCC)
Baltimore_motor <- aggregate(Emissions ~ year,data = Baltimore_motor, sum, na.rm = T)
ggplot(Baltimore_motor,aes(x = year, y = Emissions)) + geom_line() + geom_point(size=4)


los_angeles_motor <- subset(NEI, NEI$fips == "06037" & NEI$SCC %in% motor_vehicles_code$SCC)
los_angeles_motor <- aggregate(Emissions ~ year,data = los_angeles_motor, sum, na.rm = T)
motor_two_cities <- rbind(data.frame(city = "Baltimore", Baltimore_motor),data.frame(city = "Los Angeles",los_angeles_motor))
ggplot(motor_two_cities,aes(x = year, y = Emissions, group = city,color = city)) + geom_line() +geom_point(size=4)



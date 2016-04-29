readLines("./household_power_consumption.txt",1)
mydata <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")
head(mydata)
mydata[,1] <- as.Date(mydata[,1],"%d/%m/%Y")
mydatawanted <- mydata[mydata$Date == "2007-02-01" | mydata$Date=="2007-02-02",]
mydatawanted[,3] <- as.numeric(as.character(mydatawanted1[,3]))


##When I use as.numeric to transform the "factor" to "numeric", 
##what I transformed really is that the level of factor, so what you should do is
##presume that your_dataset's class is "factor", here we refer the "Global_active_power" column
##
## as.numeric(as.character(your_dataset))


hist(mydatawanted$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, filenam="plot1.png", height=480, width=480, bg="white")
dev.off()

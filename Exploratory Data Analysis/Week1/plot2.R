## read in date/time info in format 'm/d/y h:m:s'
##dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
##times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
##x <- paste(dates, times)
##strptime(x, "%m/%d/%y %H:%M:%S")


dates <- mydatawanted$Date
times <- mydatawanted$Time
DataTime <- paste(dates,times)
MyDataTime <- strptime(DataTime,"%Y-%m-%d %H:%M:%S")
mydatawanted<-cbind(mydatawanted,MyDataTime)

dev.copy(png, filenam="plot1.png", height=480, width=480, bg="white")
dev.off()

## My system is in French so there are some different words:
## Jeu for Jeudi for Thu
## Ven for Vendredi for Fri
## Sam for Samedi for Sat



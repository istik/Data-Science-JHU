mydatawanted$Sub_metering_1 <- as.numeric(as.character(mydatawanted$Sub_metering_1)) 
mydatawanted$Sub_metering_2 <- as.numeric(as.character(mydatawanted$Sub_metering_2)) 
mydatawanted$Sub_metering_3 <- as.numeric(as.character(mydatawanted$Sub_metering_3)) 


png(filename='./plot3.png',width=480,height=480,units='px')

with(mydatawanted,plot(MyDataTime,Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering",col="black"))
with(mydatawanted,lines(MyDataTime,Sub_metering_2,col="red"))
with(mydatawanted,lines(MyDataTime,Sub_metering_3,col="blue"))

mylegend <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
mycolor <- c('black','red','blue')
legend("topright",legend=mylegend,col=mycolor,lty="solid")

dev.off()


## My system is in French so there are some differences:
## Jeu for Jeudi for Thu
## Ven for Vendredi for Fri
## Sam for Samedi for Sat
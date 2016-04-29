mydatawanted$Voltage <- as.numeric(as.character(mydatawanted$Voltage)) 
mydatawanted$Global_reactive_power <- as.numeric(as.character(mydatawanted$Global_reactive_power)) 

png(filename='./plot4.png',width=480,height=480,units='px')


par(mfrow=c(2,2))
with(mydatawanted,plot(MyDataTime,Global_active_power,type="l",xlab="",ylab = "Energy sub metering"))
with(mydatawanted,plot(MyDataTime,Voltage,type="l",xlab="datatime",ylab = "Voltage"))

with(mydatawanted,plot(MyDataTime,Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering",col="black"))
with(mydatawanted,lines(MyDataTime,Sub_metering_2,col="red"))
with(mydatawanted,lines(MyDataTime,Sub_metering_3,col="blue"))

mylegend <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
mycolor <- c('black','red','blue')
legend("topright",legend=mylegend,col=mycolor,lty="solid",bty="n")

with(mydatawanted,plot(MyDataTime,Global_reactive_power,type="l",xlab="datatime"))
dev.off()


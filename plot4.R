
#read data 
Data <- read.table("household_power_consumption.txt", sep = ";", header  = TRUE, na.strings = '?')
#subset data for two dates - 1st and 2nd of Feb 2007

Data1 <- subset(Data, Data$Date == "1/2/2007" |Data$Date == "2/2/2007")
rm(Data)
#combime date and time and change to as.POSIXct format
Data1$datetime <- paste(Data1$Date, Data1$Time, sep = " ")
Data1$datetime <- as.POSIXct(Data1$datetime, format = "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot1
plot(x = Data1$datetime
     , y = as.numeric(Data1$Global_active_power)
     , type="l", xlab="", ylab="Global Active Power")

#plot2
plot(x = Data1$datetime
     , y = as.numeric(Data1$Voltage)
     , type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(x = Data1$datetime, y = Data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(x = Data1$datetime, y = Data1$Sub_metering_2,col = "red")
lines(x = Data1$datetime, y = Data1$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(1,1,1),bty = "n", col=c("black","red","blue"))
#plot4
plot(x = Data1$datetime
     , y = as.numeric(Data1$Global_reactive_power)
     , type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
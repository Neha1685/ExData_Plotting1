
#read data 
Data <- read.table("household_power_consumption.txt", sep = ";", header  = TRUE, na.strings = '?')
#subset data for two dates - 1st and 2nd of Feb 2007

Data1 <- subset(Data, Data$Date == "1/2/2007" |Data$Date == "2/2/2007")
rm(Data)
#combime date and time and change to as.POSIXct format
Data1$datetime <- paste(Data1$Date, Data1$Time, sep = " ")
Data1$datetime <- as.POSIXct(Data1$datetime, format = "%d/%m/%Y %H:%M:%S")

#Plot line graph and save as plot2
png(file="plot2.png", width=480, height=480)
plot(x = Data1$datetime
     , y = as.numeric(Data1$Global_active_power)
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()




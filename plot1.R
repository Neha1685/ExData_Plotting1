
#read data 
Data <- read.table("household_power_consumption.txt", sep = ";", header  = TRUE, na.strings = '?')

#subset data for two dates - 1st and 2nd of Feb 2007
Data2 <- subset(Data, Data$Date == "1/2/2007" |Data$Date == "2/2/2007")
rm(Data)
#Plot histogram and save as plot1
png(file="plot1.png", width=480, height=480)
hist(as.numeric(Data2$Global_active_power),na.rm = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
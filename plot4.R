# reading the desired set of data
df <- read.table(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=TRUE, sep=';')

# convert data for x axis
x <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# openning graphics device, a png file
png(filename="plot4.png", width=480, height=480)

# creating the plots, a 2x2 matrix
par(mfrow=c(2,2))

# plot (1,1)
plot(x, df$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

#plot (1,2)
plot(x, df$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

#plot (2,1)
plot(x, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x, df$Sub_metering_2, col="red")
lines(x, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n")

#plot (2,2)
plot(x, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# closing the device
dev.off()


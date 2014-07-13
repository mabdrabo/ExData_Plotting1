# reading the desired set of data
df <- read.table(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=TRUE, sep=';')

# convert data for x axis
x <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# openning graphics device, a png file
png(filename="plot3.png", width=480, height=480)

# creating the plot
plot(x, df$Sub_metering_1, type="h", xlab="", ylab="Energy sub metering")
lines(x, df$Sub_metering_2, col='red')
lines(x, df$Sub_metering_3, col='blue')

# adding the label box
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

# closing the device
dev.off()
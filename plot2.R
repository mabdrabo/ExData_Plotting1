# reading the desired set of data
df <- read.table(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=TRUE, sep=';')

# convert data for x axis
x <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# openning graphics device, a png file
png(filename="plot2.png", width=480, height=480)

# creating a line plot
plot(x, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# closing the device
dev.off()
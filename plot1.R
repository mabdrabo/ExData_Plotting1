# reading the desired set of data
df <- read.table(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=TRUE, sep=';')

# openning graphics device, a png file
png(filename="plot1.png", width=480, height=480)

# creating the histogram
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# closing the device
dev.off()
# read data, not very elegant, but works the quickest
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = colNames)

# construct the plot
png(filename="plot1.png")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()

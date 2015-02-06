# read data: not very elegant, but the quickest
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = colNames)

# convert Date and Time to POSIXlt time
data$Date.Time <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# switch locale to English so that the labels are in English
# and save old locale
old_locale <-Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

#open png device
png(filename="plot4.png")

# setup plot layout
par(mfcol = c(2,2))

# plot 1
plot(data$Date.Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# plot 2
plot(data$Date.Time,data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(data$Date.Time,data$Sub_metering_2, col = "red")
lines(data$Date.Time,data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

# plot 3
plot(data$Date.Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 4
plot(data$Date.Time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

# reset locale
Sys.setlocale("LC_TIME", old_locale)


# read data; not very elegant, but the quickest
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = colNames)

# convert Date and Time to POSIXlt time
data$Date.Time <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# switch locale to English and save old locale so that the labels are in
# English
old_locale <-Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# construct the plot
png(filename="plot3.png")
plot(data$Date.Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date.Time, data$Sub_metering_2, col = "red")
lines(data$Date.Time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()

# reset locale
Sys.setlocale("LC_TIME", old_locale)

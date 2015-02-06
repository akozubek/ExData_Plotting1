# read data: not very elegant, but the quickest
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637, col.names = colNames)

# convert Date and Time to POSIXlt time
data$Date.Time <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# switch locale to English and save old locale so that the labels are in
# English
old_locale <-Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# plot data
png(filename="plot2.png")
plot(data$Date.Time,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# reset locale
Sys.setlocale("LC_TIME", old_locale)

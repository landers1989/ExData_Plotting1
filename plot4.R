##load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##change date column to date class
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

##subset dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##create new date and time column
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

##plot
data$datetime <- as.POSIXct(data$datetime)
par(mfrow = c(2, 2))
plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$Voltage ~ data$datetime, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), bty="n", cex=.5)

plot(data$Global_reactive_power ~ data$datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##save as PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
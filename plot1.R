##load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##change date column to date class
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

##subset dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##create new date and time column
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

##plot
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

##save as PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dateTime <- paste(as.Date(data2$Date), data2$Time)
data2$dateTime <- as.POSIXct(dateTime)

par(mfrow=c(2,2))

##Top-Left
plot(data2$Global_active_power ~ data2$dateTime, type ="l", ylab = "Global Active Power", xlab = "")

##Top-Right
plot(data2$Voltage ~ data2$dateTime, type ="l", ylab = "Voltage", xlab = "")

##Bottom-Left
plot(data2$Sub_metering_1 ~ data2$dateTime, type ="l", ylab = "Energy sub metering", xlab = "")
lines(data2$Sub_metering_2 ~ data2$dateTime, col = "red")
lines(data2$Sub_metering_3 ~ data2$dateTime, col = "blue")

legend("topright", bty = "n", col = c("black","red","blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Bottom-Right
plot(data2$Global_reactive_power ~ data2$dateTime, type ="l", ylab = "Global_reactive_power", xlab = "")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

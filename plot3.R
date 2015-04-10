data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dateTime <- paste(as.Date(data2$Date), data2$Time)
data2$dateTime <- as.POSIXct(dateTime)


plot(data2$Sub_metering_1 ~ data2$dateTime, type ="l", ylab = "Energy sub metering", xlab = "")
lines(data2$Sub_metering_2 ~ data2$dateTime, col = "red")
lines(data2$Sub_metering_3 ~ data2$dateTime, col = "blue")

legend("topright", col = c("black","red","blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

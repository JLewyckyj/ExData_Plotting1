data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

dateTime <- paste(as.Date(data2$Date), data2$Time)
data2$dateTime <- as.POSIXct(dateTime)

plot(data2$Global_active_power ~ data2$dateTime, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
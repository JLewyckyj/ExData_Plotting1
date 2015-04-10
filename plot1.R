data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

gap <- data2$Global_active_power

gap <- as.numeric(as.character(gap))

hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
	ylab = "Frequency", col="Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
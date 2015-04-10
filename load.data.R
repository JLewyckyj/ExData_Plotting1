data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


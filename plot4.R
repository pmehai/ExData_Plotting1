filename = "household_power_consumption.txt"
data <- read.table(filename, sep = ";", header = TRUE, stringsAsFactors = FALSE)
head(data)
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
data <- subset(data, Date == "2/2/2007"|Date == "1/2/2007")

#fig4
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

# 1st plot
plot(as.numeric(data$Global_active_power), 
     type = "l",
     ylab = "Global active power",
     xlab= "",
     xaxt = "n")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# 2nd plot
plot(as.numeric(data$Voltage), 
     type = "l",
     ylab = "voltage",
     xlab= "datetime",
     xaxt = "n")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

#3rd plot
plot(as.numeric(data$Sub_metering_1), type = "l", col = "black", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(as.numeric(data$Sub_metering_3), type = "l", col = "blue")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty=c(1,1),
       lwd=c(2.5,2.5))

#4th plot
plot(as.numeric(data$Global_reactive_power), 
     type = "h",
     ylab = "Global_reactive_power",
     xlab= "datetime",
     xaxt = "n")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
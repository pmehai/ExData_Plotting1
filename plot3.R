filename = "household_power_consumption.txt"
data <- read.table(filename, sep = ";", header = TRUE, stringsAsFactors = FALSE)
head(data)
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
data <- subset(data, Date == "2/2/2007"|Date == "1/2/2007")

# fig3
png(filename = "plot3.png",width = 480, height = 480, units = "px")
par(mfrow = c(1,1))
par(mar = c(4,4,2,2))
plot(as.numeric(data$Sub_metering_1), type = "l", col = "black", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(as.numeric(data$Sub_metering_3), type = "l", col = "blue")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty=c(1,1),
       lwd=c(2.5,2.5),
       cex =1)
dev.off()
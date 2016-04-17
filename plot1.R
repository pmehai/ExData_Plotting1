filename = "household_power_consumption.txt"
data <- read.table(filename, sep = ";", header = TRUE, stringsAsFactors = FALSE)
head(data)
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
data <- subset(data, Date == "2/2/2007"|Date == "1/2/2007")

# fig1
png(filename = "plot1.png",width = 480, height = 480, units = "px")
par(mfrow = c(1,1))
par(mar = c(4,4,2,2))
hist(as.numeric(data$Global_active_power), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global active power (kilowatts)", 
     ylab = "Frequency",
     ylim = c(0, 1200))
dev.off()
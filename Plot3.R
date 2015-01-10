
# Load Dataset
filename <- "./household_power_consumption.txt"
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
dim(data) # 2075259 9
attach(data)
subset <- Date == "1/2/2007" | Date == "2/2/2007"
Data <- data[subset, ]
attach(Data)
x <- paste(Date, Time)
Data$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(Data) <- 1:nrow(Data)
dim(Data) # 2880 10
attach(Data)

# Plot3.png
png(filename = "plot3.png",width = 480, height = 480,units = "px", bg = "transparent")
plot(DateTime, Sub_metering_1,type = "l",col = "black",xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)
dev.off()

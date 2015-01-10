
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

# Plot2.png
png(filename = "plot2.png",width = 480, height = 480,units = "px", bg = "transparent")
plot(DateTime, Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()



# Download and unzip the file
if (!file.exists("Electric_power_consumption.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, "Electric_power_consumption.zip", method="curl")
}

if (!file.exists("household_power_consumption.txt")) { 
  unzip("Electric_power_consumption.zip") 
}

# Reading, and subsetting the household power consumption data
hpc <- "household_power_consumption.txt"
hpc_data <- read.table(hpc, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
View(hpc_data)
hpc_subset <- subset(hpc_data, hpc_data$Date == "1/2/2007" | hpc_data$Date == "2/2/2007")


# Plotting using basic function to build the 4 plots, then save the plot to png format
plot4 <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hpc_subset$Global_active_power)
globalReactivePower <- as.numeric(hpc_subset$Global_reactive_power)
voltage <- as.numeric(hpc_subset$Voltage)
subMeter1 <- as.numeric(hpc_subset$Sub_metering_1)
subMeter2 <- as.numeric(hpc_subset$Sub_metering_2)
subMeter3 <- as.numeric(hpc_subset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(plot4, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(plot4, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(plot4, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(plot4, subMeter2, type="l", col="red")
lines(plot4, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(plot4, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


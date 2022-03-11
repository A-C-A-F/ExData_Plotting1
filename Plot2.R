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

# Plotting using basic function and saving the plot to png format
plot2 <- strptime(paste(hpc_subset$Date, hpc_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hpc_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(plot2, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

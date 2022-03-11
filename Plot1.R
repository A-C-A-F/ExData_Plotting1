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


# Plotting using hist function and saving the plot to png format
png("plot1.png", width = 480, height = 480)

plot1 <- hist(as.numeric(as.character(hpc_subset$Global_active_power)), 
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()


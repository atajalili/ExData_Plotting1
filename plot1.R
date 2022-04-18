
# reading data which is previously downloaded and unzipped in the wd
dataAll <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# subsetting the data for the specified time period
data <- dataAll[(dataAll$Date=="1/2/2007" | dataAll$Date=="2/2/2007" ), ]

# maing histogram (plot1)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# exporting PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


# reading data which is previously downloaded and unzipped in the wd
dataAll <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# subsetting the data for the specified time period
data <- dataAll[(dataAll$Date=="1/2/2007" | dataAll$Date=="2/2/2007" ), ]

# formating date and time and creating a new feature called dateANDtime to track time across days
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateANDtime <- paste(data$Date, data$Time)
data$dateANDtime <- as.POSIXct(dateANDtime)

# So far, it has been similar to plot2. The difference is in the following lines.

# making plot3
with(data, {
  plot(Sub_metering_1~dateANDtime, type="l",
       ylab="Energy sub metering", xlab="", cex=0.8)
  lines(Sub_metering_2~dateANDtime, col='Red')
  lines(Sub_metering_3~dateANDtime, col='Blue')
})
# adding legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

# exporting PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
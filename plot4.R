
# reading data which is previously downloaded and unzipped in the wd
dataAll <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# subsetting the data for the specified time period
data <- dataAll[(dataAll$Date=="1/2/2007" | dataAll$Date=="2/2/2007" ), ]

# formating date and time and creating a new feature called dateANDtime to track time across days
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateANDtime <- paste(data$Date, data$Time)
data$dateANDtime <- as.POSIXct(dateANDtime)

# So far, it has been similar to plot2. The difference is in the following lines.

# making plot4
par(mfrow=c(2,2))#, mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
  plot(Global_active_power~dateANDtime,   type="l", xlab="", ylab="Global_Active_Power", cex=0.8)
  plot(Voltage~dateANDtime,               type="l", xlab="", ylab="Voltage", cex=0.8)
  plot(Sub_metering_1~dateANDtime,        type="l", xlab="", ylab="Energy sub metering",cex=0.8)
  lines(Sub_metering_2~dateANDtime, col='red')
  lines(Sub_metering_3~dateANDtime, col='blue')
  plot(Global_reactive_power~dateANDtime, type="l", xlab="", ylab="Global_Rective_Power", cex=0.8)
  #
  #making legends
  legend(legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), "topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=0.5)
  
})

# exporting png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
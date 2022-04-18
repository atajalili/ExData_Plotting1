
# reading data which is previously downloaded and unzipped in the wd
dataAll <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# subsetting the data for the specified time period
data <- dataAll[(dataAll$Date=="1/2/2007" | dataAll$Date=="2/2/2007" ), ]

# formating date and time and creating a new feature called dateANDtime to track time across days
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateANDtime <- paste(data$Date, data$Time)
data$dateANDtime <- as.POSIXct(dateANDtime)

# making plot2
plot(data$Global_active_power~data$dateANDtime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# exporting PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

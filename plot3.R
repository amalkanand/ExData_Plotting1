# Read data
datainput <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# Filter for dates
datafilter <- subset(datainput, Date %in% c("1/2/2007","2/2/2007"))
# Format change
datafilter$Date <- as.Date(datafilter$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datafilter$Date), datafilter$Time)
datafilter$Datetime <- as.POSIXct(datetime)

#Save the plot
png("plot3.png", width=480, height=480)

# Create chart
with(datafilter, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
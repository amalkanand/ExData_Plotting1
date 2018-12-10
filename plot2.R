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
png("plot2.png", width=480, height=480)

# Create chart
with(datafilter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.off()
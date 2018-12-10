
# Read data
datainput <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# Filter for dates
datafilter <- subset(datainput, Date %in% c("1/2/2007","2/2/2007"))
# Format change
datafilter$Date <- as.Date(datafilter$Date, format="%d/%m/%Y")
#Save the plot
png("plot1.png", width=480, height=480)
# Create chart
hist(datafilter$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
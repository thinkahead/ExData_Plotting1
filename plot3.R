# Download the https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip and unzip it to get household_power_consumption.txt
# Read the header
tbl <- read.table("../household_power_consumption.txt", nrows=1, sep=';', na.strings="?", header=T)
names <- names(tbl)
# Read the rows for just the first 2 days in February 2007
tbl <- read.table("../household_power_consumption.txt", skip=66638-1, nrows=69518-66638, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Assign the column names
names(tbl) <- names
# Check the rows
tbl[1,]
tbl[nrow(tbl),]
# Convert to Date/Time class
tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
# Create png device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(tbl$DateTime, tbl$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(tbl$DateTime, tbl$Sub_metering_2, type="l", col="red")
lines(tbl$DateTime, tbl$Sub_metering_3, type="l", col="blue")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend=cols)
dev.off()

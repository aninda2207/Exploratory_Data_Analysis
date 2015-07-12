# Reading the data set and subsetting as per choice
File<- file("~/datasciencecoursera/household_power_consumption.txt")
full_data<- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_req<- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]


# Plotting of line plot in png file
global_active_power <- as.numeric(data_req$Global_active_power)
sub_metering_1 <- as.numeric(data_req$Sub_metering_1)
sub_metering_2 <- as.numeric(data_req$Sub_metering_2)
sub_metering_3 <- as.numeric(data_req$Sub_metering_3)
global_reactive_power <- as.numeric(data_req$Global_reactive_power)
voltage <- as.numeric(data_req$Voltage)
datetime <- strptime(paste(data_req$Date, data_req$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
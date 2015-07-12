# Reading the data set and subsetting as per choice
File<- file("~/datasciencecoursera/household_power_consumption.txt")
full_data<- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_req<- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plotting of line plot in png file
sub_metering_1 <- as.numeric(data_req$Sub_metering_1)
sub_metering_2 <- as.numeric(data_req$Sub_metering_2)
sub_metering_3 <- as.numeric(data_req$Sub_metering_3)
datetime <- strptime(paste(data_req$Date, data_req$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
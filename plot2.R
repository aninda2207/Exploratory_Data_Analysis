# Reading the data set and subsetting as per choice
File<- file("~/datasciencecoursera/Exploratory Data Analysis/household_power_consumption.txt")
full_data<- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_req<- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plotting of line plot in png file
datetime <- strptime(paste(data_req$Date, data_req$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(data_req$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
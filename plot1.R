# Reading the data set and subsetting as per choice
File<- file("~/datasciencecoursera/Exploratory Data Analysis/household_power_consumption.txt")
full_data<- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_req<- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]


# Plotting of Histogram in png file
global_active_power <- as.numeric(data_req$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


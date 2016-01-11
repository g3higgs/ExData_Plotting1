##Load full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##Subsetting the data
x <- which(data_full$Date == "2007-02-01" | data_full$Date == "2007-02-02")
data <- data_full[x,]
rm(data_full)

##Create new column for x-axis plot
DateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(DateTime)

##Specify the classes of each column
for (i in 3:9) {
    data[,i] <- as.numeric(as.character(data[,i]))
}

##Plot 2
plot(data$Global_active_power ~ data$DateTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

##Saving to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
##Load full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##Subsetting the data
x <- which(data_full$Date == "2007-02-01" | data_full$Date == "2007-02-02")
data <- data_full[x,]
rm(data_full)

##Specify the classes of each column
for (i in 3:9) {
    data[,i] <- as.numeric(as.character(data[,i]))
}

##Plot 1
hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")

##Saving to file
dev.copy(png, file="plot1.png",
         height = 480,
         width = 480)
dev.off()
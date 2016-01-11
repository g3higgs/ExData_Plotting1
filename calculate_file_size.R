##Calculate the memory needed to open the file
#give dimensions of data set is 2075259 x 9
size_rows <- 2075259
size_columns <- 9
bytes_per_numeric <- 8
size_bytes <- size_rows * size_columns * bytes_per_numeric
bytes_per_MB <- 2^20
size_MBs <- size_bytes / bytes_per_MB

##Load full dataset
#data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
#data2 <- data
data2$Date <- strptime(data$Date, format = "%d/%m/%Y")
#delete - data2$Time <- strptime(data$Time, format = "%H:%M:%S")

##Subsetting the data
x <- which(data2$Date == "2007-02-01 PST" | data2$Date == "2007-02-02 PST")
data3 <- data2[x, ]

##Specify the classes of each column
for (i in 3:9) {
    data3[ , i] <- as.numeric(as.character(data3[ , i]))
}

##Plot 1
hist(data3$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kw)",
     ylab = "Frequency",
     col = "Red")

##Saving to file
dev.copy(png, file="plot1.png",
         height = 480,
         width = 480)
dev.off()
## this script creates plot 1
library(dplyr)

## read in data and filter on date
data <- read.table("household_power_consumption.txt",header = TRUE,stringsAsFactors = FALSE,na.strings = "?",sep=";")

## convert date and time fields to date and POSIX variables respectively
data$Time <- paste( substr(data$Date,1,10), data$Time )
data$Time <- as.POSIXct(strptime(data$Time, format = "%d/%m/%Y %H:%M:%S"))
data$Date <- substr(data$Date,1,10)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## filter out by date
data <- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02" )

## create png file with red histogram of global active power
png(file = "plot1.png")
with(data, hist(Global_active_power, 
                main = "Global Active Power", 
                ylab = "Frequency", 
                xlab = "Global Active Power (kilowatts)", 
                col = "red",
                width = 480, height = 480, units = "px"))
dev.off()


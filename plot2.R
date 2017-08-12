## this script creates plot 2
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

## create png file with line chart of global active power
png(file = "plot2.png")
with(data, plot(x = Time, 
                y = Global_active_power, 
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)", 
                width = 480, height = 480, units = "px"))
dev.off()


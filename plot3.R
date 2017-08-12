## this script creates plot 3
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
png(file = "plot3.png")
with(data, plot(x = Time, 
                y = Sub_metering_1, 
                type = "l",
                xlab = "",
                ylab = "Energy sub metering", 
                width = 480, height = 480, units = "px"))
with(data, lines(Time, Sub_metering_2, col = "red") )
with(data, lines(Time, Sub_metering_3, col = "blue") )
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       col=c("black", "red", "blue" ),
       cex = 0.8)
dev.off()


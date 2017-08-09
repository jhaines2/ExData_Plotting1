## this script creates plot 1

data <- read.table("household_power_consumption.txt",header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
library(dplyr)
data$Date <- substr(data$Date,1,10)
data$Date <- strptime(data$Date,format = "dd/mm/yyyy")
data$Time <- strptime(data$Time,format = "hh:mm:ss")

filter(data, Date == 2007-02-01 | 2007-02-01 )
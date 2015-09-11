### Introduction

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets where
Date: Date in format dd/mm/yyyy
Time: time in format hh:mm:ss
Global_active_power: household global minute-averaged active power (in kilowatt)
Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
Voltage: minute-averaged voltage (in volt)
Global_intensity: household global minute-averaged current intensity (in ampere)
Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

### Making Plots

Each script makes a plot... Plot1.R > plot1.png

## The workflow was broken into several plot scripts :
library(dplyr)
library(lubridate)
power_comp <- read.table("household_power_consumption.txt",header = T, sep= ";", na.strings = "?", as.is = T)
power_comp_sub <- power_comp %>% filter(power_comp$Date=="1/2/2007"| power_comp$Date=="2/2/2007")
power_comp_sub$Day <- power_comp_sub$Date %>%dmy() %>% wday(label=T)
png("plot1.png", width=480, height=480)
hist(power_comp_sub$Global_active_power, main = "Global Active Power", xlab ="Global Active Power (kilowatts)", col="red" )
dev.off()

power_comp_sub$datetime <- paste(power_comp_sub$Date, power_comp_sub$Time)
power_comp_sub$datetime <- dmy_hms(power_comp_sub$datetime)
png("plot2.png", width=480, height=480)
with(power_comp_sub, plot(Global_active_power~datetime,type="l", ylab ="Global Active Power (kilowatts)" ))
dev.off()

png("plot3.png", width=480, height=480)
with(power_comp_sub, plot(Sub_metering_1~datetime,type="l", ylab ="Energy sub metering", col="black" ))
with(power_comp_sub, lines(Sub_metering_2~datetime,col="red"))
with(power_comp_sub, lines(Sub_metering_3~datetime,col="blue"))
dev.off()
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
with(power_comp_sub, plot(Global_active_power~datetime,type="l", ylab ="Global Active Power (kilowatts)" ))
with(power_comp_sub, plot(Sub_metering_1~datetime,type="l", ylab ="Sub metering", col="black" ))
with(power_comp_sub, lines(Sub_metering_2~datetime,col="red"))
with(power_comp_sub, lines(Sub_metering_3~datetime,col="blue"))
with(power_comp_sub,plot(datetime,Global_reactive_power, type = "l"))
with(power_comp_sub,plot(datetime,Voltage, type = "l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 


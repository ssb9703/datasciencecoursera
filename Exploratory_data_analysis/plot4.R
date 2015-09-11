library(dplyr)
library(lubridate)
power_comp <- read.table("household_power_consumption.txt",header = T, sep= ";", na.strings = "?", as.is = T)# read in the file
power_comp_sub <- power_comp %>% filter(power_comp$Date=="1/2/2007"| power_comp$Date=="2/2/2007")#filter the rows to match the specific dates
power_comp_sub$Day <- power_comp_sub$Date %>%dmy() %>% wday(label=T) # convert to date and weeday format
power_comp_sub$datetime <- paste(power_comp_sub$Date, power_comp_sub$Time)# cat to join the time and date fields
power_comp_sub$datetime <- dmy_hms(power_comp_sub$datetime)# convert a final time to date-time format
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))# set the grid for the plot
with(power_comp_sub, plot(Global_active_power~datetime,type="l", ylab ="Global Active Power (kilowatts)" )) # plot active power as it relates to datetime
with(power_comp_sub, plot(Sub_metering_1~datetime,type="l", ylab ="Energy sub metering", col="black" ))
with(power_comp_sub, lines(Sub_metering_2~datetime,col="red"))
with(power_comp_sub, lines(Sub_metering_3~datetime,col="blue"))
with(power_comp_sub,plot(datetime,Global_reactive_power, type = "l"))
with(power_comp_sub,plot(datetime,Voltage, type = "l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 

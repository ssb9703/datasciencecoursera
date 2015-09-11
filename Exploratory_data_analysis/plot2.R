library(dplyr)
library(lubridate)
power_comp <- read.table("household_power_consumption.txt",header = T, sep= ";", na.strings = "?", as.is = T)# read in the file
power_comp_sub <- power_comp %>% filter(power_comp$Date=="1/2/2007"| power_comp$Date=="2/2/2007")#filter the rows to match the specific dates
power_comp_sub$Day <- power_comp_sub$Date %>%dmy() %>% wday(label=T) # convert to date and weeday format
power_comp_sub$datetime <- paste(power_comp_sub$Date, power_comp_sub$Time)# cat to join the time and date fields
power_comp_sub$datetime <- dmy_hms(power_comp_sub$datetime)# convert a final time to date-time format
png("plot2.png", width=480, height=480)
with(power_comp_sub, plot(Global_active_power~datetime,type="l", ylab ="Global Active Power (kilowatts)" ))
dev.off()


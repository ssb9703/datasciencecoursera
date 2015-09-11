library(dplyr)
library(lubridate)
power_comp <- read.table("household_power_consumption.txt",header = T, sep= ";", na.strings = "?", as.is = T)# read in the file
power_comp_sub <- power_comp %>% filter(power_comp$Date=="1/2/2007"| power_comp$Date=="2/2/2007")#filter the rows to match the specific dates
power_comp_sub$Day <- power_comp_sub$Date %>%dmy() %>% wday(label=T)# convert to date and weeday format
png("plot1.png", width=480, height=480)
hist(power_comp_sub$Global_active_power, main = "Global Active Power", xlab ="Global Active Power (kilowatts)", col="red" )
dev.off()

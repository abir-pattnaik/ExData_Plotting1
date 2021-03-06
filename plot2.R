setwd("C:/Users/abirp/OneDrive/Desktop/Coursera_Projects/Course_4_exploratory_data_analysis/exdata_data_household_power_consumption")
list.files("./")
household_power_consumption<-read.table("./household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
household_power_consumption$Timestamp<-paste(household_power_consumption$Date,household_power_consumption$Time)
household_power_consumption$Timestamp<-as.POSIXct(strptime(household_power_consumption$Timestamp,"%d/%m/%Y %H:%M:%S"))
household_power_consumption$Date<-as.Date(household_power_consumption$Date,'%d/%m/%Y')
subset_data<-household_power_consumption[(household_power_consumption$Date>= as.Date("2007-02-01"))&(household_power_consumption$Date<= as.Date("2007-02-02")) ,]
subset_data$Global_active_power<-as.numeric(subset_data$Global_active_power)

png(filename="plot2.png", width=480, height=480, units="px")
plot(y=subset_data$Global_active_power,x=subset_data$Timestamp,type='l',xlab="",ylab='Global Active Power (kilowatts)')
dev.off()


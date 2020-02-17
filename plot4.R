setwd("C:/Users/abirp/OneDrive/Desktop/Coursera_Projects/Course_4_exploratory_data_analysis/exdata_data_household_power_consumption")
list.files("./")
household_power_consumption<-read.table("./household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
household_power_consumption$Timestamp<-paste(household_power_consumption$Date,household_power_consumption$Time)
household_power_consumption$Timestamp<-as.POSIXct(strptime(household_power_consumption$Timestamp,"%d/%m/%Y %H:%M:%S"))
household_power_consumption$Date<-as.Date(household_power_consumption$Date,'%d/%m/%Y')
subset_data<-household_power_consumption[(household_power_consumption$Date>= as.Date("2007-02-01"))&(household_power_consumption$Date<= as.Date("2007-02-02")) ,]
subset_data$Sub_metering_1<-as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2<-as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3<-as.numeric(subset_data$Sub_metering_3)
subset_data$Voltage<-as.numeric(subset_data$Voltage)
subset_data$Global_reactive_power<-as.numeric(subset_data$Global_reactive_power)




png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(y=subset_data$Global_active_power,x=subset_data$Timestamp,type='l',xlab="",ylab='Global Active Power')


plot(y=subset_data$Voltage,x=subset_data$Timestamp,type='l',xlab="datetime",ylab='Voltage')


plot(y=subset_data$Sub_metering_1,x=subset_data$Timestamp,type = "l",xlab = "",ylab='Energy sub metering')
lines(y=subset_data$Sub_metering_2,x=subset_data$Timestamp,col="red")
lines(y=subset_data$Sub_metering_3,x=subset_data$Timestamp,col="blue")
legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,cex=0.5)



plot(y=subset_data$Global_reactive_power,x=subset_data$Timestamp,type='l',xlab="datetime",ylab='Global_reactive_power')

dev.off()


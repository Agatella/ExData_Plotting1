#Load Dataset
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data_subSet <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]


#create variables needed for the graphs
date_time <- strptime(paste(data_subSet$Date, data_subSet$Time), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- data_subSet$Sub_metering_1
Sub_metering_2 <- data_subSet$Sub_metering_2
Sub_metering_3 <- data_subSet$Sub_metering_3
globalActivePower <- data_subSet$Global_active_power
voltage <- data_subSet$Voltage
global_reactive_power <- data_subSet$Global_reactive_power

#create the grid
png("plot4.png", width=550, height=550)
par(mfrow = c(2, 2)) 

#create graph Global Active Power
plot(date_time, globalActivePower,  ylab="Global Active Power (kilowats)", xlab="", type="l")

#create graph Voltage
plot(date_time, voltage,  ylab="Voltage", xlab="datetime", type="l")


#create graph Energy sub metering 
plot(date_time, Sub_metering_1,  type="l",  ylab="Energy sub metering", xlab="", col= "black")
lines(date_time, Sub_metering_2, type="l", col="red")
lines (date_time, Sub_metering_3, type = "l", col= "blue")

    #add legend and size it
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5),col=c("black", "red", "blue"),
       cex = 0.75)

#create graph Global Reactive Power
plot(date_time, global_reactive_power,  ylab="Global_Reactive_Power", xlab="datetime", type="l")
dev.off()



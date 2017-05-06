#Load Dataset
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data_subSet <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]


#create variables needed for the graph
date_time <- strptime(paste(data_subSet$Date, data_subSet$Time), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- data_subSet$Sub_metering_1
Sub_metering_2 <- data_subSet$Sub_metering_2
Sub_metering_3 <- data_subSet$Sub_metering_3

#create graph 
png("plot3.png", width=550, height=550)
plot(date_time, Sub_metering_1,  type="l",  ylab="Energy sub metering", xlab="", col= "black")
lines(date_time, Sub_metering_2, type="l", col="red")
lines (date_time, Sub_metering_3, type = "l", col= "blue")

#add legend and size it
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5),col=c("black", "red", "blue"),
       cex = 0.75)

dev.off()


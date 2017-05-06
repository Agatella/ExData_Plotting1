#Load Dataset
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data_subSet <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]


#create variables needed for the graph
date_time <- strptime(paste(data_subSet$Date, data_subSet$Time), "%d/%m/%Y %H:%M:%S")
globalActivePower <- data_subSet$Global_active_power

#create graph 
png("plot2.png", width=550, height=550)
plot(date_time, globalActivePower,  ylab="Global Active Power (kilowats)", xlab="", type="l")
dev.off()

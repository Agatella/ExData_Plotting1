#Load Dataset
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)

#Create Sub-set of data needed for the graph
data_subSet <- data_set[data_set$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract variable, display it and save
globalActivePower <- as.numeric(data_subSet$Global_active_power)
png("plot1.png", width=550, height=550)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
#setwd("C:/Users/Sidonia/datasciencecoursera/ExData_Plotting1/")
mydata <- read.table("household_power_consumption.txt", sep=";", header=T,
                     nrows=2075259, comment.char="", as.is=T)
mydata$datetime <- paste(mydata$Date,mydata$Time, sep=" ")
mydata$datetime <- strptime(mydata$datetime, format="%d/%m/%Y %H:%M:%S")
mydata1 <- subset(mydata, as.Date(mydata$datetime) == '2007-02-01' |
                      as.Date(mydata$datetime) == '2007-02-02')
#as I checked with table(is.na(mydata1)) there are no NAs in the dataset

# type of data is character, so change to numeric:
mydata1$Sub_metering_1 <- as.numeric(mydata1$Sub_metering_1)
mydata1$Sub_metering_2 <- as.numeric(mydata1$Sub_metering_2)
mydata1$Sub_metering_3 <- as.numeric(mydata1$Sub_metering_3)
mydata1$Voltage <- as.numeric(mydata1$Voltage)
mydata1$Global_reactive_power <- as.numeric(mydata1$Global_reactive_power)
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)

#start file
png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))   #four graphs

#topleft graph
plot(mydata1$datetime,mydata1$Global_active_power,
     #if I use just mydata1$datetime or as.Date(mydata1$datetime) the line
     #vanishes, so I changed datetime to numeric, even though the axis shows
     #strange numbers than...
     type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#topright graph
plot(mydata1$Voltage~as.numeric(mydata1$datetime),
     type="l", ylab = "Voltage", xlab="datetime")

#bottomleft graph
plot(mydata1$Sub_metering_1~as.numeric(mydata1$datetime),
     type="l", ylab = "Energy sub metering", xlab="")
lines(mydata1$Sub_metering_2~as.numeric(mydata1$datetime),col="red")
lines(mydata1$Sub_metering_3~as.numeric(mydata1$datetime),col="blue")
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2",
                                     "Sub_metering_3"), col=c("black","red","blue"))

#bottom right graph
plot(mydata1$Global_reactive_power~as.numeric(mydata1$datetime),
     type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()


#setwd("C:/Users/Sidonia/datasciencecoursera/ExData_Plotting1/")
mydata <- read.table("household_power_consumption.txt", sep=";", header=T,
                     nrows=2075259, comment.char="", as.is=T)
mydata$datetime <- paste(mydata$Date,mydata$Time, sep=" ")
mydata$datetime <- strptime(mydata$datetime, format="%d/%m/%Y %H:%M:%S")
mydata1 <- subset(mydata, as.Date(mydata$datetime) == '2007-02-01' |
                      as.Date(mydata$datetime) == '2007-02-02')
mydata1[mydata1=="?"] <- NA
mydata1 <- mydata1[mydata1$Sub_metering_1!="NA" ,]
# type of data is character, so change to numeric:
mydata1$Sub_metering_1 <- as.numeric(mydata1$Sub_metering_1)
mydata1$Sub_metering_2 <- as.numeric(mydata1$Sub_metering_2)
mydata1$Sub_metering_3 <- as.numeric(mydata1$Sub_metering_3)

png(file="plot3.png",width = 480, height = 480)

plot(mydata1$datetime, mydata1$Sub_metering_1,
     type="l", ylab = "Energy sub metering", xlab="")
lines(mydata1$Sub_metering_2~as.numeric(mydata1$datetime),col="red")
lines(mydata1$Sub_metering_3~as.numeric(mydata1$datetime),col="blue")
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2",
        "Sub_metering_3"), col=c("black","red","blue"))
dev.off()


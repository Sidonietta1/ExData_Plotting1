#setwd("C:/Users/Sidonia/datasciencecoursera/ExData_Plotting1/")
mydata <- read.table("household_power_consumption.txt", sep=";", header=T,
                     nrows=2075259, comment.char="", as.is=T)
mydata$datetime <- paste(mydata$Date,mydata$Time, sep=" ")
mydata$datetime <- strptime(mydata$datetime, format="%d/%m/%Y %H:%M:%S")
mydata1 <- subset(mydata, as.Date(mydata$datetime) == '2007-02-01' |
                      as.Date(mydata$datetime) == '2007-02-02')
png(file="plot1.png",width = 480, height = 480)
hist(as.numeric(mydata1$Global_active_power), col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
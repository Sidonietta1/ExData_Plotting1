#setwd("C:/Users/Sidonia/datasciencecoursera/ExData_Plotting1/")
mydata <- read.table("household_power_consumption.txt", sep=";", header=T,
                     nrows=2075259, comment.char="", as.is=T)
mydata$datetime <- paste(mydata$Date,mydata$Time, sep=" ")
mydata$datetime <- strptime(mydata$datetime, format="%d/%m/%Y %H:%M:%S")
mydata1 <- subset(mydata, as.Date(mydata$datetime) == '2007-02-01' |
                      as.Date(mydata$datetime) == '2007-02-02')
mydata1 <- mydata1[mydata1$Global_active_power!="?",]
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)
png(file="plot2.png")
plot(mydata1$datetime, mydata1$Global_active_power,
     #if I use just mydata1$datetime or as.Date(mydata1$datetime) the line
     #vanishes, so I changed datetime to numeric, even though the axis shows
     #strange numbers than...
     type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()

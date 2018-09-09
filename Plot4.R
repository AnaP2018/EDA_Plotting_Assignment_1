#Week 1 Project - EDA - Data Science - Plot 4

#####Loading and preparing the data        
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempf <- tempfile()
download.file(url,tempf)
unzip(tempf)3w
unlink(tempf)

#read text file, separator ";", missing values "?"
dataw1 <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings = "?")

#subset data to only include the 2 relevant days
 dataw1<-subset(dataw1,Date %in% c("1/2/2007","2/2/2007"))

#Convert Date and Time into datetime
dataw1$Date <- as.Date(dataw1$Date, format = "%d/%m/%Y")
dataw1$datetime <- strptime(paste(dataw1$Date, dataw1$Time), "%Y-%m-%d %H:%M:%S")

#Plot4

par(mfrow=c(2,2))
with(dataw1,{
	plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(datetime,Voltage, type = "l")
plot(datetime,Sub_metering_1 , type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(datetime,Sub_metering_2 , col = "Red")
lines(datetime,Sub_metering_3 , col = "Blue")
legend("topright",lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(datetime,Global_reactive_power, type = "l")
}
)


#Copy to png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()





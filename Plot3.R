## Week 1 Project - EDA - Data Science - Plot 3

##### Loading and preparing the data        
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempf <- tempfile()
download.file(url,tempf)
unzip(tempf)
unlink(tempf)

##### Read text file, separator ";", missing values "?"
dataw1 <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings = "?")

##### Subset data to only include the 2 relevant days
 dataw1<-subset(dataw1,Date %in% c("1/2/2007","2/2/2007"))

##### Convert dates to Date Class and create datetime
dataw1$Date <- as.Date(dataw1$Date, format = "%d/%m/%Y")
dataw1$datetime <- strptime(paste(dataw1$Date, dataw1$Time), "%Y-%m-%d %H:%M:%S")

##### Plot3
with(dataw1,{
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
}
)

##### Copy to png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()





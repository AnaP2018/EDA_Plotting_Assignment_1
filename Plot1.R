#Week 1 Project - EDA - Data Science - Plot 1

#####Loading and preparing the data        
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempf <- tempfile()
download.file(url,tempf)
unzip(tempf)
unlink(tempf)

#read text file, separator ";", missing values "?"
dataw1 <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings = "?")

#subset data to only include the 2 relevant days
 dataw1<-subset(dataw1,Date %in% c("1/2/2007","2/2/2007"))

#Convert dates to Date Class
dataw1$Date <- as.Date(dataw1$Date, format = "%d/%m/%Y")

#Plot1

hist(dataw1$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Copy to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()





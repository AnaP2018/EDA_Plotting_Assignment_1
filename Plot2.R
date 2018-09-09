## Week 1 Project - EDA - Data Science - Plot 2

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

##### Plot2
with(dataw1,plot(datetime,Global_active_power, type = "l",
	ylab = "Global Active Power (kilowatts)", xlab = ""))

##### Copy to png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()





##Download the dataset and unzip it
if(!file.exists("./L4W1_Assignment")){dir.create("./L4W1_Assignment")}
setwd("./L4W1_Assignment")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile = "./Electric Power Consumption.zip")
unzip(zipfile = "./Electric Power Consumption.zip")

##Read the data just from 2007/02/01 to 2007/02/02, 2880 rows in total
variable_class<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
twoday_powerconsumption<-read.table(file = "./household_power_consumption.txt",
                                    header = T,sep=";",na.strings="?",
                                    colClasses = variable_class,nrows=2880,skip = 66636
)

##Rename the variable name of data set
header<-read.table(file="./household_power_consumption.txt",sep=";",stringsAsFactors = F,nrows = 1)
colnames(twoday_powerconsumption)<-header

##Convert date and time to POSIXlt class
date_time<-paste(twoday_powerconsumption$Date,twoday_powerconsumption$Time)
Date_And_Time<-strptime(date_time,format = "%d/%m/%Y %H:%M:%S")
Weekday<-weekdays(Date_And_Time,abbreviate = T)
twoday_powerconsumption<-cbind(Date_And_Time,Weekday,twoday_powerconsumption)

##Open PNG device and create "plot2.png" in working directory
png(filename = "./plot2.png",width = 480,height = 480,units = "px")

##Create plot 2 and send to a file
with(twoday_powerconsumption,plot(Date_And_Time,Global_active_power,
                                  type="l",
                                  xlab = "",ylab = "Global Active Power(kilowatt)",
                                  main=""))
##Close the PNG file device
dev.off()
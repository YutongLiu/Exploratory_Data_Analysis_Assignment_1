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

##Open PNG device and create "plot1.png" in working directory
png(filename = "./plot1.png",width = 480,height = 480,units = "px")
##Create plot 1 and send to a file
with(twoday_powerconsumption,hist(Global_active_power,
                                  col="red",xaxp=c(0,6,3),yaxp=c(0,1200,6),
                                  main = "Global Active Power",
                                  xlab = "Global Active Power(kilowatts)"))
##Close the PNG file device
dev.off()
#Reading the data
#Read partial sample for identifying classes by columns
data<-read.table("household_power_consumption.txt",header=TRUE,nrows=50,na.strings="?",sep=";")
classes<-sapply(data,class)
#Reading the whole sample using obtained classes (for less time)
dataAll<-read.table("household_power_consumption.txt",header=TRUE, na.strings="?", sep=";",comment.char="",colClasses=classes)
dataSub<-dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007"),]
#Converting dates to POSIXlt for appropriate x axis values
datesStrSub<-paste(dataSub$Date,dataSub$Time,sep=' ')
datesFullSub<-strptime(datesStrSub,format = "%d/%m/%Y %T")
#Building graphic
plot(datesFullSub,dataSub$Global_active_power, type="l", xlab="",ylab="Global  Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
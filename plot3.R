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
txt_reduce = 0.8
plot(datesFullSub,dataSub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", cex.axis=txt_reduce, cex.lab=txt_reduce)
points(datesFullSub,dataSub$Sub_metering_2,type="l",col="red")
points(datesFullSub,dataSub$Sub_metering_3,type="l",col="blue")
dataSubColNamesLength<-length(colnames(dataSub))
legendNames<-colnames(dataSub)[(dataSubColNamesLength-2):dataSubColNamesLength]
legend("topright",col=c("black","red","blue"), legend=legendNames, lty = 1, cex = txt_reduce)
dev.copy(png,"plot3.png")
dev.off()
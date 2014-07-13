#Reading the data
#Read partial sample for identifying classes by columns
data<-read.table("household_power_consumption.txt",header=TRUE,nrows=50,na.strings="?",sep=";")
classes<-sapply(data,class)
#Reading the whole sample using obtained classes (for less time)
dataAll<-read.table("household_power_consumption.txt",header=TRUE, na.strings="?", sep=";",comment.char="",colClasses=classes)
dataSub<-dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007"),]
#Building graphic
hist(dataSub$Global_active_power,xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
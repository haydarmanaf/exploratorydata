#download files
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="C:./Dataset")
unzip("Dataset",unzip="internal")

#load datasets
hpc <- read.table(file = "household_power_consumption.txt",sep=";",skip=66637,nrows=2880) 
df<-read.table(file = "household_power_consumption.txt",sep=";",nrows=10,header=TRUE)

#change column headers
names(hpc)<-names(df)
str(hpc)

#convert to dates
y<-paste(hpc$Date,hpc$Time)
y<-strptime(y,"%d/%m/%Y %H:%M:%S")

#plot graph
hist(hpc$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")

#save
dev.copy(png,filename="plot1.png")
dev.off ()

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
plot(y,hpc$Global_active_power,type="l",,ylab="Global Active Power",xlab="")

#save
dev.copy(png,filename="plot2.png")
dev.off ()

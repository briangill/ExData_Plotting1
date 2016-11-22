#Load data file "household_power_consumption.txt" stored in working directory
hpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#subset to only 2007-02-01 and 2007-02-02
hpower <- hpower[as.Date(hpower$Date,"%d/%m/%Y") == "2007-02-01" | as.Date(hpower$Date,"%d/%m/%Y") == "2007-02-02",]

#Convert Date and Time variables to Date/Time classes 
hpower$Date <- as.Date(hpower$Date,"%d/%m/%Y")
hpower$DateTime <- strptime(paste(hpower$Date,hpower$Time),"%Y-%m-%d %H:%M:%S")

#create plot #3
png(filename = "plot3.png", width = 480, height = 480)
plot(hpower$DateTime,hpower$Sub_metering_1, type="n",
     ylab="Energy sub metering", xlab="")
points(hpower$DateTime,hpower$Sub_metering_1, type="l", col="black")
points(hpower$DateTime,hpower$Sub_metering_2, type="l", col="red")
points(hpower$DateTime,hpower$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("Black","red","blue"),lty=1)
dev.off()
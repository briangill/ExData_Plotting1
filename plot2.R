#Load data file "household_power_consumption.txt" stored in working directory
hpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#subset to only 2007-02-01 and 2007-02-02
hpower <- hpower[as.Date(hpower$Date,"%d/%m/%Y") == "2007-02-01" | as.Date(hpower$Date,"%d/%m/%Y") == "2007-02-02",]

#Convert Date and Time variables to Date/Time classes 
hpower$Date <- as.Date(hpower$Date,"%d/%m/%Y")
hpower$DateTime <- strptime(paste(hpower$Date,hpower$Time),"%Y-%m-%d %H:%M:%S")

#create plot #2
png(filename = "plot2.png", width = 480, height = 480)
plot(hpower$DateTime,hpower$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
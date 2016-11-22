#Load data file "household_power_consumption.txt" stored in working directory
hpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#subset to only 2007-02-01 and 2007-02-02
hpower <- hpower[as.Date(hpower$Date,"%d/%m/%Y") == "2007-02-01" | as.Date(hpower$Date,"%d/%m/%Y") == "2007-02-02",]

#create plot #1 
png(filename = "plot1.png", width = 480, height = 480)
hist(hpower$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
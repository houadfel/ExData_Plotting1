## Course: EXPLORATORY DATA ANALYSIS
## Project 1: SCRIPT TO PRODUCE PLOT #4 

## GET COLUMN CLASSES
filename <- "household_power_consumption.txt"
initial <- read.table(filename, header = TRUE, nrows = 5, sep = ";",
                      na.strings="?", stringsAsFactors = FALSE)
classes <- sapply(initial, class)

## READ RELEVANT DATA (corresponding to dates 1/2/2007 and 2/2/2007)
tab <- read.table(filename, colClasses = classes, na.strings="?", 
 		header = FALSE, skip = 66637, nrows = 2880,  sep = ";")

## NAME COLUMN VARIABLES AFTER ORIGINAL NAMES
colnames(tab) <- colnames(initial)

## CREATE DATETIME VARIABLE (combines date and time)
tab$Date <- as.Date(tab$Date,"%d/%m/%Y")
datetime <- paste(tab$Date,tab$Time)
datetime <- as.POSIXct(datetime)
datetime <- datetime-datetime[1]

## PLOT 4: MULTIPLE SCATTER PLOTS
## Open PNG device; create 'plot4.png' in current directory
png(file = "plot4.png")
## Create plots by row (2 rows and 2 columns)
par(mfrow = c(2, 2))
##--- plot 1,1
plot(datetime, tab$Global_active_power, xlab="", ylab="Global Active Power",
     type='l', axes=F)
axis(1, c(0,86400,172800), c("Thu","Fri","Sat"))
axis(2)
box()
##--- plot 1,2
plot(datetime, tab$Voltage, xlab="datetime", ylab="Voltage",
     type='l', axes=F)
axis(1, c(0,86400,172800), c("Thu","Fri","Sat"))
axis(2)
box()
##--- plot 2,1
plot(datetime, tab$Sub_metering_1, xlab="", ylab="Energy sub metering",
     type='l', axes=F)
axis(1, c(0,86400,172800), c("Thu","Fri","Sat"))
axis(2)
box()
lines(datetime, tab$Sub_metering_2, type='l', col=2)
lines(datetime, tab$Sub_metering_3, type='l', col=4)
legend("topright", col = c("black", "red", "blue"), lty=c(1,1,1), 
       legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"), bty="n")
## plot--- 2,2
plot(datetime, tab$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",
     type='l', axes=F)
axis(1, c(0,86400,172800), c("Thu","Fri","Sat"))
axis(2)
box()
## Close device
dev.off()
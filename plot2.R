## Course: EXPLORATORY DATA ANALYSIS
## Project 1: SCRIPT TO PRODUCE PLOT #2

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

## CREATE DATETIME VARIABLE
tab$Date <- as.Date(tab$Date,"%d/%m/%Y")
datetime <- paste(tab$Date,tab$Time)
datetime <- as.POSIXct(datetime)
datetime <- datetime-datetime[1]


## PLOT 2: SCATTER PLOT
## Open PNG device; create 'plot2.png' in current directory
png(file = "plot2.png")
## Create plot
plot(datetime, tab$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)",
     type='l', axes=F)
axis(1, c(0,86400,172800), c("Thu","Fri","Sat"))
axis(2)
box()
## Close device
dev.off()
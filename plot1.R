## Course: EXPLORATORY DATA ANALYSIS
## Project 1: SCRIPT TO PRODUCE PLOT #1 

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

## PLOT 1: HISTOGRAM
## Open PNG device; create 'plot1.png' in current directory
png(file = "plot1.png") 
## Create plot
hist(tab$Global_active_power, main="Global Active Power",
     xlab="Global Active Power(kilowatts)", col=2)
## Close device
dev.off() 

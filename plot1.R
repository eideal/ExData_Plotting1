## Histogram of the Global Active Power
#----------------------------------------

## Read in the subsetted data
data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', skip=66638, nrow=2879)

## Open the png file device
png(file = 'plot1.png', width=480, height=480)

## Plot the histogram
hist(data[,3], col='red', main = 'Global Active Power', xlab='Global Active Power (kilowatts)')

## Close the file device
dev.off()


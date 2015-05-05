## Plot of the Global Active Power vs. Datetime
##------------------------------------------------

## Read in the subsetted data
data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', skip=66638, nrow=2879)

## Convert the Time/Date variables
dates <- strptime(paste(data[,1], data[,2]), format='%d/%m/%Y %H:%M:%S')

## Set global active power vector
gap <- data[,3]

## Open the png file device
png(file='plot2.png', width=480, height=480)

## Create the plot on the device
plot(dates, gap, type='l', xlab = '', ylab='Global Active Power (kilowatts)')

## Close the png device
dev.off()
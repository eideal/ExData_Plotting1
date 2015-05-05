## Plot energy sub metering vs. datetime
#-----------------------------------------

## Read in the subsetted data
data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', skip=66638, nrow=2879)

## Convert the Time/Date variables
dates <- strptime(paste(data[,1], data[,2]), format='%d/%m/%Y %H:%M:%S')

## Name vectors for the submetering
sub_metering_1 <- data[,7]
sub_metering_2 <- data[,8]
sub_metering_3 <- data[,9]

## Open the png device
png(file='plot3.png', width=480, height=480)

## Create the plot
with(data, plot(dates, sub_metering_1, type='n', xlab='', ylab='Energy sub metering'))
with(data, lines(dates, sub_metering_1, col='black'))
with(data, lines(dates, sub_metering_2, col='red'))
with(data, lines(dates, sub_metering_3, col='blue'))

## Create the legend
legend("topright", col=c('black', 'red', 'blue'), lty=c(1,1,1), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

## Close the device
dev.off()
## Plot multiple base plots
#----------------------------

## Read in the subsetted data
data <- read.table('household_power_consumption.txt', sep=';', na.strings='?', skip=66638, nrow=2879)

## Convert the Time/Date variables
dates <- strptime(paste(data[,1], data[,2]), format='%d/%m/%Y %H:%M:%S')

## Set vector names
gap <- data[,3]
volt <- data[,5]
Sub_metering_1 <- data[,7]
Sub_metering_2 <- data[,8]
Sub_metering_3 <- data[,9]
grp <- data[,4]

## Open the png device
png(file='plot4.png', width=480, height=480)

## Create the plots
par(mfrow = c(2,2))
plot(dates, gap, xlab='', ylab='Global Active Power', type='l')
plot(dates, volt, xlab='datetime', ylab='Voltage', type='l')
with(data, plot(dates, sub_metering_1, type='n', xlab='', ylab='Energy sub metering'))
with(data, lines(dates, sub_metering_1, col='black'))
with(data, lines(dates, sub_metering_2, col='red'))
with(data, lines(dates, sub_metering_3, col='blue'))
legend("topright", col=c('black', 'red', 'blue'), lty=c(1,1,1), bty='n', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
plot(dates, grp, xlab='datetime', ylab='Global_reactive_power', type='l')

## Close the device
dev.off()
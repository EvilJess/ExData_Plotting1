## read the data into a data frame
data<-read.table("~/downloads/household_power_consumption.txt", sep=";", header=T, na.strings = "?") 
## split on dates
dates<-split(data, data$Date)
## combine the data from the two relevant days into one data frame
bothdays<-rbind(dates$"1/2/2007", dates$"2/2/2007")
## coerce the Time column into an R time format
bothdays$Time<-strptime(paste(bothdays$Date, bothdays$Time), f= "%d/%m/%Y %H:%M:%S")


## start the png creation
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

## set the plot parameter to 2 rows of 2 plots
par(mfrow = c(2, 2))

## create plot 1 (top left)
plot(bothdays$Time, 
     bothdays$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

## create plot 2 (top right)
plot(bothdays$Time, 
     bothdays$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

## create plot 3 (bottom left)
plot(bothdays$Time, 
     bothdays$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering",
     ylim = )

## add line to plot 3
lines(bothdays$Time, 
      bothdays$Sub_metering_2, 
      col = "red")

## add line to plot 3
lines(bothdays$Time, 
      bothdays$Sub_metering_3, 
      col = "blue")

## add legend to plot 3
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")

## create plot 4 (bottom right)
plot(bothdays$Time, 
     bothdays$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
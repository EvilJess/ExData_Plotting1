## read the data into a data frame
data<-read.table("~/downloads/household_power_consumption.txt", sep=";", header=T, na.strings = "?") 
## split on dates
dates<-split(data, data$Date)
## combine the data from the two relevant days into one data frame
bothdays<-rbind(dates$"1/2/2007", dates$"2/2/2007")
## coerce the Time column into an R time format
bothdays$Time<-strptime(paste(bothdays$Date, bothdays$Time), f= "%d/%m/%Y %H:%M:%S")

## start the png creation
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

## create the plot with the data from Sub_metering_1
plot(bothdays$Time, 
     bothdays$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering",
     ylim = )

## add a line for Sub_metering_2
lines(bothdays$Time, 
      bothdays$Sub_metering_2, 
      col = "red")

## add a line for Sub_metering_3
lines(bothdays$Time, 
      bothdays$Sub_metering_3, 
      col = "blue")

## create the legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))

## end png creation
dev.off()
## download .zip file, store and read the data into a data frame
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=T, na.strings = "?")
unlink(temp)

## split on dates
dates<-split(data, data$Date)
## combine the data from the two relevant days into one data frame
bothdays<-rbind(dates$"1/2/2007", dates$"2/2/2007")
## coerce the Time column into an R time format
bothdays$Time<-strptime(paste(bothdays$Date, bothdays$Time), f= "%d/%m/%Y %H:%M:%S")


## start the png creation
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

## create the plot
plot(bothdays$Time, 
     bothdays$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

## end png creation
dev.off()
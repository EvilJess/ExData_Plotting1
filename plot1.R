## read the data into a data frame
data<-read.table("~/downloads/household_power_consumption.txt", sep=";", header=T, na.strings = "?") 
## split on dates
dates<-split(data, data$Date)
## combine the data from the two relevant days into one data frame
bothdays<-rbind(dates$"1/2/2007", dates$"2/2/2007")


## start the png creation
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

## create the plot
hist(bothdays$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     xlim=c(0, max(bothdays$Global_active_power)), 
     col = "red") 

## end png creation
dev.off()



png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

hist(bothdays$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     xlim=c(0, max(bothdays$Global_active_power)), 
     col = "red") 

dev.off()



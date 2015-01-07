png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

par(mfrow = c(2, 2))

plot(bothdays$Time, 
     bothdays$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(bothdays$Time, 
     bothdays$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(bothdays$Time, 
     bothdays$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering",
     ylim = )

lines(bothdays$Time, 
      bothdays$Sub_metering_2, 
      col = "red")

lines(bothdays$Time, 
      bothdays$Sub_metering_3, 
      col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")

plot(bothdays$Time, 
     bothdays$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

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
       col = c("black", "red", "blue"))

dev.off()
plot4 <- function(Source = "household_power_consumption.txt", output = "plot4.png"){
  PowerC <- read.csv2(Source, na.strings = "?")
  PowerC[,1] <- as.Date(PowerC[,1], format = "%d/%m/%Y")
  PowerC <- PowerC[(PowerC[,1]=="2007-02-01")|(PowerC[,1]=="2007-02-02"),]
  PowerC[,2] <- as.numeric(PowerC[,2])
  PowerC[1441:2880,2] <- PowerC[1441:2880,2]+1440
  par(mfrow = c(2,2))
  ##Top Left
    plot(PowerC[,2],as.numeric(as.vector(PowerC[,3])), type ="l", xaxt = "n",ylab = "Global Active Power (killowatts)",xlab = NA)
    axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
  ##Top Right
    plot(PowerC[,2],as.numeric(as.vector(PowerC[,5])), type ="l", xaxt = "n",ylab = "Voltage",xlab = "datetime")
    axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
  ##Bottom Left
    plot(PowerC[,2],as.numeric(as.vector(PowerC[,7])), type ="l", xaxt = "n",ylab = "Global Active Power (killowatts)",xlab = NA)
    points(PowerC[,2],as.numeric(as.vector(PowerC[,8])), type ="l", col="red")
    points(PowerC[,2],as.numeric(as.vector(PowerC[,9])), type ="l", col="blue")
    axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"), bty = "n")
  ##Bottom Right
    plot(PowerC[,2],as.numeric(as.vector(PowerC[,4])), type ="l", xaxt = "n",ylab = "Global_reactive_power",xlab = "datetime")
    axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
  dev.copy(png, file = output, width = 480, height = 480)
  dev.off()
}
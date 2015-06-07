plot2 <- function(Source = "household_power_consumption.txt", output = "plot2.png"){
  PowerC <- read.csv2(Source, na.strings = "?")
  PowerC[,1] <- as.Date(PowerC[,1], format = "%d/%m/%Y")
  PowerC <- PowerC[(PowerC[,1]=="2007-02-01")|(PowerC[,1]=="2007-02-02"),]
  PowerC[,2] <- as.numeric(PowerC[,2])
  PowerC[1441:2880,2] <- PowerC[1441:2880,2]+1440
  plot(PowerC[,2],as.numeric(as.vector(PowerC[,3])), type ="l", xaxt = "n",ylab = "Global Active Power (killowatts)",xlab = NA)
  axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
  dev.copy(png, file = output, width = 480, height = 480)
  dev.off()
}
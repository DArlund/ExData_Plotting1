plot1 <- function(Source = "household_power_consumption.txt", output = "plot1.png"){
  PowerC <- read.csv2(Source, na.strings = "?")
  PowerC[,1] <- as.Date(PowerC[,1], format = "%d/%m/%Y")
  PowerC <- PowerC[(PowerC[,1]=="2007-02-01")|(PowerC[,1]=="2007-02-02"),]
  hist(as.numeric(as.vector(PowerC[,3])), xlab = "Global Active Power (killowatts)", col = "red", main = "Global Active Power")
  axis(2,at = c(0,200,400,600,800,1000,1200), labels = c(0,200,400,600,800,1000,1200))
  dev.copy(png, file = output, width = 480, height = 480)
  dev.off()
}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, "datos.zip")

datos <- read.delim("household_power_consumption.txt",header=TRUE, sep= ";",stringsAsFactors = FALSE, na.strings = "?")

datos <- na.omit(datos)

datos1 <- subset(datos, Date == "1/2/2007" | Date == "2/2/2007")

tiempo <- strptime(paste(datos1$Date, datos1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(tiempo, datos1$Sub_metering_1, type= "l", xlab="", ylab= "Global Active Power (kilowatts)")

lines(tiempo, datos1$Sub_metering_2, type="l", col="red")

lines(tiempo, datos1$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, "plot3.png")

dev.off()





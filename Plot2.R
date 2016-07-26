url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, "datos.zip")

datos <- read.delim("household_power_consumption.txt",header=TRUE, sep= ";",stringsAsFactors = FALSE, na.strings = "?")

datos <- na.omit(datos)

datos1 <- subset(datos, Date == "1/2/2007" | Date == "2/2/2007")



datos1$Global_active_power <- as.numeric(datos1$Global_active_power)

tiempo <- strptime(paste(datos1$Date, datos1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(tiempo, datos1$Global_active_power, type= "l", xlab="", ylab= "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")

dev.off()
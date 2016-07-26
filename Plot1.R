

  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

  download.file(url, "datos.zip")
  
  datos <- read.delim("household_power_consumption.txt",header=TRUE, sep= ";",stringsAsFactors = FALSE, na.strings = "?")
  
  datos <- na.omit(datos)
  
  datos1 <- subset(datos, Date == "1/2/2007" | Date == "2/2/2007")
  
  #aver que hacemos 
  
 
  
  #hacemos numeric lo que nos interesa 
  
  datos1$Global_active_power <- as.numeric(datos1$Global_active_power)
  
  
  
  #
  
  hist(datos1$Global_active_power , col ="red", xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power")
  
  dev.copy(png, "plot1.png")
  
  dev.off()
  
  
  
  
  
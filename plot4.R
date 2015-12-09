

  dt<-read.table("ExData_Plotting1/household_power_consumption.txt",sep=";", nrows = 2880,skip = 66637,stringsAsFactors = FALSE)
  cnames<-read.table("ExData_Plotting1/household_power_consumption.txt",sep=";", nrows = 1,stringsAsFactors = FALSE)
  colnames(dt)<-cnames
  dt$Date <- as.Date(dt$Date,"%d/%m/%Y")
  
  dt1<-within(dt, { timestamp=as.POSIXct(paste(Date, Time)) })
  
  
  png("ExData_Plotting1/plot4.png", width=480, height=480)
  
  graphs <- par(mfrow=c(2, 2))
  
  plot(dt1$timestamp,dt1$Global_active_power,type = "n", xlab="", ylab="Global Active Power(kilowatts)")
  lines(dt1$timestamp,dt1$Global_active_power,type = "l")
  
  plot(dt1$timestamp,dt1$Voltage,type = "n", xlab="datetime", ylab="Voltage")
  lines(dt1$timestamp,dt1$Voltage,type = "l")
  
  plot(dt1$timestamp,dt1$Sub_metering_1,type = "n", xlab="", ylab="Energy of submetering")
  lines(dt1$timestamp,dt1$Sub_metering_1,type = "l")
  lines(dt1$timestamp,dt1$Sub_metering_2,type = "l",col= "red")
  lines(dt1$timestamp,dt1$Sub_metering_3,type = "l",col= "blue")
  
  legend("topright",col=c("black","red", "blue"), lwd=2,legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  
  plot(dt1$timestamp,dt1$Global_reactive_power,type = "n", xlab="datetime", ylab="Global_reactive_power")
  lines(dt1$timestamp,dt1$Global_reactive_power,type = "l")
  
  par(graphs)

  dev.off()
  rm(dt,dt1,cnames,graphs)


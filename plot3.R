
  dt<-read.table("ExData_Plotting1/household_power_consumption.txt",sep=";", nrows = 2880,skip = 66637,stringsAsFactors = FALSE)
  cnames<-read.table("ExData_Plotting1/household_power_consumption.txt",sep=";", nrows = 1,stringsAsFactors = FALSE)
  colnames(dt)<-cnames
  
  dt$Date <- as.Date(dt$Date,"%d/%m/%Y")
  #The following step is done to get the days correctly scaled on x-axis
  dt1<-within(dt, { timestamp=as.POSIXct(paste(Date, Time)) })
  png("ExData_Plotting1/plot3.png", width=480, height=480)
  #plot the graph
  plot(dt1$timestamp,dt1$Sub_metering_1,type = "n", xlab="", ylab="Energy of submetering")
  #plot the lines
  lines(dt1$timestamp,dt1$Sub_metering_1,type = "l")
  lines(dt1$timestamp,dt1$Sub_metering_2,type = "l",col= "red")
  lines(dt1$timestamp,dt1$Sub_metering_3,type = "l",col= "blue")
  #write legend
  legend("topright",col=c("black","red", "blue"), lwd=2,legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  #close the device 
  dev.off()
  #delete objects from workspace
  rm(dt,dt1,cnames)


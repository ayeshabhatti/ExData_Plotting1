

  dt<-read.table("ExData_Plotting1/household_power_consumption.txt",sep=";", nrows = 2880,skip = 66637,stringsAsFactors = FALSE)

  cnames<-read.table("ExData_Plotting1/household_power_consumption.txt",sep=";", nrows = 1,stringsAsFactors = FALSE)
  colnames(dt)<-cnames
  dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

  dt1<-within(dt, { timestamp=as.POSIXct(paste(Date, Time)) })
  
  png("ExData_Plotting1/plot2.png", width=480, height=480) 
  plot(dt1$timestamp,dt1$Global_active_power,type = "n", xlab="", ylab="Global Active Power(kilowatts)")
  lines(dt1$timestamp,dt1$Global_active_power,type = "l")
  dev.off()
  rm(dt,dt1,cnames)


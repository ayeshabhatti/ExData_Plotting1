

  dt<-read.table("expdataproject1/household_power_consumption.txt",sep=";", nrows = 2880,skip = 66637,stringsAsFactors = FALSE)
  cnames<-read.table("expdataproject1/household_power_consumption.txt",sep=";", nrows = 1,stringsAsFactors = FALSE)
  colnames(dt)<-cnames
  


  png("expdataproject1/plot1.png", width=480, height=480) 
  hist(dt$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",xlim = c(0,8),main = "Global Active Power",breaks=12)
  dev.off()
  rm(dt,cnames)


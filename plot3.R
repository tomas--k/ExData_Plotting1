library("sqldf")

data <- read.csv.sql("household_power_consumption.txt"
                     ,sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
                     ,sep=";")

data$Datetime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

Sys.setlocale("LC_TIME", "C")

View(data)

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(x=data$Datetime
     ,y=data$Sub_metering_1
     ,type="l"
     ,xlab=""
     ,ylab="Energy Sub Meetering")

lines(x=data$Datetime
      ,y=data$Sub_metering_2
      , type="l"
      ,col="red")

lines(x=data$Datetime
      ,y=data$Sub_metering_3
      , type="l"
      ,col="blue")


legend("topright"
       ,c("Sub Metering 1","Sub Metering 2", "Sub Metering 3")
       ,lty=c(1,1,1)
       ,lwd=c(2.5,2.5,2.5)
       ,col=c("black","blue","red"))

dev.off()

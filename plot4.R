library("sqldf")

data <- read.csv.sql("household_power_consumption.txt"
                     ,sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
                     ,sep=";")

data$Datetime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

Sys.setlocale("LC_TIME", "C")

View(data)

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")
par(mfrow=c(2,2))

#1
plot(data$Datetime
     ,data$Global_active_power
     ,type="l"
     ,xlab=""
     ,ylab="Global Active Power")

#2
plot(data$Datetime
     ,data$Voltage
     ,type="l",
     xlab="Datetime"
     ,ylab="Voltage")

#3
plot(x=data$Datetime
     ,y=data$Sub_metering_1
     ,type="l"
     ,xlab=""
     ,ylab="Energy Sub Meetering")
lines(x=data$Datetime,y=data$Sub_metering_2, type="l",col="red")
lines(x=data$Datetime,y=data$Sub_metering_3, type="l",col="blue")

legendTxt <-c("Sub Meetering 1","Sub Meetering 2", "Sub Meetering 3")

legend("topright"
       ,c("Sub Metering 1"
          ,"Sub Metering 2"
          , "Sub Metering 3")
       ,lty=c(1,1,1)
       ,lwd=c(2.5,2.5,2.5)
       ,col=c("black","blue","red"))

#4
plot(data$Datetime
     ,data$Global_reactive_power,type="l"
     ,xlab="Datetime"
     ,ylab="Global_reactive_power")


dev.off()

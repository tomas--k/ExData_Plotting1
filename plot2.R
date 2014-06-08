library("sqldf")
data <- read.csv.sql("household_power_consumption.txt"
                     ,sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
                     ,sep=";")
data$Datetime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

View(data)

png(filename = "plot2.png"
    ,width = 480
    ,height = 480
    ,units = "px" 
   )

plot(data$Datetime
     ,data$Global_active_power,type="l"
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)")

dev.off()

library("sqldf")
data <- read.csv.sql("household_power_consumption.txt"
                     ,sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
                     ,sep=";")

View(data)

png(filename = "plot1.png"
    ,width = 480
    ,height = 480
    ,units = "px" 
   )

hist(data$Global_active_power
     ,main="Global Active Power"
     ,xlab="Global Active Power (Killowats)"
     ,col="red"
     ,ylim=c(0,1200))

dev.off()

library(sqldf)

HPC2007 <- read.csv.sql("household_power_consumption.txt",
                        header=TRUE, sep=";", 
                        sql="select * from file where Date like '1/2/2007' or Date like '2/2/2007'")

HPC2007$DateTime <- strptime(paste(HPC2007$Date, HPC2007$Time), 
                             "%d/%m/%Y %H:%M:%S")

png("plot3.png", height=480, width=480)

plot(HPC2007$DateTime, HPC2007$Sub_metering_1, ylab = "Energy sub metering", type = "l", col="black", xlab = "", main = "")
lines(HPC2007$DateTime, HPC2007$Sub_metering_2, col='red')
lines(HPC2007$DateTime, HPC2007$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", 
         "Sub_metering_2", 
         "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

dev.off()

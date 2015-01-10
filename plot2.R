library(sqldf)

HPC2007 <- read.csv.sql("household_power_consumption.txt",
                        header=TRUE, sep=";", 
                        sql="select * from file where Date like '1/2/2007' or Date like '2/2/2007'")

HPC2007$DateTime <- strptime(paste(HPC2007$Date, HPC2007$Time), 
                          "%d/%m/%Y %H:%M:%S")

png("plot2.png", height=480, width=480)

plot(HPC2007$DateTime, HPC2007$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l"  , xlab = "", main = "")


dev.off()


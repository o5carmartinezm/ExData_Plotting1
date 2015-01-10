library(sqldf)

HPC2007 <- read.csv.sql("household_power_consumption.txt",
                        header=TRUE, sep=";", 
                        sql="select * from file where Date like '1/2/2007' or Date like '2/2/2007'")

png("plot1.png", height=480, width=480)

hist(HPC2007$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red", main = "Global Active Power")

dev.off()



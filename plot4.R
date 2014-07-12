#script to plot 4 plots on one panel
#Read all data
DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
#List data of interest
GoodD <- c("1/2/2007", "2/2/2007")
#Filter for processing
DT2 <- DT[DT$Date %in% GoodD,]

#Transform date-times and numbers from characters
DT2[,2] <- paste(DT2$Date,DT2$Time)
x <- as.POSIXct(strptime(DT2[,2], format = "%d/%m/%Y %H:%M:%S"))
DT2[,3] <- as.numeric(DT2[,3])
DT2[,4] <- as.numeric(DT2[,4])
DT2[,7] <- as.numeric(DT2[,7])
DT2[,8] <- as.numeric(DT2[,8])
DT2[,9] <- as.numeric(DT2[,9])
DT2[,5] <- as.numeric(DT2[,5])

#open device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

#set overall parameters
par(bg = "grey")
par(oma=c(2,0,1,0))
par(mfrow=(c(2,2)))

#plot the four graphs
par(mar = c(3,4,2,2))
plot(x, DT2$Global_active_power, type = "l", col = "black" , ylab = "Global Active Power")

par(mar = c(4,4,2,2))
plot(x, DT2$Voltage, type = "l", col = "black" , ylab = "Voltage", xlab="datetime")

par(mar = c(3,4,2,2))
plot(x, DT2$Sub_metering_1 , type = "l", col = "black" , ylab = "Energy sub metering ")
lines(x, DT2$Sub_metering_2 , col = "red")
lines(x, DT2$Sub_metering_3 , type = "l", col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

par(mar = c(4,4,1,2))
plot(x, DT2$Global_reactive_power, type = "l", col = "black" , xlab="datetime", ylab = "Global_rctive_power")

#close the device
dev.off()
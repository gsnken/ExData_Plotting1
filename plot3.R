#Script to plot three variables on one plot
#read all data
DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

#List dates of interest
GoodD <- c("1/2/2007", "2/2/2007")

#get filtered data
DT2 <- DT[DT$Date %in% GoodD,]

#Transform date-time and numbers
DT2[,2] <- paste(DT2$Date,DT2$Time)
x <- as.POSIXct(strptime(DT2[,2], format = "%d/%m/%Y %H:%M:%S"))
DT2[,7] <- as.numeric(DT2[,7])
DT2[,8] <- as.numeric(DT2[,8])
DT2[,9] <- as.numeric(DT2[,9])

#open plotting device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)

#set parameters
par(bg = "grey")
par(mar = c(3,4,2,2))

#plot first graph
plot(x, DT2$Sub_metering_1 , type = "l", col = "black" , ylab = "Energy sub metering ")

#plot next two graphs
lines(x, DT2$Sub_metering_2 , col = "red")
lines(x, DT2$Sub_metering_3 , type = "l", col = "blue")

#write legend
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

#close device
dev.off()

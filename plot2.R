#script to plot a 2D plot
#Read all data
DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
#list dates of interest
GoodD <- c("1/2/2007", "2/2/2007")
#filter data
DT2 <- DT[DT$Date %in% GoodD,]
#Transform date-time and numerics
DT2[,2] <- paste(DT2$Date,DT2$Time)
x <- as.POSIXct(strptime(DT2[,2], format = "%d/%m/%Y %H:%M:%S"))
DT2[,3] <- as.numeric(DT2[,3])

#Open device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

#set parameters
par(bg = "grey")
par(mar = c(3,4,2,2))
#plot the graph
plot(x, DT2$Global_active_power , type = "l", ylab = "Global Active Power (kilowatts)")

#shut the device
dev.off()

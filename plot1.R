#Script to plot Single dimension data - frequenc distribution graph
#read data
DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

#filter data
GoodD <- c("1/2/2007", "2/2/2007")
DT2 <- DT[DT$Date %in% GoodD,]

#transform character data to numbers
DT2[,3] <- as.numeric(DT2[,3])

#open device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)
#set parameters
par(bg = "grey")
#plot the graph
hist(DT2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#shut the device
dev.off()
#Read the data
household <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, header = TRUE) 
#Subsetting the data
household <- subset(household,(Date == "1/2/2007" | Date == "2/2/2007")) 
#Converting the required variables into numeric
household$Global_active_power <- as.numeric(as.character(household$Global_active_power))
household$Global_reactive_power <- as.numeric(as.character(household$Global_reactive_power))
household$Voltage <- as.numeric(as.character(household$Voltage))
household$Sub_metering_1 <- as.numeric(as.character(household$Sub_metering_1)) 
household$Sub_metering_2 <- as.numeric(as.character(household$Sub_metering_2))
household$Sub_metering_3 <- as.numeric(as.character(household$Sub_metering_3))
#Create a new variable for Date and Time together
household$DateTime <- as.POSIXct(strptime(paste(household$Date, household$Time), "%d/%m/%Y %H:%M:%S"))
#Create the plots into a png file
png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
        with(household, {
                plot(DateTime, Global_active_power, xlab = "", ylab = " Global Active Power", type = "l")
                plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
                plot(DateTime, Sub_metering_1, xlab = "", ylab ="Energy sub metering", type = "l")
                points(DateTime, Sub_metering_2, type = "l", col = "red")
                points(DateTime, Sub_metering_3, type = "l", col = "blue")
                legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty = "n")
                plot(DateTime, Global_reactive_power, xlab = "datetime", type ="l")
})
dev.off()        
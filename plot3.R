#Read the data
household <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, header = TRUE) 
#Subsetting the data
household <- subset(household,(Date == "1/2/2007" | Date == "2/2/2007")) 
#Converting the required variables into numeric
household$Sub_metering_1 <- as.numeric(as.character(household$Sub_metering_1)) 
household$Sub_metering_2 <- as.numeric(as.character(household$Sub_metering_2))
household$Sub_metering_3 <- as.numeric(as.character(household$Sub_metering_3))
#Create a new variable for Date and Time together
household$DateTime <- as.POSIXct(strptime(paste(household$Date, household$Time), "%d/%m/%Y %H:%M:%S"))
#Create the plot into a png file
png("plot3.png", width = 480, height = 480)
        plot(household$DateTime, household$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        points(household$DateTime, household$Sub_metering_2, type = "l", col = "red")
        points(household$DateTime, household$Sub_metering_3, type = "l", col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()
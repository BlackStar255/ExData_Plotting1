#Read the data
household <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, header = TRUE)
#Subsetting the data
household <- subset(household,(Date == "1/2/2007" | Date == "2/2/2007"))
#Converting the required variables into numeric
household$Global_active_power <- as.numeric(as.character(household$Global_active_power))
#Create a new variable for Date and Time together
household$DateTime <- as.POSIXct(strptime(paste(household$Date, household$Time), "%d/%m/%Y %H:%M:%S"))
#Create the plot into a png file
png("plot2.png", width = 480, height = 480)
plot(household$DateTime, household$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
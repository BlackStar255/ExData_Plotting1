#Read the data
household <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, header = TRUE)
#Subsetting the data
household <- subset(household,(Date == "1/2/2007" | Date == "2/2/2007"))
#Converting the required variables into numeric
household$Global_active_power <- as.numeric(as.character(household$Global_active_power))
#Create the plot into a png file
png("plot1.png", width = 480, height = 480)
hist(household$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
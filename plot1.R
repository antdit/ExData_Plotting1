    ## read in data from file in working directory folder
data <- read.table("household_power_consumption.txt",  header=TRUE, sep=";", na.strings = "?",  colClasses=c(rep("character",2),rep("numeric",7)), stringsAsFactors=FALSE)

    ## subset data to specified date
subdata <- data[data$Date=="1/2/2007" |data$Date== "2/2/2007",]
    
    ## set Date to date format
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")

    ## combine date and time in one string 
subdata$final <- paste(subdata$Date,subdata$Time, sep=" ")

    ## format datetimestring as dat/time 
subdata$final <- strptime(subdata$final, "%Y-%m-%d %H:%M:%S")


    ## plot1: histogram

windows()

    ## create histogram
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

    ## copy to png
dev.copy(png, file="plot1.png")

    ## turn off all graphics devices
graphics.off()
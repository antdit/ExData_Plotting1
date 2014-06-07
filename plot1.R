    ## read in data from file in working directory 
data <- read.table("household_power_consumption.txt",  header=TRUE, sep=";", na.strings = "?",  colClasses=c(rep("character",2),rep("numeric",7)), stringsAsFactors=FALSE)

    ## subset data to specified dates
subdata <- data[data$Date=="1/2/2007" |data$Date== "2/2/2007",]
    
    ## set Date to date format
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")

    ## combine date and time in one string 
subdata$final <- paste(subdata$Date,subdata$Time, sep=" ")

    ## format datetimestring as date/time 
subdata$final <- strptime(subdata$final, "%Y-%m-%d %H:%M:%S")


    ## plot1: histogram

png(filename="plot1.png")

    ## create histogram
hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

    ## turn off all graphics devices
graphics.off()
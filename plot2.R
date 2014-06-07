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


    ## plot2: line chart

windows()

    ## create line chart
with(subdata, {
    plot(subdata$final, subdata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(subdata$final, subdata$Global_active_power, type="l")
    })

    ## copy to png
dev.copy(png, file="plot2.png")

    ## turn off all devices
graphics.off()
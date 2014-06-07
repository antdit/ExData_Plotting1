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




    ##plot3: multiple line chart in one plot

windows()

    ## create plot with multiple lines and legend
with(subdata, {
    plot(subdata$final, subdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(subdata$final, subdata$Sub_metering_1, type="l")
    lines(subdata$final, subdata$Sub_metering_2, type="l", col="red")
    lines(subdata$final, subdata$Sub_metering_3, type="l", col="blue")
    legend("topright", lty= 1 ,col=c("black", "red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })

    ##copy to png 
dev.copy(png, file="plot3.png")

    ## turn off all devices
graphics.off()
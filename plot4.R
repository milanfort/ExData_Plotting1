#!/usr/bin/env Rscript
#
# This script reads data from file 'household_power_consumption.txt'
# in the current working directory and creates file 'plot4.png' with
# the required plot (see README.md for details).

source('read_data.R')

createPlot <- function(data) {
    message("Creating plot")
    
    par(mfrow = c(2, 2))
    
    with(data, {
        plot(Time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
        plot(Time, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
        createPlot3(Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)    
        plot(Time, Global_reactive_power, type="l", col = "black", xlab = "datetime")
    })
}

createPlot3 <- function(x, y1, y2, y3) {
    plot(x, y1, type="l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(x, y2, type = "l", col = "red")    
    lines(x, y3, type = "l", col = "blue")
    
    legend("topright", lty = 1, box.lty = 0, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

run <- function() {
    data <- readData("household_power_consumption.txt")
    png(filename="plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
    createPlot(data)
    invisible(dev.off())
}

run()

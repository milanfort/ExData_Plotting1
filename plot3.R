#!/usr/bin/env Rscript
#
# This script reads data from file 'household_power_consumption.txt'
# in the current working directory and creates file 'plot3.png' with
# the required plot (see README.md for details).

source('read_data.R')

createPlot <- function(data) {
    message("Creating plot")
    
    plot(data$Time, data$Sub_metering_1, type="l", col = "black",
         xlab = "", ylab = "Energy sub metering")
    
    par(new = TRUE)

    plot(data$Time, data$Sub_metering_2, type="l", col = "red",
         ylim=c(0, 30), axes = FALSE, xlab = "", ylab = "")
    
    par(new = TRUE)
    
    plot(data$Time, data$Sub_metering_3, type="l", col = "blue",
         ylim=c(0, 30), axes = FALSE, xlab = "", ylab = "")
    
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

run <- function() {
    data <- readData("household_power_consumption.txt")
    png(filename="plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
    createPlot(data)
    invisible(dev.off())
}

run()

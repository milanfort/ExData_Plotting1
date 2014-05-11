#!/usr/bin/env Rscript
#
# This script reads data from file 'household_power_consumption.txt'
# in the current working directory and creates file 'plot2.png' with
# the required plot (see README.md for details).

source('read_data.R')

createPlot <- function(data) {
    message("Creating plot")
    
    plot(data$Time, data$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power (kilowatts)")
}

run <- function() {
    data <- readData("household_power_consumption.txt")
    png(filename="plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
    createPlot(data)
    invisible(dev.off())
}

run()

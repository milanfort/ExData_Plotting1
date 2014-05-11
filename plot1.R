#!/usr/bin/env Rscript
#
# This script reads data from file 'household_power_consumption.txt'
# in the current working directory and creates file 'plot1.png' with
# the required plot (see README.md for details).

source('read_data.R')

createPlot <- function(data) {
    message("Creating plot")
    
    hist(data$Global_active_power, main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)", col = "red")
}

run <- function() {
    data <- readData("household_power_consumption.txt")
    png(filename="plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
    createPlot(data)
    invisible(dev.off())
}

run()


# Reads data from the specified file. Removes all observations
# except those between dates 2007-02-01 and 2007-02-02.
# Returns the cleaned data frame.
readData <- function(filename = "household_power_consumption.txt") {
    message(paste("Reading data from file", filename))
    
    data <- read.table(filename, header=TRUE, sep=";", na.strings="?",
                       colClasses = c("character", "character", "numeric", "numeric",
                                      "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    startDate <- as.Date("2007-02-01")
    endDate <- as.Date("2007-02-02")
    index <- data$Date >= startDate & data$Date <= endDate
    
    data[index, ]
}

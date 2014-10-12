# ----PLOT 1----

# Created by Ilia Lvov
# This sctipt creates the first plot for the assignment
# The assignment details can be found in README.md

# ----FUNCTIONS----

sourceReadDataR <- function() {
      # This function creates the data for this assignment in a data frame: hpc_data
      # It does it by sourcing another script in this repository: readData.R
      # You can read its description inside the readData.R file
      source("readData.R")
}

makePlot <- function() {
      # This function creates the required plot, i.e. a histogramm of the Global active power variable
      # First, it specifies some constants
      x_axis_name <- "Global Actite Power (kilowatts)"
      hist_title <- "Global Active Power"
      hist_data <- hpc_data$Global_active_power
      # Then it calls PNG constructor with the specified parametres
      png("plot1.png", width = 480, height = 480)
      hist(hist_data, main = hist_title, xlab = x_axis_name, col = "red")
      dev.off()
}

# ----SCRIPT----

# The script consequently calls the two its functions:
# First it reads the data, then it makes the plot

sourceReadDataR()
makePlot()
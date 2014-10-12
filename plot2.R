# ----PLOT 2----

# Created by Ilia Lvov
# This sctipt creates the second plot for the assignment
# The assignment details can be found in README.md

# ----FUNCTIONS----

sourceReadDataR <- function() {
      # This function creates the data for this assignment in a data frame: hpc_data
      # It does it by sourcing another script in this repository: readData.R
      # You can read its description inside the readData.R file
      source("readData.R")
}

makePlot <- function() {
      # This function creates the required plot, i.e. time series of the Global active power variable
      # First, it specifies some constants
      y_axis_name <- "Global Actite Power (kilowatts)"
      x_data <- hpc_data$Full_time
      y_data <- hpc_data$Global_active_power
      # Then it calls PNG constructor with the specified parametres
      png("plot2.png", width = 480, height = 480)
      # type="n" speficies that no dots are required
      plot(x_data, y_data, main = NULL, xlab = "", ylab = y_axis_name, col = "black", type = "n")
      # Lines that connect the (x;y) pairs are added
      lines(x_data, y_data)
      dev.off()
}

# ----SCRIPT----

# The script consequently calls the two its functions:
# First it reads the data, then it makes the plot

sourceReadDataR()
makePlot()
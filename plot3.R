# ----PLOT 3----

# Created by Ilia Lvov
# This sctipt creates the third plot for the assignment
# The assignment details can be found in README.md

# ----FUNCTIONS----

sourceReadDataR <- function() {
      # This function creates the data for this assignment in a data frame: hpc_data
      # It does it by sourcing another script in this repository: readData.R
      # You can read its description inside the readData.R file
      source("readData.R")
}

makePlot <- function() {
      # This function creates the required plot, i.e. time series of the Energy sub metering
      # First, it specifies some constants
      y_axis_name <- "Energy sub metering"
      hist_title <- "Global Active Power"
      x_data <- hpc_data$Full_time
      y_data_1 <- hpc_data$Sub_metering_1
      y_data_2 <- hpc_data$Sub_metering_2
      y_data_3 <- hpc_data$Sub_metering_3
      col_1 <- "black"
      col_2 <- "red"
      col_3 <- "blue"
      leg_text <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
      leg_col <- c(col_1, col_2, col_3)
      # Then it calls PNG constructor with the specified parametres
      png("plot3.png", width = 480, height = 480)
      # type="n" speficies that no dots are required
      # It is important to send sub_metering_1 as the y-data here, as it has the highest maximal value.
      plot(x_data, y_data_1, main = NULL, xlab = "", ylab = y_axis_name, col = "black", type = "n")
      # Lines that connect the (x;y) pairs for all the three submeterings are added
      lines(x_data, y_data_1, col = col_1)
      lines(x_data, y_data_2, col = col_2)
      lines(x_data, y_data_3, col = col_3)
      #Finally, a legend is added
      legend("topright", leg_text, col = leg_col, lty = 1, lwd = 4)
      dev.off()
}

# ----SCRIPT----

# The script consequently calls the two its functions:
# First it reads the data, then it makes the plot

sourceReadDataR()
makePlot()
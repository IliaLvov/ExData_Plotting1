# ----PLOT 4----

# Created by Ilia Lvov
# This sctipt creates the fourth plot for the assignment
# The assignment details can be found in README.md

# ----FUNCTIONS----

sourceReadDataR <- function() {
      # This function creates the data for this assignment in a data frame: hpc_data
      # It does it by sourcing another script in this repository: readData.R
      # You can read its description inside the readData.R file
}      

makePlot <- function() {
      # This is a "global" plotting function
      # It calls the constructor that is aimed to draw the four plots on one canvas
      # Then it calls individual functions for each of the four plots.
      source("readData.R")
      png("plot4.png", width = 480, height = 480)
      par(mfcol=c(2,2))
      topLeft()
      bottomLeft()
      topRight()
      bottomRight()
      dev.off()
}

topLeft <- function () {
      # This function creates the top-left part of thje plot, i.e. time series of the Global active power variable
      # It does not call any constructor though, it just plots
      # First, it specifies some constants
      y_axis_name <- "Global Actite Power"
      x_data <- hpc_data$Full_time
      y_data <- hpc_data$Global_active_power
      # Then it plots
      # type="n" speficies that no dots are required
      plot(x_data, y_data, main = NULL, xlab = "", ylab = y_axis_name, col = "black", type = "n")
      # Lines that connect the (x;y) pairs are added
      lines(x_data, y_data)
}

bottomLeft <- function() {
      # This function creates the bottom-left part of the plot, i.e. time series of the Energy sub metering
      # It does not call any constructor though, it just plots
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
      # Then it plots
      # type="n" speficies that no dots are required
      # It is important to send sub_metering_1 as the y-data here, as it has the highest maximal value.
      plot(x_data, y_data_1, main = NULL, xlab = "", ylab = y_axis_name, col = "black", type = "n")
      # Lines that connect the (x;y) pairs for all the three submeterings are added
      lines(x_data, y_data_1, col = col_1)
      lines(x_data, y_data_2, col = col_2)
      lines(x_data, y_data_3, col = col_3)
      #Finally, a legend is added
      legend("topright", leg_text, col = leg_col, lty = 1, lwd = 2)
}

topRight <- function () {
      # This function creates the top-right part of the plot, i.e. black time series of the Voltage variable
      # It does not call any constructor though, it just plots
      # First, it specifies some constants
      x_axis_name <- "Date/Time"
      y_axis_name <- "Voltage"
      x_data <- hpc_data$Full_time
      y_data <- hpc_data$Voltage
      # Then it plots
      # type="n" speficies that no dots are required
      plot(x_data, y_data, main = NULL, xlab = x_axis_name, ylab = y_axis_name, col = "black", type = "n")
      # Lines that connect the (x;y) pairs are added
      lines(x_data, y_data)
}

bottomRight <- function() {
      # This function creates the top-right part of the plot, i.e. black time series of the Global reactive power variable
      # It does not call any constructor though, it just plots
      # First, it specifies some constants
      x_axis_name <- "Date/Time"
      y_axis_name <- "Global reactive power"
      x_data <- hpc_data$Full_time
      y_data <- hpc_data$Global_reactive_power
      # Then it plots
      # type="n" speficies that no dots are required
      plot(x_data, y_data, main = NULL, xlab = x_axis_name, ylab = y_axis_name, col = "black", type = "n")
      # Lines that connect the (x;y) pairs are added
      lines(x_data, y_data)
}

# ----SCRIPT----

# The script consequently calls two of its functions: sourceReadDataR and makePlot
# Hence, it first it reads the data, then it makes the plot

sourceReadDataR()
makePlot()

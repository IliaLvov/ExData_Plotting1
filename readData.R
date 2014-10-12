# ----READ DATA----

# Created by Ilia Lvov
# This short script reads the data for the assignment
# The assignment details can be found in README.md

# ----FUNCTIONS----

downloadData <- function() {
      # This function is used to download the data from the Internet
      # It is added to maximise reproducibility
      # Beware, it may only work when you run R on Mac
      # Otherwise, you will need to specify another method for "dowload.file()"
      url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download_date <- date()
      archieve_name <- paste(download_date, ".zip")
      download.file(url, destfile = archieve_name, method = "curl")
      unzip(archieve_name)
      file.remove(archieve_name)
      download_date_file_name <- paste("Data downloaded on", download_date)
      file.create(download_date_file_name)
}

makeDataFrame <- function () {
      # This function creates an appropriate data frame
      # First, it reads in appropriate rows of the file
      # Finally, it converts Date and Time appropriately and adds a column that merges them into a single variable: Full_time
      a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", nrows = 2880, skip = 66636)
      # Then it fixes the column names, that are initially messed due to the skipped rows
      names_for_a <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", nrows = 1)
      colnames(a) <- colnames(names_for_a)
      # Finally, it creates a neatly POSIX-formatted variable combining date and time: Full_time
      a <- transform(a, Char_date = as.Date(Date, format = "%d/%m/%Y"))
      a <- transform(a, Char_date = as.character(Char_date))
      a <- transform(a, Full_time = as.POSIXlt(paste(Char_date, Time), format="%Y-%m-%d %H:%M:%S"))
      a <- subset(a, select = -Char_date)
} 

readData <- function () {
      # This function performes the whole data reading cycle
      # First, it checks if the data is already downloaded.
      # If yes, it calls makeDataFrame() straight away.
      # If no, it first calls downloadData().
      # Beware, it checks this by searching for an appropriately named file in the working directory.
      # If you have a file with such a name, but it's a wrong one, you get what you deserve.
      # If you have the right file but inappropriately named, the function will do an unnessesary but harmless job
      if(!file.exists("household_power_consumption.txt")) {
            downloadData()
      }
      makeDataFrame()
}

# ----SCRIPT----

# This script calls one function: readData
# You can find its description and desrciptions of other functions used by it below
# The outcome of the function call is a new data frame: hpc_data

hpc_data <- readData()

###################################
# LOADING AND TRANSFORMING THE DATA
###################################

data.dir <- getwd()

# reading the data set and transforming '?' into NA
data <- read.table(paste(data.dir, "/household_power_consumption.txt", sep=""), sep=";", na.strings = "?")

# subsetting data
indexes <- which((data$V1 == "1/2/2007") | (data$V1 == "2/2/2007"))
data <- data[indexes, ]

# converting the Date and Time variables to Date/Time classes in R
x <- paste(data$V1, data$V2)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")

# transforming data table
data <- cbind(x, data[3:9])
names(data) <- c("Data/Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


#################
# MAKING THE PLOT
#################


# from factor to numeric
data[,2] <- as.numeric(as.character(data[,2]))




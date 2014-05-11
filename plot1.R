
###################################
# LOADING AND TRANSFORMING THE DATA
###################################

data.dir <- getwd()

# reading the data set and transforming '?' into NA
data <- read.table(paste(data.dir, "/household_power_consumption.txt", sep=""), sep=";", na.strings = "?")

# subsetting data
indexes <- which((data$V1 == "1/2/2007") | (data$V1 == "2/2/2007"))
data <- data[indexes, ]


#################
# MAKING THE PLOT
#################


# from factor to numeric
data[,3] <- as.numeric(as.character(data[,3]))


png("plot1.png", width = 480, height = 480)

# plotting histogram 
hist(data[,3], col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()

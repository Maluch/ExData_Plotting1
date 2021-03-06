
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
x <- strptime(paste(data$V1, data$V2), "%d/%m/%Y %H:%M:%S")

# transforming data table
data <- cbind(x, data[3:9])
names(data) <- c("Data/Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#################
# MAKING THE PLOT
#################

# if you use locally other language than english - to get x axis in english
Sys.setlocale("LC_TIME", "English")

# from factor to numeric
data[,2] <- as.numeric(as.character(data[,2]))
data[,3] <- as.numeric(as.character(data[,3]))
data[,4] <- as.numeric(as.character(data[,4]))
data[,6] <- as.numeric(as.character(data[,6]))
data[,7] <- as.numeric(as.character(data[,7]))
data[,8] <- as.numeric(as.character(data[,8]))


# plotting

png("plot4.png", width = 480, height = 480)

op <- par(mfrow = c(2, 2))

# chart 1,1
plot(data[,1], data[,2], type="l", ylab="Global Active Power", xlab="")

# chart 1,2
plot(data[,1], data[,4], type="l", ylab="Voltage", xlab="datetime")

# chart 2,1
plot(data[,1], data[,6], type="l", ylab="Energy sub metering", xlab="")
lines(data[,1], data[,7], col="red")
lines(data[,1], data[,8], col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1, 1, 1))

# chart 2,2
plot(data[,1], data[,3], type="l", ylab="Global_reactive_power", xlab="datetime")


par(op)
dev.off()

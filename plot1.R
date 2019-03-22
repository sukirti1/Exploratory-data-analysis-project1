# Read data from the table
data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert the factor date into date using as.date function
data$Date<- as.Date(data$Date, format= "%d/%m/%Y")

# create a data frame from the data where date is between 2007=02=01 and 2007-02-02
data<- data[data$Date>= "2007-02-01" & data$Date <= "2007-02-02",]
data$Global_active_power<- as.numeric(data$Global_active_power)

# call the png plotting system
png("plot1.png", width = 480, height = 480)

# plot the histogram in the png file
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# turn off the plotting system
dev.off()

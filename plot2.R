# Read data from the table
data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert the factor date into date using as.date function
data$Date<- as.Date(data$Date, format= "%d/%m/%Y")
data$Global_active_power<- as.numeric(as.character(data$Global_active_power))

# create a data frame from the data where date is between 2007=02=01 and 2007-02-02
data<- data[data$Date>= "2007-02-01" & data$Date <= "2007-02-02",]

# create a datetime vector which combines the date and time from the data
datetime<- paste(as.Date(data$Date), data$Time) 

# create dateTime vector by using posixct
data$dateTime<- as.POSIXct(datetime)

# call the png plotting system
png("plot2.png", width = 480, height = 480)

# plot the graph
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# close the system
dev.off()





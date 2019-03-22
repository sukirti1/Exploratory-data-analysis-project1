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
png("plot3.png", width = 480, height = 480)

# plot the graph
with(data, {  plot(Sub_metering_1~dateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
              lines(Sub_metering_2~dateTime,col='Red')
              lines(Sub_metering_3~dateTime,col='Blue')
         })
legend("topright", col = c("black", "red", "blue"),lty=1,lwd=2,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the system
dev.off()
# Exploratory Analysis
# Project #1

# reads the entire dataset
data<-read.delim(file="household_power_consumption.txt",
                 header=T,
                 sep=";",
                 na.string="?")

head(data) # shows the first k records

names(data)

summary(data$Global_intensity) # Verify NA's were correctly coded

str(data) # verifying dimensions

data3 <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]


dates <- data3$Date
times <- data3$Time
x <- paste(dates, times)
DateTime<-strptime(x, "%d/%m/%Y %H:%M:%S")

data3<-cbind(data3,DateTime)


with(data3, plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)" ),
     lines(Sub_metering_2, col="red"))


dev.copy(png,'plot2.png')
dev.off()

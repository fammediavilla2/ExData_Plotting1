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

par(mfcol=c(2,2))
with(data3, hist(Global_active_power~data3$DateTime, 
                 main="Global Active Power",
                 xlab="Global Active Power (kilowatts)"))

plot(data3$Global_active_power~data3$DateTime, type="l", ylab="Global_active_power", xlab="" )

plot(data3$Sub_metering_1~data3$DateTime, type="l", ylab="Energy sub metering", xlab="" )
lines(data3$Sub_metering_2~data3$DateTime, col="red")
lines(data3$Sub_metering_3~data3$DateTime, col="blue")
legend("topright", col=c("black", "red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data3, plot(Voltage~DateTime, type="l",
                 ylab="Voltage",
                 xlab="datetime"))


with(data3, plot(Global_reactive_power~DateTime, type="l",
                 ylab="Global_reactive_power",
                 xlab="datetime"))


par(mfcol=c(1,1))

dev.copy(png,'plot4.png')
dev.off()

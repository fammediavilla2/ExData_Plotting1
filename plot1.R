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

#data3 <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

data1<-subset(data, as.factor(data$Date)=="1/2/2007")
data2<-subset(data, as.factor(data$Date)=="2/2/2007")

data3<-rbind(data1,data2)
names(data3)


table(data3$Date)

with(data3, hist(Global_active_power, col="red",
                 main="Global Active Power",
                 xlab="Global Active Power (kilowatts)"))


dev.copy(png,'plot1.png')
dev.off()

setwd("~/Documents/coursera/getdata/ExData_Plotting1")

# Read in table, making sure to get sep and na values all in one statement
hpc <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?", sep = ";")

#Convert to date format
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")

# Subset data to only teh required dates
hpc<-subset(hpc,Date>="2007-02-01" & Date<="2007-02-02")

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

#Write plot to PNG file
png(filename = "plot4.png",width = 480,height = 480)

#set Device to 2x2 display
par(mfrow = c(2,2)) 
#plot1
plot(hpc$DateTime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#plot2
plot(Voltage~DateTime,hpc,type="l")
#plot3
plot((hpc$DateTime),hpc$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")
legend("topright",lwd=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n")
#plot4
plot(Global_reactive_power~DateTime,hpc,type="l")

dev.off()

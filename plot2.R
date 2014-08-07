setwd("~/Documents/coursera/getdata/ExData_Plotting1")

# Read in table, making sure to get sep and na values all in one statement
hpc <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?", sep = ";")

#Convert to date format
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")

# Subset data to only teh required dates
hpc<-subset(hpc,Date>="2007-02-01" & Date<="2007-02-02")

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

#Write plot to PNG file
png(filename = "plot2.png",width = 480,height = 480)
plot((hpc$DateTime),hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

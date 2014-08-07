setwd("~/Documents/coursera/getdata/ExData_Plotting1")

# Read in table, making sure to get sep and na values all in one statement
hpc <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?", sep = ";")

#Convert to date format
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")

# Subset data to only teh required dates
hpc<-subset(hpc,Date>="2007-02-01" & Date<="2007-02-02")

#Write histogram to PNG file
png(filename = "plot1.png",width = 480,height = 480)
hist(hpc$Global_active_power,main="Global Active Power",col="Red",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()

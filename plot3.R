#Get the column names from raw data
cnames <- read.table("household_power_consumption.txt",sep=";",nrows = 2,header=TRUE)
cnames <- colnames(cnames)

#Read the relevant rows into workspace from the raw data
data <- read.table("household_power_consumption.txt",sep=";",nrows = 2880,skip = 66637,col.names=cnames)

#Change the format of column "Date"
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

#Create a column containing both date and time
temp <- paste(as.Date(data$Date), data$Time)
data$UniTime <- as.POSIXct(temp)

#Plot 
par(mfrow=c(1,1))
with(data, {
    plot(UniTime,Sub_metering_1, type="l",
         ylab="Energy sub metering", xlab="")
    lines(UniTime,Sub_metering_2,col='Red')
    lines(UniTime,Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1)

#Save plot into png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

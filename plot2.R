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
with(data,plot(UniTime, Global_active_power, type="l",
           ylab="Global Active Power (kilowatts)", xlab=""))

#Save plot into png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

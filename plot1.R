#Get the column names from raw data
cnames <- read.table("household_power_consumption.txt",sep=";",nrows = 2,header=TRUE)
cnames <- colnames(cnames)

#Read the relevant rows into workspace from the raw data
data <- read.table("household_power_consumption.txt",sep=";",nrows = 2880,skip = 66637,col.names=cnames)

#Plot the hist for Global_active_power
par(mfrow=c(1,1))
with(data,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
               main="Global Active Power"))

#Save plot into png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


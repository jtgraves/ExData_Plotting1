download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile="IndiviualHouseholdElectricPowder.zip", method="curl")

all<-read.table(unzip("IndiviualHouseholdElectricPowder.zip"), header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

inrange <- all[(all[,1] == "1/2/2007") | (all[,1] == "2/2/2007"),]
df<-as.data.frame(inrange)
df$dateTime <-strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(df$dateTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(df$dateTime,df$Voltage,type="l",ylim=c(234,246),xlab="datetime",ylab="Voltage")
plot(df$dateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
points(df$dateTime,df$Sub_metering_2,type="l",col="red") 
points(df$dateTime,df$Sub_metering_3,type="l",col="blue") 
legend("topright", lty=1,  bty = "n",col = c("black","blue", "red"), legend = c("sub_metering_1 ","sub_metering_2","sub_metering_3 "))
plot(df$dateTime,df$Global_reactive_power,type="l",ylim=c(0,0.5),xlab="datetime",ylab="Global_reactive_power")
dev.off()

download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile="IndiviualHouseholdElectricPowder.zip", method="curl")

all <- read.table(unzip("IndiviualHouseholdElectricPowder.zip"), header=TRUE, sep=";")
inrange <- subset(all, Date %in% c("1/2/2007", "2/2/2007"))
inrange[,3] <- as.numeric(inrange[,3])
datetime <- strptime(paste(inrange$Date, inrange$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
foo <- cbind(inrange, datetime)
foo <- mutate(foo, GAP_KW = (Global_active_power/1000)*2)

png(filename="plot2.png", width=480, height=480)
plot(subData$DateTime, subData$GAP_KW,ylab="Global Active Power (kilowatts)",xlab=" ", type="l")
dev.off()


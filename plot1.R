download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile="IndiviualHouseholdElectricPowder.zip", method="curl")

all <- read.table(unzip("IndiviualHouseholdElectricPowder.zip"), header=TRUE, sep=";")

inrange <- subset(allData, Date %in% c("1/2/2007", "2/2/2007"))

datetime <- strptime(paste(inrange$Date, inrange$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
foo <- cbind(inrange, datetime)

foo[,3] <- as.numeric(foo[, 3])
foo <- mutate(foo, GAP_KW = (Global_active_power/1000)*2)

png(filename="plot1.png", width=480, height=480)
plot1 <- hist(foo$GAP_KW, col="red", ylim=c(0,1200), xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

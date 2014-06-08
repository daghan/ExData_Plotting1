if (!file.exists("./project1"))
    dir.create("./project1")
# setwd("./project1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./project1/data.zip",method='curl')
file <- as.character(unzip("./project1/data.zip", list=TRUE)[1])
unzip("./project1/data.zip", files=file,exdir="./project1")
# cols <- read.table(paste0("./project1/",file), sep=";", nrows=1); 
df <- read.table(paste0("./project1/",file), sep=";", skip=66637, nrows=2880, na.strings="?") 
colnames(df) <- c("Date", "Time", "Global_active_power",
            "Global_reactive_power", "Voltage", "Global_intensity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
tmp <- paste(df$Date,df$Time)
df$Time <- strptime(tmp, format="%Y-%m-%d %H:%M:%S")
#head(df,5)
#tail(df,5)

#plot1
png(file="./plot1.png",width=480,height=480)
hist(df$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")
dev.off()

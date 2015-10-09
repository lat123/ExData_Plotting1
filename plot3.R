#Exploratory Analysis Course Project 1 - plot 3

#Data:UC Irvine Machine Learning Repository - Electric power consumption 

#Prerequisits: 
#(1) The data has been extracted
#(2) The data is available in the directory "exdata_data_household_power_consumption"


#Read data (missing values are coded as ?); convert factor variable "Date" 
#into Date; subset dataset for values within the selected interval  
filepath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
df <- read.table(filepath, header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
interval <- df$Date >= "2007-02-01" & df$Date <= "2007-02-02"
df <- df[interval,]

#Combine data and time (factors) and convert them into Date/Time" 
#into Date; subset dataset for values within the selected interval  
df$date_time <- strptime (paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

#Open png graphical device; create plot the analysis of "Sub_metering_1"  
#over time; add red line for "Sub_metering_2"; then add blue line for 
#"Sub_metering_3"; finally add legend; then close graphical device 
png(file = "plot3.png", width = 480, height = 480)
with(df, plot(date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df, lines(date_time, Sub_metering_2, type = "l", col = "red"))
with(df, lines(date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", names(df[,7:9]), col = c("black", "red", "blue"),lty = 1)
dev.off()

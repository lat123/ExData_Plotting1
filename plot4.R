#Exploratory Analysis Course Project 1 - plot 4

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

#Open png graphical device; set vector for the priting of graphs by row (2x2)
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#(1,1) create histogram for the analysis of "Global Active Power" frequency
with(df, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#(1,2) create plot for the analysis of Voltage over time
with(df, plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#(2,1)create plot the analysis of "Sub_metering_1" over time;  
#add red line for "Sub_metering_2"; then add blue line for 
#"Sub_metering_3"; finally add legend
with(df, plot(date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df, lines(date_time, Sub_metering_2, type = "l", col = "red"))
with(df, lines(date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", names(df[,7:9]), col = c("black", "red", "blue"),lty = 1, bty = "n")

#(2,2)create plot the analysis of "Global_reactive_power" over time
with(df, plot(date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

#close graphical device 
dev.off()

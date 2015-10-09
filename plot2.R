#Exploratory Analysis Course Project 1 - plot 2

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

#Open png graphical device; create plot the analysis of "Global 
#Active Power" comsuption over time; close graphical device 
png(file = "plot2.png", width = 480, height = 480)
with(df, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
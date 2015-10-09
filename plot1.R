#Exploratory Analysis Course Project 1 - plot 1

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

#Open png graphical device; create histogram for the analysis of "Global 
#Active Power" frequency; close graphical device 
png(file = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

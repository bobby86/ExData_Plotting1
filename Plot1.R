## Coursera Exploratory Data Analysis, Week 1 Assingment by Pradeep
## Reading Data from the text file and subsetting the required data(2007 Feb. 1st and 2nd ) 
HPC <- read.table("./HouseHold_Power_Consumption.txt", header = TRUE, sep = ";")

## subsetting the data for 1st and 2nd of Feb 2007 from HPC.
HPC2007 <- HPC[as.Date(HPC$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(HPC$Date, "%d/%m/%Y") <= "2007-02-02", ]

HPCColNames <- names(HPC)

## Alternate Command to read the data
HPCColNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage"
                 , "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

HPC200702 <- read.table("./HouseHold_Power_Consumption.txt"
                        , header = TRUE
                        , sep = ";"
                        , skip = 66636
                        , nrows = 2880
                        , col.names = HPCColNames
                        )
## Note: when the data is read with this R statement;column values are already numeric.

##Plotting the Histogram in a .png file
png(filename = "./Plot1.png", width = 480, height = 480, units = "px")

hist(HPC200702$Global_active_power
     , col = "red"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , main = "Global Active Power"
     )

mtext("Plot 1", at = c(-1.5) , side = 3, line = 3, adj = 0, font = 2, outer = FALSE)

dev.off()
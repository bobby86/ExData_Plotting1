## Coursera Exploratory Data Analysis, Week 1 Assingment by Pradeep
## Reading Data from the text file based on the starting row # on total rows to be read 
## creating the column names vector
HPCColNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage"
                 , "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
## reading the data
HPC200702 <- read.table("./HouseHold_Power_Consumption.txt"
                        , header = TRUE
                        , sep = ";"
                        , skip = 66636
                        , nrows = 2880
                        , col.names = HPCColNames
                        )
## Note: when the data is read with this R statement;column values are already numeric.

##Plotting the boxplot in a .png file
png(filename = "./Plot2.png", width = 480, height = 480, units = "px")

with(HPC200702
     , plot(1:2880
            , Global_active_power
            , type = "l"
            , axes=FALSE
            , frame.plot=TRUE
            , xlab = NA
            , ylab = "Global Active Power (kilowatts)"
     )
)
## Setting X-Axis
axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
## Setting Y-Axis
axis(2, at = seq(0,8, by= 2))

mtext("Plot 2", at = c(-500), side = 3, line = 3, adj = 0, font = 2, outer = FALSE)

dev.off()



#### plot4.R

## I prefer to first tidy up the local environment by deleting all objects
rm(list=ls())

## Close graphics windows that might be open 
graphics.off()      

## Open subsetted data file that was created by plot1.R and updated by plot2.R by
#  attaching datetime to the data frame
electSub <- read.csv("./data1/electSub.csv",head = TRUE, stringsAsFactors = FALSE)
attach(electSub)

## Open graphic device. I have specfied the height and width, although in this 
#  case the specification is redundant since the default height and width is 480
png(file = "plot4.png", height = 480, width = 480)

## Specify the number of graphs in terms of rows and columns.  
#  2 rows by 2 columns, for 4 total graphs  
par(mfrow = c(2,2));

## Widen the left margin just a wee bit
par(oma = c(0,1,0,0));

## convert datetime back into a POSIXlt variable
datetime <- as.POSIXlt(datetime)

## Plot upper left graph, which will be the same as plot2.png with a slightly 
#  different Y axis label
plot(datetime, Global_active_power ,type = "l", xlab = "", ylab = "Global Active Power")

## Plot upper right graph, which is similar to plot2.png but uses default axis
#  labels with Voltage plotted on the Y axis
plot(datetime, Voltage, type = "l")

## Plot lower left panel, which is the same as plot3.png except that the 
#  legend is relatively larger and without the box around it
plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",type = "l")
par(new=T)
lines(datetime, Sub_metering_2, col="red")
par(new=T)
lines(datetime, Sub_metering_3, col="blue")

legend("topright", lty = 1, bty = "n", col = c(1,2,3), legend = c("Sub_metering_1",
       "Sub_metering_2", "Sub_metering_3"), cex=.9)

## Plot lower right graph, which is similar to plot2.png but uses default axis
#  labels with Global_reactive_power plotted on the Y axis
plot(datetime, Global_reactive_power, type="l")

## Close graphic device
dev.off()
detach(electSub)
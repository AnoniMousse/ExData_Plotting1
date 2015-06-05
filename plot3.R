#### plot3.R 

## I prefer to first tidy up the local environment by deleting all objects
rm(list=ls())

## Close graphics windows that might be open 
graphics.off()      

## Open subsetted data file that had been created by plot1.R and was updated by plot2.R by
#  attaching datetime to the data frame
electSub <- read.csv("./data1/electSub.csv", head = TRUE,stringsAsFactors = FALSE)
attach(electSub)

## convert datetime back into a POSIXlt variable
datetime <- as.POSIXlt(datetime)

## Open graphic device. I have specfied the height and width, although in this 
#  case the specification is redundant since the default height and width is 480
png(file = "plot3.png", height = 480, width = 480,)

## Set margins to more closely resemble the model graphs
par(mar=c(5,5,5,2))

## Plot actual graph, starting with first line, with default color = "black"
plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")

## Plot second line to graph
par(new=T)
lines(datetime, Sub_metering_2, col = "red")

## Plot third line to graph
par(new=T)
lines(datetime,Sub_metering_3, col = "blue")

## Create legend as specified
legend("topright", lty = 1, col = c(1, 2, 3), legend = c("Sub_metering_1",
                "Sub_metering_2", "Sub_metering_3"), cex=.9)

## Turn graphic device off
dev.off()
detach(electSub)
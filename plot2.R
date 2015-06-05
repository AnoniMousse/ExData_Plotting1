#### Plot2.R

##I prefer to first tidy up the local environment by deleting all objects
rm(list=ls())

## Close graphics windows that might be open 
graphics.off()      

## Open subsetted data file that was created by plot1.R
electSub <- read.csv("./data1/electSub.csv",head = TRUE,stringsAsFactors = FALSE)
attach(electSub)

## Create a POSIXlt variable named datetime by pasting Date and Time together
#  and calling the result with strptime
datetime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") 

## Attach datetime to the data frame
electSub$datetime <- datetime

## Write subsetted data to disk in a subdirectory of the working directory called "data1"
#  for use in the next R file (Plot3.R)
write.csv(electSub,"./data1/electSub.csv",row.names = FALSE)

## Open graphic device. I have specfied the height and width, although in this 
#  case the specification is redundant since the default height and width is 480
png(file = "plot2.png", height = 480, width = 480,)

## Set margins to more closely resemble the model graphs
par(mar=c(5,5,5,2))

## Create actual plot
plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Turn graphic device off
dev.off()
detach(electSub)
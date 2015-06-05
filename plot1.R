### plot1.R
## I prefer to first tidy up the local environment by deleting all objects
rm(list=ls())
## Close graphics windows that might be open 
graphics.off()      

## Open a connection to the data on the website and download.
## Specify the classes of the variables. Convert "?" to NA when found in the data.
## THIS MAY TAKE SEVERAL MINUTES. PLEASE BE PATIENT.
tempo <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tempo)
electric <- read.table(unz(tempo, "household_power_consumption.txt"), head=TRUE, sep=";", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings=c("?"))
unlink(tempo)

## The data are assumed to be unzipped in a subdirectory of the working directory
#  called "data1"
# electric <- read.table("./data1/household_power_consumption.txt", head=TRUE,
#                        sep=";", stringsAsFactors = FALSE)
str(electric)
## Convert Date to a date format variable
dates <- as.Date(electric$Date, "%d/%m/%Y")

## Subset out those records with the specified dates
electSub <- subset(electric, dates == "2007-02-02"|dates =="2007-02-01")
attach(electSub)

## Write subsetted data to disk in the subdirectory of the working directory 
#  called "data1" for use in creating the next three graphs (Plot2.png, Plot3.png,
#  and Plot4.gnp)
#  If subdirctory data1 does not exist, then create it.
if (!file.exists("data1")){
    dir.create("data1")
}
#  Write subsetted data to file
write.csv(electSub,"./data1/electSub.csv",row.names = FALSE)

## Open graphic device. I have specfied the height and width, although in this 
#  case the specification is redundant since the default height and width are 480
png(file = "plot1.png", width=480, height=480)

## Set margins to more closely resemble the model graphs
par(mar=c(5,5,5,2))

##  Create the actual histogram using the base plotting system 
hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",main="Global Active Power",col = "red")

## Turn graphics device off
dev.off()
detach(electSub)

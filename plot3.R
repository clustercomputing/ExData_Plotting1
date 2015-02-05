library(data.table)
#please check your wd and the data location, and set this accordingly
setwd("~/Documents/projects/data_science_specialization/Exploratory_Data_Analysis/ExData_Plotting1/")
data<-fread("household_power_consumption.txt",header=T,colClasses="character")

#convert Date into date type
data[,Date:=as.Date(Date,"%d/%m/%Y")]

# pick appropriate data for plotting
data<-data[Date>="2007-02-01"&Date<="2007-02-02"]

# convert others to numeric columns
data[,c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"):=
             list(as.numeric(Global_active_power),as.numeric(Global_reactive_power),as.numeric(Voltage),as.numeric(Global_intensity),as.numeric(Sub_metering_1),as.numeric(Sub_metering_2),as.numeric(Sub_metering_3))]

# getting thursday, friday, saturday data
data[,dayofwk:=format(Date,"%a")]
# combining Date and Time columns
data[,datetime:=as.POSIXct(paste(Date,Time))]

# Create png devise
png(file="plot3.png",bg="white",width=480,height=480,units="px")
# plot graph
with(data,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",cex.lab=0.75,cex.axis=0.75))
lines(data$datetime,data$Sub_metering_2,type="l",col="red")
lines(data$datetime,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"),cex=0.75)
dev.off()

# the plot.png should be saved into your working directory


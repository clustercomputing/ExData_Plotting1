library(data.table)
#please check your wd and the data location, and set this accordingly
setwd("Documents/projects/data_science_specialization/Exploratory_Data_Analysis/external/ExData_Plotting1/")
data<-fread("household_power_consumption.txt",header=T,colClasses="character")

#convert Date into date type
data[,Date:=as.Date(Date,"%d/%m/%Y")]

# pick appropriate data for plotting
data<-data[Date>="2007-02-01"&Date<="2007-02-02"]

# convert others to numeric columns
data[,c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"):=
             list(as.numeric(Global_active_power),as.numeric(Global_reactive_power),as.numeric(Voltage),as.numeric(Global_intensity),as.numeric(Sub_metering_1),as.numeric(Sub_metering_2),as.numeric(Sub_metering_3))]

# Create png devise
png(file="plot1.png",bg="transparent",width=480,height=480,units="px")
# plot histogram
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()

# the plot.png should be saved into your working directory


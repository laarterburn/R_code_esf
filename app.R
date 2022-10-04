#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#Packages
library(shiny)
library(dplyr)
library(tidyverse)
library(lubridate)


################DATA FOR SHINY APP CODE################

#File Uploads
NYC_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\NYC_aqidaily2020 .csv")
Miami_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\Miami_aqidaily2020 (3).csv")
LA_AQI_Data<-read.csv( "C:\\Users\\linda\\Downloads\\LA_aqidaily2020 (5).csv")
Orlando_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\Orlando_aqidaily2020 (4).csv")
SanFrancisco_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\sanfran_aqidaily2020 (6).csv")
LasVegas_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\LAV_aqidaily2020 (7).csv")
WashingtonDC_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\DMV_aqidaily2020 (8).csv")
Boston_AQI_Data<-read.csv( "C:\\Users\\linda\\Downloads\\BOS_aqidaily2020 (9).csv")
Chicago_AQI_Data<-read.csv("C:\\Users\\linda\\Downloads\\chi_aqidaily2020 (10).csv")

#Adding Months column to total data sets
NYC_AQI_Data$Date<-as.POSIXct(NYC_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(NYC_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
NYC_AQI_Data<-cbind(NYC_AQI_Data, Month)

Miami_AQI_Data$Date<-as.POSIXct(Miami_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(NYC_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
Miami_AQI_Data<-cbind(Miami_AQI_Data, Month)

LA_AQI_Data$Date<-as.POSIXct(LA_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(LA_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
LA_AQI_Data<-cbind(LA_AQI_Data, Month)

Orlando_AQI_Data$Date<-as.POSIXct(Orlando_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(Orlando_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
Orlando_AQI_Data<-cbind(Orlando_AQI_Data, Month)

SanFrancisco_AQI_Data$Date<-as.POSIXct(SanFrancisco_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(SanFrancisco_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
SanFrancisco_AQI_Data<-cbind(SanFrancisco_AQI_Data, Month)

LasVegas_AQI_Data$Date<-as.POSIXct(LasVegas_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(LasVegas_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
LasVegas_AQI_Data<-cbind(LasVegas_AQI_Data, Month)

WashingtonDC_AQI_Data$Date<-as.POSIXct(WashingtonDC_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(WashingtonDC_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
WashingtonDC_AQI_Data<-cbind(WashingtonDC_AQI_Data, Month)

Boston_AQI_Data$Date<-as.POSIXct(Boston_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(Boston_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
Boston_AQI_Data<-cbind(Boston_AQI_Data, Month)

Chicago_AQI_Data$Date<-as.POSIXct(Chicago_AQI_Data$Date, format="%m/%d/%Y")
Month1<-as.Date(Chicago_AQI_Data$Date,format ="%m/%d/%Y")
Month<-(format(Month1, '%m'))
Chicago_AQI_Data<-cbind(Chicago_AQI_Data, Month)


####NYC DATA ANALYSIS###

#NYC#

#NYC Average AQI Per Month 
na.omit(NYC_AQI_Data)

NYC_AQI_Data_CO<- NYC_AQI_Data %>% select(1,7,13)
NYC_AQI_Data_Ozone<- NYC_AQI_Data %>% select(1,8,13)
NYC_AQI_Data_SO2<- NYC_AQI_Data %>% select(1,9,13)
NYC_AQI_Data_PM10<- NYC_AQI_Data %>% select(1,10,13)
NYC_AQI_Data_PM2.5<- NYC_AQI_Data %>% select(1,11,13)
NYC_AQI_Data_NO<- NYC_AQI_Data %>% select(1,12,13)


NYC_CO_AVG<-aggregate(NYC_AQI_Data_CO$CO,by=list(NYC_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
NYC_Ozone_AVG<-aggregate(NYC_AQI_Data_Ozone$Ozone,by=list(NYC_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
NYC_SO2_AVG<-aggregate(NYC_AQI_Data_SO2$SO2,by=list(NYC_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
NYC_PM10_AVG<-aggregate(NYC_AQI_Data_PM10$PM10,by=list(NYC_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
NYC_PM2.5_AVG<-aggregate(NYC_AQI_Data_PM2.5$PM25,by=list(NYC_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
NYC_NO_AVG<-aggregate(NYC_AQI_Data_NO$NO,by=list(NYC_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(NYC_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(NYC_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(NYC_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(NYC_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(NYC_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(NYC_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(NYC_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in NYC", ylab= "Average AQI Per Month")
points(NYC_CO_AVG, type="l", col='red')
points(NYC_SO2_AVG, type="l", col='pink')
points(NYC_PM10_AVG, type="l", col='green')
points(NYC_PM2.5_AVG, type="l", col='orange')
points(NYC_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#Miami#

#Miami Average AQI Per Month 
na.omit(Miami_AQI_Data)

Miami_AQI_Data_CO<- Miami_AQI_Data %>% select(1,7,13)
Miami_AQI_Data_Ozone<- Miami_AQI_Data %>% select(1,8,13)
Miami_AQI_Data_SO2<- Miami_AQI_Data %>% select(1,9,13)
Miami_AQI_Data_PM10<- Miami_AQI_Data %>% select(1,10,13)
Miami_AQI_Data_PM2.5<- Miami_AQI_Data %>% select(1,11,13)
Miami_AQI_Data_NO<- Miami_AQI_Data %>% select(1,12,13)


Miami_CO_AVG<-aggregate(Miami_AQI_Data_CO$CO,by=list(Miami_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
Miami_Ozone_AVG<-aggregate(Miami_AQI_Data_Ozone$Ozone,by=list(Miami_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
Miami_SO2_AVG<-aggregate(Miami_AQI_Data_SO2$SO2,by=list(Miami_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
Miami_PM10_AVG<-aggregate(Miami_AQI_Data_PM10$PM10,by=list(Miami_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
Miami_PM2.5_AVG<-aggregate(Miami_AQI_Data_PM2.5$PM25,by=list(Miami_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
Miami_NO_AVG<-aggregate(Miami_AQI_Data_NO$NO,by=list(Miami_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(Miami_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(Miami_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(Miami_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(Miami_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(Miami_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(Miami_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(Miami_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in Miami", ylab= "Average AQI Per Month")
points(Miami_CO_AVG, type="l", col='red')
points(Miami_SO2_AVG, type="l", col='pink')
points(Miami_PM10_AVG, type="l", col='green')
points(Miami_PM2.5_AVG, type="l", col='orange')
points(Miami_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#LA#

#LA Average AQI Per Month 
na.omit(LA_AQI_Data)

LA_AQI_Data_CO<- LA_AQI_Data %>% select(1,7,13)
LA_AQI_Data_Ozone<- LA_AQI_Data %>% select(1,8,13)
LA_AQI_Data_SO2<- LA_AQI_Data %>% select(1,9,13)
LA_AQI_Data_PM10<- LA_AQI_Data %>% select(1,10,13)
LA_AQI_Data_PM2.5<- LA_AQI_Data %>% select(1,11,13)
LA_AQI_Data_NO<- LA_AQI_Data %>% select(1,12,13)


LA_CO_AVG<-aggregate(LA_AQI_Data_CO$CO,by=list(LA_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
LA_Ozone_AVG<-aggregate(LA_AQI_Data_Ozone$Ozone,by=list(LA_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
LA_SO2_AVG<-aggregate(LA_AQI_Data_SO2$SO2,by=list(LA_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
LA_PM10_AVG<-aggregate(LA_AQI_Data_PM10$PM10,by=list(LA_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
LA_PM2.5_AVG<-aggregate(LA_AQI_Data_PM2.5$PM25,by=list(LA_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
LA_NO_AVG<-aggregate(LA_AQI_Data_NO$NO,by=list(LA_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(LA_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(LA_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(LA_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(LA_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(LA_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(LA_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(LA_Ozone_AVG, type="l", ylim=c(0,150), main="Average AQI Pollutant Emissions Per Month in LA", ylab= "Average AQI Per Month")
points(LA_CO_AVG, type="l", col='red')
points(LA_SO2_AVG, type="l", col='pink')
points(LA_PM10_AVG, type="l", col='green')
points(LA_PM2.5_AVG, type="l", col='orange')
points(LA_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#Orlando#

#Orlando Average AQI Per Month 
na.omit(Orlando_AQI_Data)

Orlando_AQI_Data_CO<- Orlando_AQI_Data %>% select(1,7,13)
Orlando_AQI_Data_Ozone<- Orlando_AQI_Data %>% select(1,8,13)
Orlando_AQI_Data_SO2<- Orlando_AQI_Data %>% select(1,9,13)
Orlando_AQI_Data_PM10<- Orlando_AQI_Data %>% select(1,10,13)
Orlando_AQI_Data_PM2.5<- Orlando_AQI_Data %>% select(1,11,13)
Orlando_AQI_Data_NO<- Orlando_AQI_Data %>% select(1,12,13)


Orlando_CO_AVG<-aggregate(Orlando_AQI_Data_CO$CO,by=list(Orlando_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
Orlando_Ozone_AVG<-aggregate(Orlando_AQI_Data_Ozone$Ozone,by=list(Orlando_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
Orlando_SO2_AVG<-aggregate(Orlando_AQI_Data_SO2$SO2,by=list(Orlando_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
Orlando_PM10_AVG<-aggregate(Orlando_AQI_Data_PM10$PM10,by=list(Orlando_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
Orlando_PM2.5_AVG<-aggregate(Orlando_AQI_Data_PM2.5$PM25,by=list(Orlando_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
Orlando_NO_AVG<-aggregate(Orlando_AQI_Data_NO$NO,by=list(Orlando_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(Orlando_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(Orlando_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(Orlando_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(Orlando_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(Orlando_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(Orlando_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(Orlando_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in Orlando", ylab= "Average AQI Per Month")
points(Orlando_CO_AVG, type="l", col='red')
points(Orlando_SO2_AVG, type="l", col='pink')
points(Orlando_PM10_AVG, type="l", col='green')
points(Orlando_PM2.5_AVG, type="l", col='orange')
points(Orlando_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#SanFrancisco#

#SanFrancisco Average AQI Per Month 
na.omit(SanFrancisco_AQI_Data)

SanFrancisco_AQI_Data_CO<- SanFrancisco_AQI_Data %>% select(1,7,13)
SanFrancisco_AQI_Data_Ozone<- SanFrancisco_AQI_Data %>% select(1,8,13)
SanFrancisco_AQI_Data_SO2<- SanFrancisco_AQI_Data %>% select(1,9,13)
SanFrancisco_AQI_Data_PM10<- SanFrancisco_AQI_Data %>% select(1,10,13)
SanFrancisco_AQI_Data_PM2.5<- SanFrancisco_AQI_Data %>% select(1,11,13)
SanFrancisco_AQI_Data_NO<- SanFrancisco_AQI_Data %>% select(1,12,13)


SanFrancisco_CO_AVG<-aggregate(SanFrancisco_AQI_Data_CO$CO,by=list(SanFrancisco_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
SanFrancisco_Ozone_AVG<-aggregate(SanFrancisco_AQI_Data_Ozone$Ozone,by=list(SanFrancisco_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
SanFrancisco_SO2_AVG<-aggregate(SanFrancisco_AQI_Data_SO2$SO2,by=list(SanFrancisco_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
SanFrancisco_PM10_AVG<-aggregate(SanFrancisco_AQI_Data_PM10$PM10,by=list(SanFrancisco_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
SanFrancisco_PM2.5_AVG<-aggregate(SanFrancisco_AQI_Data_PM2.5$PM25,by=list(SanFrancisco_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
SanFrancisco_NO_AVG<-aggregate(SanFrancisco_AQI_Data_NO$NO,by=list(SanFrancisco_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(SanFrancisco_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(SanFrancisco_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(SanFrancisco_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(SanFrancisco_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(SanFrancisco_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(SanFrancisco_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(SanFrancisco_Ozone_AVG, type="l", ylim=c(0,90), main="Average AQI Pollutant Emissions Per Month in SanFrancisco", ylab= "Average AQI Per Month")
points(SanFrancisco_CO_AVG, type="l", col='red')
points(SanFrancisco_SO2_AVG, type="l", col='pink')
points(SanFrancisco_PM10_AVG, type="l", col='green')
points(SanFrancisco_PM2.5_AVG, type="l", col='orange')
points(SanFrancisco_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#LasVegas#

#LasVegas Average AQI Per Month 
na.omit(LasVegas_AQI_Data)

LasVegas_AQI_Data_CO<- LasVegas_AQI_Data %>% select(1,7,13)
LasVegas_AQI_Data_Ozone<- LasVegas_AQI_Data %>% select(1,8,13)
LasVegas_AQI_Data_SO2<- LasVegas_AQI_Data %>% select(1,9,13)
LasVegas_AQI_Data_PM10<- LasVegas_AQI_Data %>% select(1,10,13)
LasVegas_AQI_Data_PM2.5<- LasVegas_AQI_Data %>% select(1,11,13)
LasVegas_AQI_Data_NO<- LasVegas_AQI_Data %>% select(1,12,13)


LasVegas_CO_AVG<-aggregate(LasVegas_AQI_Data_CO$CO,by=list(LasVegas_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
LasVegas_Ozone_AVG<-aggregate(LasVegas_AQI_Data_Ozone$Ozone,by=list(LasVegas_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
LasVegas_SO2_AVG<-aggregate(LasVegas_AQI_Data_SO2$SO2,by=list(LasVegas_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
LasVegas_PM10_AVG<-aggregate(LasVegas_AQI_Data_PM10$PM10,by=list(LasVegas_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
LasVegas_PM2.5_AVG<-aggregate(LasVegas_AQI_Data_PM2.5$PM25,by=list(LasVegas_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
LasVegas_NO_AVG<-aggregate(LasVegas_AQI_Data_NO$NO,by=list(LasVegas_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(LasVegas_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(LasVegas_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(LasVegas_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(LasVegas_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(LasVegas_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(LasVegas_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(LasVegas_Ozone_AVG, type="l", ylim=c(0,90), main="Average AQI Pollutant Emissions Per Month in LasVegas", ylab= "Average AQI Per Month")
points(LasVegas_CO_AVG, type="l", col='red')
points(LasVegas_SO2_AVG, type="l", col='pink')
points(LasVegas_PM10_AVG, type="l", col='green')
points(LasVegas_PM2.5_AVG, type="l", col='orange')
points(LasVegas_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#WashingtonDC#

#WashingtonDC Average AQI Per Month 
na.omit(WashingtonDC_AQI_Data)

WashingtonDC_AQI_Data_CO<- WashingtonDC_AQI_Data %>% select(1,7,13)
WashingtonDC_AQI_Data_Ozone<- WashingtonDC_AQI_Data %>% select(1,8,13)
WashingtonDC_AQI_Data_SO2<- WashingtonDC_AQI_Data %>% select(1,9,13)
WashingtonDC_AQI_Data_PM10<- WashingtonDC_AQI_Data %>% select(1,10,13)
WashingtonDC_AQI_Data_PM2.5<- WashingtonDC_AQI_Data %>% select(1,11,13)
WashingtonDC_AQI_Data_NO<- WashingtonDC_AQI_Data %>% select(1,12,13)


WashingtonDC_CO_AVG<-aggregate(WashingtonDC_AQI_Data_CO$CO,by=list(WashingtonDC_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
WashingtonDC_Ozone_AVG<-aggregate(WashingtonDC_AQI_Data_Ozone$Ozone,by=list(WashingtonDC_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
WashingtonDC_SO2_AVG<-aggregate(WashingtonDC_AQI_Data_SO2$SO2,by=list(WashingtonDC_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
WashingtonDC_PM10_AVG<-aggregate(WashingtonDC_AQI_Data_PM10$PM10,by=list(WashingtonDC_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
WashingtonDC_PM2.5_AVG<-aggregate(WashingtonDC_AQI_Data_PM2.5$PM25,by=list(WashingtonDC_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
WashingtonDC_NO_AVG<-aggregate(WashingtonDC_AQI_Data_NO$NO,by=list(WashingtonDC_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(WashingtonDC_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(WashingtonDC_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(WashingtonDC_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(WashingtonDC_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(WashingtonDC_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(WashingtonDC_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(WashingtonDC_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in WashingtonDC", ylab= "Average AQI Per Month")
points(WashingtonDC_CO_AVG, type="l", col='red')
points(WashingtonDC_SO2_AVG, type="l", col='pink')
points(WashingtonDC_PM10_AVG, type="l", col='green')
points(WashingtonDC_PM2.5_AVG, type="l", col='orange')
points(WashingtonDC_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#Boston#

#Boston Average AQI Per Month 
na.omit(Boston_AQI_Data)

Boston_AQI_Data_CO<- Boston_AQI_Data %>% select(1,7,13)
Boston_AQI_Data_Ozone<- Boston_AQI_Data %>% select(1,8,13)
Boston_AQI_Data_SO2<- Boston_AQI_Data %>% select(1,9,13)
Boston_AQI_Data_PM10<- Boston_AQI_Data %>% select(1,10,13)
Boston_AQI_Data_PM2.5<- Boston_AQI_Data %>% select(1,11,13)
Boston_AQI_Data_NO<- Boston_AQI_Data %>% select(1,12,13)


Boston_CO_AVG<-aggregate(Boston_AQI_Data_CO$CO,by=list(Boston_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
Boston_Ozone_AVG<-aggregate(Boston_AQI_Data_Ozone$Ozone,by=list(Boston_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
Boston_SO2_AVG<-aggregate(Boston_AQI_Data_SO2$SO2,by=list(Boston_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
Boston_PM10_AVG<-aggregate(Boston_AQI_Data_PM10$PM10,by=list(Boston_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
Boston_PM2.5_AVG<-aggregate(Boston_AQI_Data_PM2.5$PM25,by=list(Boston_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
Boston_NO_AVG<-aggregate(Boston_AQI_Data_NO$NO,by=list(Boston_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(Boston_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(Boston_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(Boston_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(Boston_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(Boston_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(Boston_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(Boston_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in Boston", ylab= "Average AQI Per Month")
points(Boston_CO_AVG, type="l", col='red')
points(Boston_SO2_AVG, type="l", col='pink')
points(Boston_PM10_AVG, type="l", col='green')
points(Boston_PM2.5_AVG, type="l", col='orange')
points(Boston_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))

#Chicago#

#Chicago Average AQI Per Month 
na.omit(Chicago_AQI_Data)

Chicago_AQI_Data_CO<- Chicago_AQI_Data %>% select(1,7,13)
Chicago_AQI_Data_Ozone<- Chicago_AQI_Data %>% select(1,8,13)
Chicago_AQI_Data_SO2<- Chicago_AQI_Data %>% select(1,9,13)
Chicago_AQI_Data_PM10<- Chicago_AQI_Data %>% select(1,10,13)
Chicago_AQI_Data_PM2.5<- Chicago_AQI_Data %>% select(1,11,13)
Chicago_AQI_Data_NO<- Chicago_AQI_Data %>% select(1,12,13)


Chicago_CO_AVG<-aggregate(Chicago_AQI_Data_CO$CO,by=list(Chicago_AQI_Data_CO$Month),FUN=mean, na.rm=TRUE)
Chicago_Ozone_AVG<-aggregate(Chicago_AQI_Data_Ozone$Ozone,by=list(Chicago_AQI_Data_Ozone$Month),FUN=mean, na.rm=TRUE)
Chicago_SO2_AVG<-aggregate(Chicago_AQI_Data_SO2$SO2,by=list(Chicago_AQI_Data_SO2$Month),FUN=mean, na.rm=TRUE)
Chicago_PM10_AVG<-aggregate(Chicago_AQI_Data_PM10$PM10,by=list(Chicago_AQI_Data_PM10$Month),FUN=mean, na.rm=TRUE)
Chicago_PM2.5_AVG<-aggregate(Chicago_AQI_Data_PM2.5$PM25,by=list(Chicago_AQI_Data_PM2.5$Month),FUN=mean, na.rm=TRUE)
Chicago_NO_AVG<-aggregate(Chicago_AQI_Data_NO$NO,by=list(Chicago_AQI_Data_NO$Month),FUN=mean, na.rm=TRUE)

colnames(Chicago_CO_AVG)<-c('Month', 'CO Avg Per Month')
colnames(Chicago_Ozone_AVG)<-c('Month', 'Ozone Avg Per Month')
colnames(Chicago_SO2_AVG)<-c('Month', 'SO2 Avg Per Month')
colnames(Chicago_PM10_AVG)<-c('Month', 'PM10 Avg Per Month')
colnames(Chicago_PM2.5_AVG)<-c('Month', 'PM2.5 Avg Per Month')
colnames(Chicago_NO_AVG)<-c('Month', 'NO Avg Per Month')

plot(Chicago_Ozone_AVG, type="l", ylim=c(0,90), main="Average AQI Pollutant Emissions Per Month in Chicago", ylab= "Average AQI Per Month")
points(Chicago_CO_AVG, type="l", col='red')
points(Chicago_SO2_AVG, type="l", col='pink')
points(Chicago_PM10_AVG, type="l", col='green')
points(Chicago_PM2.5_AVG, type="l", col='orange')
points(Chicago_NO_AVG, type="l", col='blue')

par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
legend(x="topright", y=2, legend=c("Ozone","CO", 'SO2', 'PM10', 'PM2.5', 'NO'), col=c("black", "red", "pink", "green", "orange", "blue"), pch = c("*","*","*","*","*","*"), title = "Pollutants", cex=1, inset = c(-0.2,0))


################SHINY APP CODE################

# Define UI for application 
ui <- fluidPage(
    
    #Selecting state thing
    radioButtons("state", label = HTML('<FONT color="black"><FONT size="5pt">AQI Index Information for the Top Nine Vacation Destinations in the United States</FONT></FONT><br> <b>Choose a locaton to read more about the air quality</b>'),
                 choices = list("New York City, NY", "Miami, FL", "Los Angeles, CA", "Orlando, FL", "San Francisco, CA", "Las Vegas, NV", "Washington, DC", "Boston, MA", "Chicago, IL"),
                 selected = 1,
                 inline = T,
                 width = "100%"), 
    plotOutput('turbPlot', width = "100%"),
    basicPage(
        textInput("txt", "Enter the text to display below:"),
        textOutput("huh"),
        verbatimTextOutput("verb")
    )
)





# Define server 
server <- function(input, output){
    output$turbPlot <- renderPlot({
        if(input$state == "New York City, NY"){plot(NYC_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in NYC", ylab= "Average AQI Per Month")
            points(NYC_CO_AVG, type="l", col='red')
            points(NYC_SO2_AVG, type="l", col='pink')
            points(NYC_PM10_AVG, type="l", col='green')
            points(NYC_PM2.5_AVG, type="l", col='orange')
            points(NYC_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Miami, FL"){plot(Miami_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in Miami", ylab= "Average AQI Per Month")
            points(Miami_CO_AVG, type="l", col='red')
            points(Miami_SO2_AVG, type="l", col='pink')
            points(Miami_PM10_AVG, type="l", col='green')
            points(Miami_PM2.5_AVG, type="l", col='orange')
            points(Miami_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Los Angeles, CA"){plot(LA_Ozone_AVG, type="l", ylim=c(0,150), main="Average AQI Pollutant Emissions Per Month in LA", ylab= "Average AQI Per Month")
            points(LA_CO_AVG, type="l", col='red')
            points(LA_SO2_AVG, type="l", col='pink')
            points(LA_PM10_AVG, type="l", col='green')
            points(LA_PM2.5_AVG, type="l", col='orange')
            points(LA_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Orlando, FL"){plot(Orlando_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in Orlando", ylab= "Average AQI Per Month")
            points(Orlando_CO_AVG, type="l", col='red')
            points(Orlando_SO2_AVG, type="l", col='pink')
            points(Orlando_PM10_AVG, type="l", col='green')
            points(Orlando_PM2.5_AVG, type="l", col='orange')
            points(Orlando_NO_AVG, type="l", col='blue')
        }
        if(input$state == "San Francisco, CA"){plot(SanFrancisco_Ozone_AVG, type="l", ylim=c(0,90), main="Average AQI Pollutant Emissions Per Month in SanFrancisco", ylab= "Average AQI Per Month")
            points(SanFrancisco_CO_AVG, type="l", col='red')
            points(SanFrancisco_SO2_AVG, type="l", col='pink')
            points(SanFrancisco_PM10_AVG, type="l", col='green')
            points(SanFrancisco_PM2.5_AVG, type="l", col='orange')
            points(SanFrancisco_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Las Vegas, NV"){plot(LasVegas_Ozone_AVG, type="l", ylim=c(0,90), main="Average AQI Pollutant Emissions Per Month in LasVegas", ylab= "Average AQI Per Month")
            points(LasVegas_CO_AVG, type="l", col='red')
            points(LasVegas_SO2_AVG, type="l", col='pink')
            points(LasVegas_PM10_AVG, type="l", col='green')
            points(LasVegas_PM2.5_AVG, type="l", col='orange')
            points(LasVegas_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Washington, DC"){plot(WashingtonDC_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in WashingtonDC", ylab= "Average AQI Per Month")
            points(WashingtonDC_CO_AVG, type="l", col='red')
            points(WashingtonDC_SO2_AVG, type="l", col='pink')
            points(WashingtonDC_PM10_AVG, type="l", col='green')
            points(WashingtonDC_PM2.5_AVG, type="l", col='orange')
            points(WashingtonDC_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Boston, MA"){plot(Boston_Ozone_AVG, type="l", ylim=c(0,80), main="Average AQI Pollutant Emissions Per Month in Boston", ylab= "Average AQI Per Month")
            points(Boston_CO_AVG, type="l", col='red')
            points(Boston_SO2_AVG, type="l", col='pink')
            points(Boston_PM10_AVG, type="l", col='green')
            points(Boston_PM2.5_AVG, type="l", col='orange')
            points(Boston_NO_AVG, type="l", col='blue')
        }
        if(input$state == "Chicago, IL"){plot(Chicago_Ozone_AVG, type="l", ylim=c(0,90), main="Average AQI Pollutant Emissions Per Month in Chicago", ylab= "Average AQI Per Month")
            points(Chicago_CO_AVG, type="l", col='red')
            points(Chicago_SO2_AVG, type="l", col='pink')
            points(Chicago_PM10_AVG, type="l", col='green')
            points(Chicago_PM2.5_AVG, type="l", col='orange')
            points(Chicago_NO_AVG, type="l", col='blue')
        }
        
    })
    function(input, output) {
        output$text <- renderText({ input$txt })
        output$verb <- renderText({ input$txt })
    }
    
    }

# Run the application 
shinyApp(ui = ui, server = server)











#Part 1. Write a function to convert a streamflow given in cubic feet per second into cm per day.
#This requires dividing the volumetric discharge (i.e. number in cfs)  through by watershed area. 
#Test the function for a watershed of 125 mi2 with a streamflow of 550 cubic feet per second. 
#The function should be general enough to work for any watershed area and flow rate. 
#1 cubic foot is equal to 28316.85 cubic centimeters
#1 cubic centimeter is equal to 1 centimeter

#Variables

WatershedArea<-125
Streamflow<-550

#Function

Streamflow_Function <- function(WatershedArea, Streamflow){
  
  sq_miles<- WatershedArea*2.7e7
  ft_per_sec<-Streamflow/sq_miles
  Vol_Dis<- ft_per_sec*30.48*86400
  
  return(Vol_Dis)
}

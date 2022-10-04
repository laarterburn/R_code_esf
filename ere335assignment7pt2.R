#Part 2. Write a function to convert a coordinate given in degrees, minutes, and seconds into a decimal degree value. 
#Test the function for a coordinate of 35??? 35' 15" . The function should be general enough to work for any coordinates.

#Variables

Degree<-35
Minute<-35
Second<-15

#Function

CoordinateConversion <- function(Degree, Minutes, Seconds){
  
  min<-Minute/60
  sec<-Second/3600
  Dec_degree<-Degree+min+sec
  
  return(Dec_degree)
}

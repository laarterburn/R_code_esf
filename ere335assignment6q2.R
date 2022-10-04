#read in data
ere335<-read.table("C:\\Users\\linda\\Downloads\\ere335.txt")

#variables
year1 <- 2021
Length <- year1-2000+2
Values <- array(data=NA)
dimensions<-(Length)
Final <- array(data=NA, dimensions)
counter <- 1



#loop
for (i in 1:length(ere335$V3)){
  
  if((ere335$V4[i]==year1 & ere335$V5[i]<10) | (ere335$V4[i]==year1-1 & ere335$V5[i]>=10)){
    
    Values[counter] <- ere335$V3[i]
    Final[hydroyear]<- max(Values)
    counter <- counter+1
    
  }else{
    
    counter <- 1
    Values <- array(data=NA)
    year1 <- year1+1
    
  }
  
}

print(Final)


# Function 1: RandomNo
# write a function that generates an integer random number
# using runif that ranges from 0 to  designated max value

RandomNo <- function(RandomNumberGenerator){
  
  RandomNumberGenerator<-round(runif(1, min=0, max=11))
  
  return(RandomNumberGenerator)
}

# Function 2: Winner
# write a function that updates the variable Status and reports out
# winning and losing such that
# a winner occurs if Sum_of_Numbers >15 but less than 21. 
# A player loses if Sum_of_Numbers >20. 


Winner <- function(Sum_of_Numbers){
  
  if(Sum_of_Numbers > 15 & Sum_of_Numbers < 21){
    
    print("Winner")
    Status<-FALSE
    
  } else if(Sum_of_Numbers > 20){
    
    print("Loser")
    Status<-TRUE
  }
  
  return(Status)
}



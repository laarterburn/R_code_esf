Sum_of_Numbers <- 0

First_No_1 <- RandomNo(x)
First_No_2 <- RandomNo(x)
print(paste("Player 1: Your starting number is", First_No_1))
print(paste("Player 2: Your starting number is", First_No_2))
Sum_of_Numbers[1] <- First_No_1
Sum_of_Numbers[2] <- First_No_2
Status <- TRUE

while( Status ==TRUE){
  
  for (i in 1:2){
    
    Choice <- readline(paste("Player",i,"Do you want to pick a new number (Y/N)?"))
    
    if(Choice == "Yes"){
      New_No <- RandomNo(x)
      print(paste('Your new number is',New_No ))
      Sum_of_Numbers[i] <- Sum_of_Numbers[i]+New_No
      print(paste('Your sum of numbers is',Sum_of_Numbers[i] ))
      Status <- Winner(Sum_of_Numbers[i])
      print(Status)
    } else{
      print("Wait for next player")
    }  #if else
    
    
  } # for
}  # while


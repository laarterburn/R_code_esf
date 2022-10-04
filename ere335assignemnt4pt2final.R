change<-12

if (change>=10){
  print('dime=1') 
  change= change-10
} else{
  print('dime=0')

}


 if (change>=5){
   print('nickel=1') 
   change=change-5
 } else{
   print('nickle=0')
 }

 
 if (change<=4){
   print(paste('penny=',change))
 }

 


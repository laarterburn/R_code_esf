#amount of change
change<-16

#statements
if (!change>4){
  print('pennies')
} 
if (change==5){
  print('1 nickel')
}
if (change>=6 & change<=9){
  print('pennies and 1 nickel')
}
if (change==10){
  print('1 dime')
}
if (change>=11 & change<=14){
  print('pennies and 1 dime')
} 
if (change==15){
  print('1 dime and 1 nickel')
}

#16 to 19
if (change>=15 & change<=19){
  print('1 dime, and 1 nickel')
}
if (change==16){
  print("1 penny")
}
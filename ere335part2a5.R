#Part 2A. Write a script that identifies and prints the maximum value from the 1000 randomly generated values. Use a for loop to do this, not the max() function in R. Also, print the max value found by sort() to show your script works.

L <- rnorm(1000)*100
max<- L[1]

for(i in 1:1000){
  
  if( L[i]>max){
   max<-L[i]
  }

}

print(max)

Lsort<-sort(L)
print(Lsort[1000])
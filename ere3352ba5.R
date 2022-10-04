#Part 2B. Write a script that identifies and prints the five highest values from the 1000 randomly generated values. Use a series of for loops to do this. Also, print the max values found by sort() to show your script works.

L <- rnorm(1000)*100
vector<-c(0,0,0,0,0)

for(i in 1:1000){
  
  if( L[i]>vector[1]){
    vector[1]<-L[i]
  } 
}

for(i in 1:1000){
  if( L[i]>vector[2] & L[i]<vector[1]){
    vector[2]<-L[i]
  }
}
for(i in 1:1000){
  if( L[i]>vector[3] & L[i]<vector[2]){
    vector[3]<-L[i]
  }
}
for(i in 1:1000){
  if( L[i]>vector[4] & L[i]<vector[3]){
    vector[4]<-L[i]
  }
}

for(i in 1:1000){
  if( L[i]>vector[5] & L[i]<vector[4]){
    vector[5]<-L[i]
  }
}


print(paste(vector[1], vector[2], vector[3], vector[4], vector[5]))

Lsort<-sort(L)
print(Lsort[1000:996])

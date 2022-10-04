
#file upload
Data<-read.csv("C:\\Users\\linda\\Downloads\\Syr_MetData.csv")

counter<-1938
YearlySnow<-c()
temporary<-0
i<-1

for(j in 1:length(Data$YEAR)){
  if(Data$YEAR[j]==counter){
 
     temporary<-(temporary+Data$SNOW[j])  
    
  }else{

    
    YearlySnow[i]<-temporary
    i<-i+1
    temporary<-0
    counter<-counter+1
    
    
  }
}

print(YearlySnow)


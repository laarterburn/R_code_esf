#file upload
Data<-read.csv("C:\\Users\\linda\\Downloads\\Syr_MetData.csv")

counter<-1938


    
  for(j in 1:length(Data$YEAR)){
    if(Data$YEAR[j]==counter){
      
    }else{
      
      counter<-counter+1
      
      print(j)
      
    }
  }


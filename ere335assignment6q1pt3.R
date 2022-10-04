
#file upload
Data<-read.csv("C:\\Users\\linda\\Downloads\\Syr_MetData.csv")

counter<-1938
Yearly_DaysAbv90<-c()
i<-1
date2<-0


for(j in 1:length(Data$YEAR)){
  if(Data$YEAR[j]==counter){
    
   
    if(Data$TMAX[j] > 90){
      date2<-date2+1
        
  }
    
    }else{
    
    Yearly_DaysAbv90[i]<-date2
    date2<-0
    i<-i+1
    counter<-counter+1
    
    
  }
}

print(Yearly_DaysAbv90)






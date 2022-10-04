#upload file
ere335<-read.table("C:\\Users\\linda\\Downloads\\ere335.txt")

#Finding years
counter<-2021



for(j in 1:length(ere335$V4)){
  if(ere335$V4[j]==counter){
    
  }else{
    
    counter<-counter-1
    
    print(j)
    
  }
}

#work

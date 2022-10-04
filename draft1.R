#status
status<-TRUE

#numbers
player1<-0
player2<-1

#making board
board <- data.frame(matrix(nrow=3, ncol=3, dimnames = list(c("Row1","Row2","Row3"),c("Col1","Col2","Col3"))))
board$Col1<-c(1,4,7)
board$Col2<-c(2,5,8)
board$Col3<-c(3,6,9)

#player 1 win function
player1wins <-function(board) {
  if(sum(board$Col1)==0 | sum(board$Col2)==0 | sum(board$Col3)==0){
    status<-FALSE
    print("Player 1 wins")
  }else if(sum(board[1,])==0 | sum(board[2,])==0 |sum(board[3,])==0){
    status<-FALSE
    print("Player 1 wins")
  }else if (sum(board[1,1]+board[2,2]+board[3,3] == 0 | board[1,3]+board[2,2]+board[3,1] == 0)) {
    status<-FALSE
    print("Player 1 wins")}
  
  return(status)
}

#player 2 win function
player2wins <-function(board) {
  if(sum(board$Col1)==3 | sum(board$Col2)==3 | sum(board$Col3)==3){
    status<-FALSE
    print("Player 2 wins")
  }else if(sum(board[1,])==3 | sum(board[2,])==3 |sum(board[3,])==3){
    status<-FALSE
    print("Player 2 wins")
  }else if (sum(board[1,1]+board[2,2]+board[3,3] == 3 | board[1,3]+board[2,2]+board[3,1] == 3)) {
    status<-FALSE
    print("Player 2 wins")}
  
  return(status)
}

#players play the game loop

while( status ==TRUE){
  board[Choicerow, Choicecol]==1|0
    
    Choicerow1 <- readline(paste("Player",1,"Which row would you like to play?"))
    Choicecol1 <- readline(paste("Player",1,"Which column would you like to play?"))
    if(Choice == board[1,]){
      board[1,1]<-i
    
     Choicerow2 <- readline(paste("Player",2,"Which row would you like to play?"))
    Choicecol2 <- readline(paste("Player",2,"Which column would you like to play?"))
    
    
    if(Choice == board[1,]){
      board[1,1]<-i
     
      print(status==TRUE)
      player1wins(board)
      player2wins(board)
    } else{
      print("Tie")
    }  #if else
}  # while










#status
status<-TRUE

#numbers
#player1<-0
#player2<-10

#making board
board <- data.frame(matrix(nrow=3, ncol=3, dimnames = list(c("Row1","Row2","Row3"),c("Col1","Col2","Col3"))))
board$Col1<-c(1,4,7)
board$Col2<-c(2,5,8)
board$Col3<-c(3,6,9)
print(board)

#player 1 win function
player1wins <-function() {
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
player2wins <-function() {
  if(sum(board$Col1)==30 | sum(board$Col2)==30 | sum(board$Col3)==30){
    status<-FALSE
    print("Player 2 wins")
  }else if(sum(board[1,])==30 | sum(board[2,])==30 |sum(board[3,])==30){
    status<-FALSE
    print("Player 2 wins")
  }else if (sum(board[1,1]+board[2,2]+board[3,3] == 30 | board[1,3]+board[2,2]+board[3,1] == 30)) {
    status<-FALSE
    print("Player 2 wins")}
  
  return(status)
}

#players play the game loop

while(status ==TRUE){
  
  if(board[Row, Column]==0|10){
    print("Place taken. try again")
    print(board)
    Row<-as.numeric(readline("Player 1, which row would you like?"))
    Column<-as.numeric(readline("Player 1, which column would you like?"))
    board[Row,Column]=0
  }
  Row<-as.numeric(readline("Player 1, which row would you like?"))
  Column<-as.numeric(readline("Player 1, which column would you like?"))
  board[Row,Column]=0
  
  print(board)
  
  player1wins()
  
  if(board[Row, Column]==0|10){
    print("Place taken. try again")
    print(board)
    Row<-as.numeric(readline("Player 2, which row would you like?"))
    Column<-as.numeric(readline("Player 2, which column would you like?"))
    board[Row,Column]=10
  }
  Row<-as.numeric(readline("Player 2, which row would you like?"))
  Column<-as.numeric(readline("Player 2, which column would you like?"))
  board[Row,Column]=10
  
  print(board)
  
  player2wins()  
}







public class Board {
  Candy[][] board;
  
  public Board(int size) {
    board = new Candy[size][size];
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        board[x][y] = new Candy(randomCandy(), x, y);
      }
    }
  }
  git add
  String randomCandy() {
    String[] candies = {"blue", "purple", "orange", "green", "yellow", "red"};
    int index = (int)(random(0,6));
    return (candies[index]);
  }
  
  int size() {
    return board.length;
  }
  
  Candy getCandy(int x, int y) {
    return board[x][y];
  }
  
  void swap(Candy first, Candy second) {
    if (validMove(first, second)){
      int x1 = first.getX();
      int y1 = first.getY();
      int x2 = second.getX();
      int y2 = second.getY();
      board[x2][y2] = first;
      board[x1][y1] = second;
      first.setX(x2);
      first.setY(y2);
      second.setX(x1);
      second.setY(y1);
    }
  }
  
   boolean canMove(int i, int x, Candy piece){
       if(i >= 0 && i<=board.length-1 && x>=0 && x<=board[0].length-1){
         if((board[i][x].getColor()).equals(piece.getColor())){
           return true;    
         }
     }
     return false;
   }
   
  
  boolean horizontalLink(Candy one, Candy two){
    // check to see if new position makes a vertical link
    // made for links of 3
     int x2 = two.getX();
     int y2 = two.getY();
     if( canMove(x2-1,y2,one) &&
          canMove(x2+1,y2,one) && 
          board[x2-1][y2] != one && 
          board[x2+1][y2] != one) return true;
     if(  canMove(x2-1,y2,one) &&
          canMove(x2-2,y2,one) &&
          board[x2-1][y2] != one && 
          board[x2-2][y2] != one) return true;
     if(  canMove(x2+1,y2,one) &&
          canMove(x2+2,y2,one) &&
          board[x2+1][y2] != one && 
          board[x2+2][y2] != one) return true;
     else return false;
  }
  
  boolean verticalLink(Candy one, Candy two){
     // made for links of 3
     int x2 = two.getX();
     int y2 = two.getY();
     if( canMove(x2,y2-1,one) &&
          canMove(x2,y2+1,one) &&
          board[x2][y2-1] != one && 
          board[x2][y2+1] != one) return true;
     if( canMove(x2,y2-1,one)&&
          canMove(x2,y2-2,one) &&
          board[x2][y2-1] != one && 
          board[x2][y2-2] != one) return true;
     if( canMove(x2,y2+1,one) &&
          canMove(x2,y2+2,one) &&
          board[x2][y2+1] != one && 
          board[x2][y2+2] != one) return true;
     else return false;
  }
  
  boolean validMove(Candy one, Candy two) {
    int x1 = one.getX();
    int y1 = one.getY();
    int x2 = two.getX();
    int y2 = two.getY();
    if ( x1 - 1 == x2 || x1 + 1 == x2 ) {
      if (y1 == y2 ){
        if(verticalLink(one, two) || horizontalLink(one, two)) return true;
      }
    }
    if ( y1 - 1 == y2 || y1 + 1 == y2 ) {
      if (x1 == x2){
        if(verticalLink(one, two) || horizontalLink(one, two)) return true;
      }
    }
    text("not working",765,50);
    return false;
  }
  
  boolean compareH(int x, int y) {
    Candy a = getCandy(x-1, y);
    Candy b = getCandy(x, y);
    Candy c = getCandy(x+1, y);
    return (a.getColor().equals(b.getColor()) && a.getColor().equals(c.getColor()));
  }
  
  boolean compareV(int x, int y) {
    Candy a = getCandy(x, y-1);
    Candy b = getCandy(x, y);
    Candy c = getCandy(x, y+1);
    return (a.getColor().equals(b.getColor()) && a.getColor().equals(c.getColor()));
  }
  
  void crush() {
    for (int x = 1; x<size()-1; x++) {
      for (int y = 0; y<size(); y++) {
        if (compareH(x, y)) {
          board[x-1][y] = new Candy("", -1, -1);
          board[x][y] = new Candy("", -1, -1);
          board[x+1][y] = new Candy("", -1, -1);
        }
      }
    }
    for (int x = 0; x<size(); x++) {
      for (int y = 1; y<size()-1; y++) {
        if (compareV(x, y)) {
          board[x][y-1] = new Candy("", -1, -1);
          board[x][y] = new Candy("", -1, -1);
          board[x][y+1] = new Candy("", -1, -1);
        }
      }
    }
  }
  
  void pushdown(int x, int y){
    if(y == 0 && board[x][y].getColor().equals("")){
      board[x][y] = new Candy(randomCandy(), x, y);
    }
    else if(board[x][y].getColor().equals("")){
      board[x][y] = board[x][y-1];
      board[x][y].setY(y);
      board[x][y-1] = new Candy("", -1, -1);
      pushdown(x, y-1); 
    }
  }
  
  void gravity(){
    for( int x = 0; x< size(); x ++){
      for(int y = 0; y< size(); y ++){
        pushdown(x,y);
      }
    }
  }
  
}

public class Board {
  Candy[][] board;
  
  public Board(int size) {
    board = new Candy[size][size];
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        board[x][y] = new Candy(randomCandy(LEVEL), x, y);
      }
    }
  }
  String randomCandy(int LEVEL) {
    int index = 0;
    String[] candies = {"blue", "purple", "orange", "green", "yellow", "red", "liquorice"};
    if( LEVEL < 4) {
       index = (int)(random(0,6));
    }
    else{
        index = (int)(random(0,7));
    }
    return (candies[index]);
  }

  
  int size() {
    return board.length;
  }
  
  Candy getCandy(int x, int y) {
    if (x < 0 || x > size()-1 || y < 0 || y > size()-1) return new Candy();
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
     if(piece.getColor().equals("liquorice")) return false;
       if(i >= 0 && i<=board.length-1 && x>=0 && x<=board[0].length-1){
         if((board[i][x].getColor()).contains(piece.getColor()) || piece.getColor().contains(board[i][x].getColor())){
           return true;    
         }
     }
     return false;
   }

   
  
  int horizontalLink(Candy one, Candy two){
    // check to see if new position makes a vertical link
     int x2 = two.getX();
     int y2 = two.getY();
     
     if (canMove(x2-3,y2,one) &&
         canMove(x2-2,y2,one) &&
         canMove(x2-1,y2,one) &&
         board[x2-3][y2] != one && 
         board[x2-2][y2] != one &&
         board[x2-1][y2] != one) return 4;
     if (canMove(x2-2,y2,one) &&
         canMove(x2-1,y2,one) &&
         canMove(x2+1,y2,one) &&
         board[x2-2][y2] != one && 
         board[x2-1][y2] != one &&
         board[x2+1][y2] != one) return 4;
     if (canMove(x2-1,y2,one) &&
         canMove(x2+1,y2,one) &&
         canMove(x2+2,y2,one) &&
         board[x2-1][y2] != one && 
         board[x2+1][y2] != one &&
         board[x2+2][y2] != one) return 4;
     if (canMove(x2+3,y2,one) &&
         canMove(x2+2,y2,one) &&
         canMove(x2+1,y2,one) &&
         board[x2+3][y2] != one && 
         board[x2+2][y2] != one &&
         board[x2+1][y2] != one) return 4;
     
     if( canMove(x2-1,y2,one) &&
          canMove(x2+1,y2,one) && 
          board[x2-1][y2] != one && 
          board[x2+1][y2] != one) return 3;
     if(  canMove(x2-1,y2,one) &&
          canMove(x2-2,y2,one) &&
          board[x2-1][y2] != one && 
          board[x2-2][y2] != one) return 3;
     if(  canMove(x2+1,y2,one) &&
          canMove(x2+2,y2,one) &&
          board[x2+1][y2] != one && 
          board[x2+2][y2] != one) return 3;
     return 0;
  }
  
  int verticalLink(Candy one, Candy two){
     int x2 = two.getX();
     int y2 = two.getY();
     
     if (canMove(x2,y2-3,one) &&
         canMove(x2,y2-2,one) &&
         canMove(x2,y2-1,one) &&
         board[x2][y2-3] != one && 
         board[x2][y2-2] != one &&
         board[x2][y2-1] != one) return 4;
     if (canMove(x2,y2-2,one) &&
         canMove(x2,y2-1,one) &&
         canMove(x2,y2+1,one) &&
         board[x2][y2-2] != one && 
         board[x2][y2-1] != one &&
         board[x2][y2+1] != one) return 4;
     if (canMove(x2,y2-1,one) &&
         canMove(x2,y2+1,one) &&
         canMove(x2,y2+2,one) &&
         board[x2][y2-1] != one && 
         board[x2][y2+1] != one &&
         board[x2][y2+2] != one) return 4;
     if (canMove(x2,y2+3,one) &&
         canMove(x2,y2+2,one) &&
         canMove(x2,y2+1,one) &&
         board[x2][y2+3] != one && 
         board[x2][y2+2] != one &&
         board[x2][y2+1] != one) return 4;
     
     if( canMove(x2,y2-1,one) &&
          canMove(x2,y2+1,one) &&
          board[x2][y2-1] != one && 
          board[x2][y2+1] != one) return 3;
     if( canMove(x2,y2-1,one)&&
          canMove(x2,y2-2,one) &&
          board[x2][y2-1] != one && 
          board[x2][y2-2] != one) return 3;
     if( canMove(x2,y2+1,one) &&
          canMove(x2,y2+2,one) &&
          board[x2][y2+1] != one && 
          board[x2][y2+2] != one) return 3;
     return 0;
  }
  
  boolean validMove(Candy one, Candy two) {
    if(one.getColor().equals("liquorice") || two.getColor().equals("liquorice")) return false;
    int x1 = one.getX();
    int y1 = one.getY();
    int x2 = two.getX();
    int y2 = two.getY();
    if ( x1 - 1 == x2 || x1 + 1 == x2 ) {
      if (y1 == y2 ){
        if(verticalLink(one, two)!=0 || horizontalLink(one, two)!=0) return true;
      }
    }
    if ( y1 - 1 == y2 || y1 + 1 == y2 ) {
      if (x1 == x2){
        if(verticalLink(one, two)!=0 || horizontalLink(one, two)!=0) return true;
      }
    }
    return false;
  }
  
  boolean compareH4(int x, int y) {
    Candy a = getCandy(x, y);
    Candy b = getCandy(x+1, y);
    Candy c = getCandy(x+2, y);
    Candy d = getCandy(x+3, y);
    return (a.getColor().contains(b.getColor()) && a.getColor().contains(c.getColor()) && a.getColor().contains(d.getColor()));
  }
  
  boolean compareV4(int x, int y) {
    Candy a = getCandy(x, y);
    Candy b = getCandy(x, y+1);
    Candy c = getCandy(x, y+2);
    Candy d = getCandy(x, y+3);
    return (a.getColor().contains(b.getColor()) && a.getColor().contains(c.getColor()) && a.getColor().contains(d.getColor()));
  }
  
  boolean compareH3(int x, int y) {
    Candy a = getCandy(x-1, y);
    Candy b = getCandy(x, y);
    Candy c = getCandy(x+1, y);
    return (a.getColor().contains(b.getColor()) && a.getColor().contains(c.getColor()));
  }
  
  boolean compareV3(int x, int y) {
    Candy a = getCandy(x, y-1);
    Candy b = getCandy(x, y);
    Candy c = getCandy(x, y+1);
    return (a.getColor().contains(b.getColor()) && a.getColor().contains(c.getColor()));
  }
  
  int crush() {
    int result = 0;
    
    for(int x = 0; x<size()-3; x++) {
      for(int y = 0; y<size(); y++) {
        if (compareH4(x, y)) {
          board[x][y] = new Candy(board[x+1][y].getColor()+"H", x, y);
          board[x+1][y] = new Candy();
          board[x+2][y] = new Candy();
          board[x+3][y] = new Candy();
        }
      }
    }
    for(int x = 0; x<size(); x++) {
      for(int y = 0; y<size()-3; y++) {
        if (compareV4(x, y)) {
          board[x][y] = new Candy(board[x][y+1].getColor()+"V", x, y);
          board[x][y+1] = new Candy();
          board[x][y+2] = new Candy();
          board[x][y+3] = new Candy();
        }
      }
    }
    
    for (int x = 1; x<size()-1; x++) {
      for (int y = 0; y<size(); y++) {
        if (compareH3(x, y)) {
          board[x-1][y] = new Candy();
          board[x][y] = new Candy();
          board[x+1][y] = new Candy();
          result++;
        }
      }
    }
    for (int x = 0; x<size(); x++) {
      for (int y = 1; y<size()-1; y++) {
        if (compareV3(x, y)) {
          board[x][y-1] = new Candy();
          board[x][y] = new Candy();
          board[x][y+1] = new Candy();
          result++;
        }
      }
    }
    return result;
  }
  
  boolean isMove() {
    boolean result = false;
    for (int x = 1; x<size()-1; x++) {
      for (int y = 0; y<size(); y++) {
        if (compareH3(x, y)) {
          result = true;
        }
      }
    }
    for (int x = 0; x<size(); x++) {
      for (int y = 1; y<size()-1; y++) {
        if (compareV3(x, y)) {
          result = true;
        }
      }
    }
    return result;
  }
  
  void pushdown(int x, int y){
    if(y == 0 && board[x][y].getColor().equals("")){
      board[x][y] = new Candy(randomCandy(LEVEL), x, y);
    }
    else if(board[x][y].getColor().equals("")){
      board[x][y] = board[x][y-1];
      board[x][y].setY(y);
      board[x][y-1] = new Candy();
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

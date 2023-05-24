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
  
  boolean validMove(Candy one, Candy two) {
    int x1 = one.getX();
    int y1 = one.getY();
    int x2 = two.getX();
    int y2 = two.getY();
    if ( x1 - 1 == x2 || x1 + 1 == x2 || y1 - 1 == y2 || y1 + 1 == y2 ) return true;
    return false;
  }
  
}

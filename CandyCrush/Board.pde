public class Board {
  Candy[][] board;
  
  public Board(int size) {
    board = new Candy[size][size];
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        board[x][y] = new Candy(randomCandy());
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
  
}
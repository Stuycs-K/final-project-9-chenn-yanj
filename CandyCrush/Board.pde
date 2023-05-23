public class Board {
  private Candy[][] board;
  
  public Board(int size) {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        board[x][y] = new Candy(Candy.randomCandy());
    }
    }
  }
  
}

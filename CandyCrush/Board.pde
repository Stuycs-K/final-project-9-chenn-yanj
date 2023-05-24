public class Board {
  private Candy[][] board;
  
  public Board(int size) {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        board[x][y] = new Candy(Candy.randomCandy());
    }
    }
  }
  
  void displayCandies(int SQUARESIZE) {
    for (int x = 0; x < board.length; x++) {
      for (int y = 0; y < board[0].length; y++) {
        Candy piece = board[x][y];
        if (piece.getColor.equals("blueball")) {
          image(loadImage("blue"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor.equals("purpleflower")) {
          image(loadImage("purple"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor.equals("orangeoval")) {
          image(loadImage("orange"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor.equals("greensquare")) {
          image(loadImage("green"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor.equals("yellowtriangle")) {
          image(loadImage("yellow"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor.equals("redbean")) {
          image(loadImage("red"), x*SQUARESIZE, y*SQUARESIZE);
        }
      }
    }
  }
  
}

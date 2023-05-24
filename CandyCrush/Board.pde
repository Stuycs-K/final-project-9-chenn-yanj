public class Board {
  Candy[][] board;
  
  public Board(int size) {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        Candy a = new Candy(randomCandy());
        board[x][y] = a;
      }
    }
  }
  
  String randomCandy() {
    String[] candies = {"blue", "purple", "orange", "green", "yellow", "red"};
    int index = (int)(random(0,7));
    return (candies[index]);
  }
  
  void displayCandies(int SQUARESIZE) {
    for (int x = 0; x < board.length; x++) {
      for (int y = 0; y < board[0].length; y++) {
        Candy piece = board[x][y];
        if (piece.getColor().equals("blueball")) {
          image(loadImage("blue"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("purpleflower")) {
          image(loadImage("purple"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("orangeoval")) {
          image(loadImage("orange"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("greensquare")) {
          image(loadImage("green"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("yellowtriangle")) {
          image(loadImage("yellow"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("redbean")) {
          image(loadImage("red"), x*SQUARESIZE, y*SQUARESIZE);
        }
      }
    }
  }
  
}

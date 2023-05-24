int ROWS;
int COLS;
int SQUARESIZE;
Board b;

void setup() {
  size(810,810);
  ROWS = 9;
  COLS = 9;
  SQUARESIZE = width/COLS;
  drawSquares();
  b = new Board(9);
}

void draw() {
  for (int x = 0; x < b.size(); x++) {
      for (int y = 0; y < b.size(); y++) {
        Candy piece = b.getCandy(x, y);
        if (piece.getColor().equals("blue")) {
          image(loadImage("blue.jpg"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("purple")) {
          image(loadImage("purple.jpg"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("orange")) {
          image(loadImage("orange.jpg"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("green")) {
          image(loadImage("green.jpg"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("yellow")) {
          image(loadImage("yellow.jpg"), x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("red")) {
          image(loadImage("red.jpg"), x*SQUARESIZE, y*SQUARESIZE);
        }
      }
    }
}

void drawSquares() {
  stroke(0);
  for (int x = 0; x < width; x+=SQUARESIZE) {
    for (int y = 0; y < height; y+=SQUARESIZE) {
      square(x,y,SQUARESIZE);
    }
  }
}

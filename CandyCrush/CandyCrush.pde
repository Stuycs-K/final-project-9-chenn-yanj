int ROWS;
int COLS;
int SQUARESIZE;

void setup() {
  size(810,810);
  ROWS = 9;
  COLS = 9;
  SQUARESIZE = width/COLS;
  drawSquares();
}

void drawSquares() {
  stroke(0);
  for (int x = 0; x < width; x+=SQUARESIZE) {
    for (int y = 0; y < height; y+=SQUARESIZE) {
      square(x,y,SQUARESIZE);
    }
  }
}

void displayCandies() {
  
}

int ROWS;
int COLS;
int SQUARESIZE;
boolean click = false;
Candy initial;
Candy second;
Board b;

void setup() {
  size(810,810);
  ROWS = 9;
  COLS = 9;
  SQUARESIZE = width/COLS;
  b = new Board(9);
}

void mouseClicked(){
  if (click) {
    second = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
    b.swap(initial, second);
    click = false;
    b.crush();
  }
  else { 
    click = true; 
    initial = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
  }
  
}


void draw() {
  clear();
  drawSquares();
  for (int x = 0; x < b.size(); x++) {
      for (int y = 0; y < b.size(); y++) {
        Candy piece = b.getCandy(x, y);
        if (piece.getColor().equals("blue")) {
          image(loadImage("blue.png"), x*SQUARESIZE, y*SQUARESIZE, 90, 90);
        }
        if (piece.getColor().equals("purple")) {
          image(loadImage("purple.png"), x*SQUARESIZE, y*SQUARESIZE, 90, 90);
        }
        if (piece.getColor().equals("orange")) {
          image(loadImage("orange.png"), x*SQUARESIZE, y*SQUARESIZE, 90, 90);
        }
        if (piece.getColor().equals("green")) {
          image(loadImage("green.png"), x*SQUARESIZE, y*SQUARESIZE, 90, 90);
        }
        if (piece.getColor().equals("yellow")) {
          image(loadImage("yellow.png"), x*SQUARESIZE, y*SQUARESIZE, 90, 90);
        }
        if (piece.getColor().equals("red")) {
          image(loadImage("red.png"), x*SQUARESIZE, y*SQUARESIZE, 90, 90);
        }
      }
  }
  b.crush();
}

void drawSquares() {
  stroke(0);
  for (int x = 0; x < width; x+=SQUARESIZE) {
    for (int y = 0; y < height; y+=SQUARESIZE) {
      square(x,y,SQUARESIZE);
    }
  }
}

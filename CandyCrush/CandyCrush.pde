int ROWS;
int COLS;
int SQUARESIZE;
boolean click = false;
Candy initial;
Candy second;
Board b;
PImage background;
PImage blue;
PImage purple;
PImage orange;
PImage green;
PImage yellow;
PImage red;


void setup() {
  background = loadImage("background.jpg");
  blue = loadImage("blue.png");
  blue.resize(90,90);
  purple = loadImage("purple.png");
  purple.resize(90,90);
  orange = loadImage("orange.png");
  orange.resize(90,90);
  green = loadImage("green.png");
  green.resize(90,90);
  yellow = loadImage("yellow.png");
  yellow.resize(90,90);
  red = loadImage("red.png");
  red.resize(90,90);
  size(810,810);
  ROWS = 9;
  COLS = 9;
  SQUARESIZE = width/COLS;
  b = new Board(9);
}

void keyPressed() {
  if (key == ' ') b = new Board(9);
}

void mouseClicked(){

  if (click) {
    second = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
    b.swap(initial, second);
    click = false;
    b.crush();
    b.gravity();
  }
  else { 
    click = true; 
    initial = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
    highlight((int)(mouseX/SQUARESIZE) * SQUARESIZE, (int)(mouseY/SQUARESIZE) * SQUARESIZE);
    if (b.validMove(initial, b.getCandy(initial.getX(), initial.getY()-1))) highlight((int)(mouseX/SQUARESIZE) * SQUARESIZE, (int)(mouseY/SQUARESIZE) * SQUARESIZE -SQUARESIZE);
    if (b.validMove(initial, b.getCandy(initial.getX(), initial.getY()+1))) highlight((int)(mouseX/SQUARESIZE) * SQUARESIZE, (int)(mouseY/SQUARESIZE) * SQUARESIZE +SQUARESIZE);
    if (b.validMove(initial, b.getCandy(initial.getX()-1, initial.getY()))) highlight((int)(mouseX/SQUARESIZE) * SQUARESIZE -SQUARESIZE, (int)(mouseY/SQUARESIZE) * SQUARESIZE);
    if (b.validMove(initial, b.getCandy(initial.getX()+1, initial.getY()))) highlight((int)(mouseX/SQUARESIZE) * SQUARESIZE +SQUARESIZE, (int)(mouseY/SQUARESIZE) * SQUARESIZE);
  }
}

void highlight(int x, int y) {
  stroke(255, 255, 255);
  noFill();
  square(x, y, SQUARESIZE);
}

void draw() {
  println(frameRate);
  drawSquares();
  background(background);
  for (int x = 0; x < b.size(); x++) {
      for (int y = 0; y < b.size(); y++) {
        Candy piece = b.getCandy(x, y);
        if (piece.getColor().equals("blue")) {
          image(blue, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("purple")) {
           image(purple, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("orange")) {
           image(orange, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("green")) {
            image(green, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("yellow")) {
            image(yellow, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("red")) {
           image(red, x*SQUARESIZE, y*SQUARESIZE);
        }
      }
  }
  b.crush();
  b.gravity();
 
}

void drawSquares() {
  stroke(0);
  for (int x = 0; x < width; x+=SQUARESIZE) {
    for (int y = 0; y < height; y+=SQUARESIZE) {
      square(x,y,SQUARESIZE);
    }
  }
}

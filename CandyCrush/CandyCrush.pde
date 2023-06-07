int ROWS;
int COLS;
int SQUARESIZE;
boolean click = false;
Candy initial;
Candy second;
Board b;
PImage gamebackground;
PImage blue;
PImage purple;
PImage orange;
PImage green;
PImage yellow;
PImage red;
PImage homebackground;
String page = "home";
int playX, playY;
int rulesX, rulesY;


void setup() {
  homebackground = loadImage("homebackground.jpg");
  homebackground.resize(810,810);
  gamebackground = loadImage("background.jpg");
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
 if(page.equals("home")){
  if(inShape(mouseX, mouseY, playX, playY)){
    page = "game";
  }
 }
 if(page.equals("game")){
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
 
}

void highlight(int x, int y) {
  stroke(255, 255, 255);
  noFill();
  square(x, y, SQUARESIZE);
}

boolean inShape(int x, int y, int rectlength, int rectheight)  {
  if (mouseY >= y && mouseY <= y+rectheight && mouseX >= x && mouseX <= x+rectlength 
      ) {
    return true;
  } else {
    return false;
  }
}

void draw() {
 if(page.equals("rules")){
   background(color(255));
 }
 if(page.equals("home")){
  background(homebackground);
  noStroke();
  textSize(35);
  fill(255,92,168);
  rect(320, 405, 200, 40);
  fill(255);
  text("PLAY", 375, 436);
  noFill();
  fill(11,185,248);
  rect(320, 505, 200, 40);
  fill(255);
  text("RULES", 365, 536);
  noFill();
  
  
  if(key == 'g'){
    page = "game";
  }
  
 }
 
 if(page.equals("game")){
   if(key == 'h'){
    page = "home";
  }
  println(frameRate);
  drawSquares();
  background(gamebackground);
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
}

void drawSquares() {
  stroke(0);
  for (int x = 0; x < width; x+=SQUARESIZE) {
    for (int y = 0; y < height; y+=SQUARESIZE) {
      square(x,y,SQUARESIZE);
    }
  }
}

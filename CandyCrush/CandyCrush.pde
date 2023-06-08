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
int LEVEL;
int GOAL;
int score;


void setup() {
  homebackground = loadImage("homebackground.jpg");
  homebackground.resize(810,830);
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
  size(810,830);
  ROWS = 9;
  COLS = 9;
  SQUARESIZE = width/COLS;
  b = new Board(9);
  LEVEL = 0;
  GOAL = 0;
  score = 0;
}

void keyPressed() { 
  if(key == 'h'){
    page = "home";
  }
  if(key == 'g'){
    page = "game";
    LEVEL = 1;
    GOAL = 1000;
    score = 0;
    b.crush();
  }
 if(key == 'r'){
    page = "rules";
  }
  if (key == ' ') b = new Board(9);
  if (key == CODED) {
    if (keyCode == RIGHT) {
      LEVEL++;
      if (LEVEL == 6) LEVEL = 0;
      score = 0;
      if (LEVEL == 2) GOAL = 1500;
      if (LEVEL == 3) GOAL = 15;
      if (LEVEL == 4) GOAL = 10;
      if (LEVEL == 5) GOAL = 5;
      b = new Board(9);
      b.crush();
      b.gravity();
    }
  }
}

void mouseClicked(){
 if(page.equals("home")){
  if(inShape(320, 405, playX, playY)){
    page = "game";
    LEVEL = 1;
    GOAL = 1000;
    score = 0;
    b.crush();
  }
   if(inShape(320, 505, rulesX, rulesY)){
     page = "rules";
   }
 
 if(page.equals("game")){
  if (click) {
    second = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
    b.swap(initial, second);
    click = false;
    //b.crush();
    //b.gravity();
    if (LEVEL == 3 || LEVEL == 4 || LEVEL == 5) { // increment moves taken
      score++;
      b.crush();
    }
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
 println(frameRate);
 if(page.equals("rules")){
   background(color(255));
 }
 if(page.equals("home")){
  background(homebackground);
  
  noStroke();
  textSize(35);
  fill(255,92,168);
  playX = 200;
  playY = 40;
  rect(320, 405, playX, playY);
  fill(255);
  text("PLAY", 375, 436);
  noFill();
  fill(11,185,248);
  rulesX = 200;
  rulesY = 40;
  rect(320, 505, rulesX, rulesY);
  fill(255);
  text("RULES", 365, 536);
  noFill();
 }
 
 if(page.equals("game")){
  displayLog();
  game();
  if (LEVEL == 1 || LEVEL == 2) {
   score += b.crush() * 50;
  }
  else b.crush();
  b.gravity();
 }
}
void displayLog(){
  background(204);
  textSize(20);
  text("GOAL: " + GOAL, 0, 825);
  text("SCORE: " + score, 350, 825);
  text("LEVEL: " + LEVEL, 700, 825);
}

void game() {
  image(gamebackground, 0, 0);
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
}

//void drawSquares() {
//  stroke(0);
//  for (int x = 0; x < width; x+=SQUARESIZE) {
//    for (int y = 0; y < height; y+=SQUARESIZE) {
//      square(x,y,SQUARESIZE);
//    }
//  }
//}

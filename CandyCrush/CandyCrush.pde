int ROWS;
int COLS;
int SQUARESIZE;
boolean click = false;
Candy initial;
Candy second;
Board b;
PImage gamebackground;
PImage blue;
PImage blueV;
PImage blueH;
PImage purple;
PImage purpleV;
PImage purpleH;
PImage orange;
PImage orangeV;
PImage orangeH;
PImage green;
PImage greenV;
PImage greenH;
PImage yellow;
PImage yellowV;
PImage yellowH;
PImage red;
PImage redV;
PImage redH;
PImage homebackground;
PImage liquorice;
String page = "home";
int playX, playY;
int rulesX, rulesY;
int LEVEL;
int points;
int moves;
int score;
int m;


void setup() {
  homebackground = loadImage("homebackground.jpg");
  homebackground.resize(810,830);
  gamebackground = loadImage("background.jpg");
  liquorice = loadImage("liquorice.png");
  liquorice.resize(90,90);
  blue = loadImage("blue.png");
  blue.resize(90,90);
  blueV = loadImage("blueV.png");
  blueV.resize(103,103);
  blueH = loadImage("blueH.png");
  blueH.resize(103,103);
  purple = loadImage("purple.png");
  purple.resize(90,90);
  purpleV = loadImage("purpleV.png");
  purpleV.resize(103,103);
  purpleH = loadImage("purpleH.png");
  purpleH.resize(103,103);
  orange = loadImage("orange.png");
  orange.resize(90,90);
  orangeV = loadImage("orangeV.png");
  orangeV.resize(103,103);
  orangeH = loadImage("orangeH.png");
  orangeH.resize(103,103);
  green = loadImage("green.png");
  green.resize(90,90);
  greenV = loadImage("greenV.png");
  greenV.resize(103,103);
  greenH = loadImage("greenH.png");
  greenH.resize(103,103);
  yellow = loadImage("yellow.png");
  yellow.resize(90,90);
  yellowV = loadImage("yellowV.png");
  yellowV.resize(103,103);
  yellowH = loadImage("yellowH.png");
  yellowH.resize(103,103);
  red = loadImage("red.png");
  red.resize(105,105);
  redV = loadImage("redV.png");
  redV.resize(105, 105);
  redH = loadImage("redH.png");
  redH.resize(105,105);
  size(810,830);
  ROWS = 9;
  COLS = 9;
  SQUARESIZE = width/COLS;
  b = new Board(9);
  LEVEL = 0;
  points = 0;
  moves = 0;
  score = 0;
  m = 0;
  playX = 200;
  playY = 40;
  rulesX = 200;
  rulesY = 40;
  
  home();
}

void home() {
  background(homebackground);
  noStroke();
  textSize(35);
  fill(255,92,168);
  rect(320, 405, playX, playY);
  fill(255);
  text("PLAY", 375, 436);
  noFill();
  fill(11,185,248);
  rect(320, 505, rulesX, rulesY);
  fill(255);
  text("RULES", 365, 536);
  noFill();
}

void rules() {
  background(color(255));
}

void keyPressed() { 
  if(key == 'h'){
    page = "home";
    home();
  }
  if(key == 'g'){
    page = "game";
    LEVEL = 1;
    points = 10000;
    moves = 15;
    score = 0;
    m = 0;
    displayLog();
    b.crush();
    game();
  }
 if(key == 'r'){
    page = "rules";
    rules();
  }
  if (key == ' ') b = new Board(9);
  if (key == CODED) {
    if (keyCode == RIGHT) {
      LEVEL++;
      if (LEVEL == 6) LEVEL = 1;
      score = 0;
      m = 0;
      if (LEVEL == 2) {
        points = 15000;
        moves = 10;
      }
      if (LEVEL == 3) {
        points = 20000;
        moves = 10;
      }
      if (LEVEL == 4) {
        points = 20000;
        moves = 8;
      }
      if (LEVEL == 5) {
        points = 20000;
        moves = 5;
      }
      b = new Board(9);
      displayLog();
      b.crush();
      //b.gravity();
      game();
    }
  }
}

void mouseClicked(){
 if(page.equals("home")){
  if(inShape(320, 405, playX, playY)){
    page = "game";
    LEVEL = 1;
    points = 10000;
    moves = 15;
    score = 0;
    m = 0;
    displayLog();
    game();
    b.crush();
  }
   else if(inShape(320, 505, rulesX, rulesY)){
     page = "rules";
     rules();
   }
 }
 
 if(page.equals("game")){
  if (click) {
    second = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
    b.swap(initial, second);
    click = false;
     score += b.crush() * 50;
    //b.gravity();
      m++;
      b.crush();
    displayLog();
    game();
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
  strokeWeight(4);
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
 //println(frameRate);
 //if(page.equals("rules")){
 //  background(color(255));
 //}
 //if(page.equals("home")){
 // background(homebackground);
 // noStroke();
 // textSize(35);
 // fill(255,92,168);
 // rect(320, 405, playX, playY);
 // fill(255);
 // text("PLAY", 375, 436);
 // noFill();
 // fill(11,185,248);
 // rect(320, 505, rulesX, rulesY);
 // fill(255);
 // text("RULES", 365, 536);
 // noFill();
 //}
 
 if(page.equals("game")){
  if(b.isMove()) {
    score += b.crush() * 50;
    game();
  }
 }
}
void displayLog(){
  background(204);
  textSize(20);
  text("GOAL: " + points, 0, 825);
  text("MOVES: " + moves, 200, 825);
  text("SCORE: " + score, 350, 825);
  text("SWAPS: " + m, 500, 825);
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
        if (piece.getColor().equals("liquorice")) {
          image(liquorice, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("blueV")) {
          image(blueV, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("blueH")) {
          image(blueH, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("purpleV")) {
          image(purpleV, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("purpleH")) {
          image(purpleH, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("orangeV")) {
          image(orangeV, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("orangeH")) {
          image(orangeH, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("greenV")) {
          image(greenV, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("greenH")) {
          image(greenH, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("yellowV")) {
          image(yellowV, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("yellowH")) {
          image(yellowH, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("redV")) {
          image(redV, x*SQUARESIZE, y*SQUARESIZE);
        }
        if (piece.getColor().equals("redH")) {
          image(redH, x*SQUARESIZE, y*SQUARESIZE);
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

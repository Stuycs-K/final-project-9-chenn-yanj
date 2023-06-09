import processing.sound.*;
int ROWS;
int COLS;
int SQUARESIZE;
boolean click = false;
Candy initial;
Candy second;
Board b;
SoundFile music;
PImage banner;
PImage levelbackground;
PImage gamebackground;
PImage rulebackground;
PImage candy3;
PImage candy4;
PImage finalbackground;
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
PImage liquoriceR;
PImage level;
PImage Tiffi;
PImage Toffe;
PImage Yeti;
String page = "home";
int playX, playY;
int rulesX, rulesY;
int LEVEL;
int points;
int moves;
int score;
int m;

// load files and display home page
void setup() {
  frameRate(4);
  music = new SoundFile(this, "music.mp3");
  music.loop();
  finalbackground = loadImage("final.png");
  finalbackground.resize(810, 830);
  levelbackground = loadImage("levelbackground.jpg");
  levelbackground.resize(810, 830);
  Tiffi = loadImage("Tiffi.png");
  Tiffi.resize(200, 173);
  Toffe = loadImage("Troll.png");
  Toffe.resize(200, 145);
  Yeti = loadImage("Yeti.png");
  level = loadImage("LEVEL.png");
  level.resize(75, 18);
  rulebackground = loadImage("ruleBack.png");
  rulebackground.resize(810, 830);
  banner = loadImage("ruleBack.png");
  banner.resize(818, 208);
  candy3 = loadImage("3candy.png");
  candy3.resize(175, 100);
  candy4 = loadImage("4candy.png");
  candy4.resize(235, 66);
  homebackground = loadImage("homebackground.jpg");
  homebackground.resize(810, 830);
  gamebackground = loadImage("background.jpg");
  liquorice = loadImage("liquorice.png");
  liquorice.resize(90, 90);
  liquoriceR = loadImage("liquorice.png");
  liquoriceR.resize(65, 65);
  blue = loadImage("blue.png");
  blue.resize(90, 90);
  blueV = loadImage("blueV.png");
  blueV.resize(103, 103);
  blueH = loadImage("blueH.png");
  blueH.resize(103, 103);
  purple = loadImage("purple.png");
  purple.resize(90, 90);
  purpleV = loadImage("purpleV.png");
  purpleV.resize(103, 103);
  purpleH = loadImage("purpleH.png");
  purpleH.resize(103, 103);
  orange = loadImage("orange.png");
  orange.resize(90, 90);
  orangeV = loadImage("orangeV.png");
  orangeV.resize(103, 103);
  orangeH = loadImage("orangeH.png");
  orangeH.resize(103, 103);
  green = loadImage("green.png");
  green.resize(90, 90);
  greenV = loadImage("greenV.png");
  greenV.resize(103, 103);
  greenH = loadImage("greenH.png");
  greenH.resize(103, 103);
  yellow = loadImage("yellow.png");
  yellow.resize(90, 90);
  yellowV = loadImage("yellowV.png");
  yellowV.resize(103, 103);
  yellowH = loadImage("yellowH.png");
  yellowH.resize(103, 103);
  red = loadImage("red.png");
  red.resize(105, 105);
  redV = loadImage("redV.png");
  redV.resize(105, 105);
  redH = loadImage("redH.png");
  redH.resize(105, 105);
  size(810, 830);
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

// play and rule button on home page
void home() {
  background(homebackground);
  noStroke();
  textSize(35);
  fill(255, 92, 168);
  rect(320, 405, playX, playY);
  fill(255);
  text("PLAY", 375, 436);
  noFill();
  fill(11, 185, 248);
  rect(320, 505, rulesX, rulesY);
  fill(255);
  text("RULES", 365, 536);
  noFill();
}

// display rules
void rules() {
  background(rulebackground);
  fill(121, 38, 68);
  textSize(45);
  text("HOW TO PLAY", 280, 90 );
  textSize(35);
  text("ENJOY!", 340, 560);
  textSize(20);
  text("1.", 70, 150 );
  text("Click on a candy and and then", 91, 150 );
  text("click on another candy to swap", 91, 172);
  text("it. Match 3 candies of the same", 91, 194);
  text("color to clear them.", 91, 216);
  noFill();
  image(candy3, 93, 238);
  text("2.", 460, 150 );
  text("Matching 4 candies will", 482, 150);
  text("produce a striped candy", 482, 172);
  text("which one can swap with", 482, 194);
  text("another regular or striped ", 482, 216 );
  text("candy of the same color.", 482, 238 );
  image(candy4, 454, 250);
  text("3.", 70, 383 );
  text("Liquorice pieces can not", 91, 383 );
  text("be swapped with any other", 91, 405);
  text("type of candies and will", 91, 427);
  text("only appear in Level 4 & 5.", 91, 449);
  image(liquoriceR, 155, 462);
  text("4.", 460, 383 );
  text("There is a total of 5", 481, 383 );
  text("levels. Each level can", 481, 405);
  text("be passed by meeting the", 481, 427);
  text("Point or Move Goals.", 481, 449);
  image(level, 535, 470);
  image(Tiffi, 90, 600);
  image(Toffe, 320, 610);
  image(Yeti, 530, 610);
  noFill();
}

// "h to return home, "g" to start game, "r" for rules, " " to reshuffle, right arrow skips level
void keyPressed() {
  if (key == 'h') {
    page = "home";
    home();
  }
  if (key == 'g') {
    page = "game";
    LEVEL = 1;
    points = 1000;
    moves = 20;
    score = 0;
    m = 0;
    displayLog();
    b.crush();
    game();
  }
  if (key == 'r') {
    page = "rules";
    rules();
  }
  if (key == ' ') {
    b = new Board(9);
    m+=2;
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      LEVEL++;
      if (LEVEL == 6) LEVEL = 1;
      score = 0;
      m = 0;
      if (LEVEL == 2) {
        points = 1500;
        moves = 30;
      }
      if (LEVEL == 3) {
        points = 2000;
        moves = 35;
      }
      if (LEVEL == 4) {
        points = 2000;
        moves = 30;
      }
      if (LEVEL == 5) {
        points = 3000;
        moves = 37;
      }
      b = new Board(9);
      displayLog();
      b.crush();
      game();
    }
  }
}

// updates level and goals for the level; new board for each level
void level() {
  if (LEVEL == 6) LEVEL = 1;
  score = 0;
  m = 0;
  if (LEVEL == 2) {
    points = 1500;
    moves = 30;
  }
  if (LEVEL == 3) {
    points = 2000;
    moves = 35;
  }
  if (LEVEL == 4) {
    points = 2000;
    moves = 30;
  }
  if (LEVEL == 5) {
    points = 3000;
    moves = 37;
  }
  b = new Board(9);
  displayLog();
  b.crush();
  game();
}

// change page displayed or swaps candies
void mouseClicked() {
  if (page.equals("levelL")) {
    if (inShape(292, 405, 200, 40)) {
      page = "game";
      level();
    }
  }
  if (page.equals("levelW")) {
    if (inShape(292, 405, 200, 40)) {
      page = "game";
      LEVEL++;
      level();
    }
  }

  if (page.equals("home")) {
    if (inShape(320, 405, playX, playY)) {
      page = "game";
      LEVEL = 1;
      points = 1000;
      moves = 20;
      score = 0;
      m = 0;
      displayLog();
      game();
      b.crush();
    } else if (inShape(320, 505, rulesX, rulesY)) {
      page = "rules";
      rules();
    }
  }

  if (page.equals("game")) {
    if (click) {
      second = b.getCandy((int)(mouseX/SQUARESIZE), (int)(mouseY/SQUARESIZE));
      b.swap(initial, second);
      click = false;
      score += b.crush() * 50;
      if (initial != second) m++;
      b.crush();
      displayLog();
      game();
    } else {
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

// outline box of swappable candy with one already selected
void highlight(int x, int y) {
  stroke(255, 255, 255);
  strokeWeight(4);
  noFill();
  square(x, y, SQUARESIZE);
}

// check to see if the mouse lick was within the bounds of a button
boolean inShape(int x, int y, int rectlength, int rectheight) {
  if (mouseY >= y && mouseY <= y+rectheight && mouseX >= x && mouseX <= x+rectlength
    ) {
    return true;
  } else {
    return false;
  }
}

// crushes links made when new candies are generated to refill board; checks if game is over
void draw() {
  if (page.equals("game")) {
    if (b.isMove()) {
      score += b.crush() * 50;
      displayLog();
      game();
    }
    gameOver();
  }
}

// display game progress
void displayLog() {
  background(204);
  textSize(20);
  text("GOAL: " + points, 0, 825);
  text("MOVES: " + moves, 200, 825);
  text("SCORE: " + score, 350, 825);
  text("SWAPS: " + m, 500, 825);
  text("LEVEL: " + LEVEL, 700, 825);
}

// display candies
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

// screen displayed to indicate whether player passed or failed level
void gameOver() {
  if (m>moves && score < points) {
    page = "levelL";
    background(levelbackground);
    image(banner, -5, 300);//lose
    fill(240, 74, 110);
    textSize(36);
    text("LEVEL FAILED!", 292, 367);
    fill(255, 92, 168);
    rect(292, 405, playX, playY);
    fill(255);
    text("RETRY", 345, 436);
    noFill();
    textSize(16);
    fill(8, 123, 250, 255);
    text("If you wish to return to the Homepage click the button 'h'", 223, 485);
    noFill();
  }
  if (m <= moves && score>=points) {
    if (LEVEL < 5) {
      page = "levelW";
      background(levelbackground);
      image(banner, -5, 300);//win
      fill(240, 74, 110);
      textSize(36);
      text("LEVEL PASSED!", 292, 367);
      fill(255, 92, 168);
      rect(292, 405, playX, playY);
      fill(255);
      text("NEXT", 355, 436);
      noFill();
      textSize(16);
      fill(8, 123, 250, 255);
      text("If you wish to return to the Homepage click the button 'h'", 223, 485);
      noFill();
    } else {
      page = "final";
      background(finalbackground);
      image(banner, -5, 300);//win
      fill(147, 75, 112);
      textSize(36);
      text("CONGRATS", 315, 367);
      text("YOU'VE COMPLETED ALL THE LEVELS!", 115, 425);
      textSize(16);
      fill(8, 123, 250, 255);
      text("If you wish to return to the Homepage click the button 'h'", 223, 485);
      noFill();
    }
  }
}

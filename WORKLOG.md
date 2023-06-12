# Work Log

## JIAYU

### May 22nd, 2023

Outline of Candy Class
String getColor()
String getType()
String randomCandy()


### May 23rd, 2023
Find candy images and make reference to in candy[]
Swap method to swap selected piece (Board class)
mouseClicked(): updated method to reflect selection
        One click = selects pieces and highlights the valid swaps
        Second click = piece you want to swap with → swaps the first click + second

### May 24th, 2023
Added new Candy Constructor to Candy class
Added getX() & getY() to Candy Class
updated Swap method to include X & Y

### May 25th, 2023
Started validMove()
  Creating horizontalLink() + verticalLink() method

### May 27th, 2023
finished updating validMove() (only applicable to 3 candy links)
included helper methods canMove + horizontalLink + verticalLink
canMove - check if possible not our of bound
horizontalLink checks if 3 candies are in a row
VerticalLink checks if 3 are in a row vertically

### May 29th, 2023
merged canMove() and getCandy into one method
changed horizontal/vertical method to only check for the three combinations of links

### May 30th, 2023
added a movedown method + gravity method -> shifts candy down
adjusted draw + mouseClicked in CandyCrush

### June 1st, 2023
changed background

### June 6th, 2023
updated CandyCrush so pictures are not generated in draw() everytime
made homepage
made rules page
updated keys to shift between pages

###June 8th, 2023
uploaded striped pictures
added code for liquorice in later levels
started gameOver  

###June 10th, 2023
added rule page
added buttons to access the pages

###June 11th, 2023
added gameOver method
added banners after completion of each banner
added final winning menu
background music implemented


## NIKI

### May 22nd, 2023
setup game by drawing 9 by 9 grid

### May 23rd, 2023
Initialized Board array in constructor with randomCandy()
draw() to load and display candies on grid

### May 24th, 2023
swap() to switch two selected candies on board array
included fields x and y to Candy to better track candies
validMove() just to check if selected candies are next to each other (left, right, up, down)
clear() to reflect new changes every tick (no overlapping candies)

### May 25th, 2023
started crush() to remove completed links on board

### May 30th, 2023
wrote crush() to remove links when board is first generated and when user makes a swap
compareH() and compareV() helper methods to compare the candies around a coordinate

### May 31st, 2023
fixed pushdown(), setY cor from y+1 to y

### June 1st, 2023
reshuffle for user if there are no more valid moves

### June 8th, 2023
fixed flickering highlight by moving methods out of draw
started 4-candy link methods
created separate categories for game log

###June 10th, 2023
fixed 4 candy link to spawn striped candy when link forms

###June 11th, 2023
fixed striped 3 candy link both the vertical and the horizontal version
allowed for striped candies to clear row/columns when candy creates link
fix striped candy

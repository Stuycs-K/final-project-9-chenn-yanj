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

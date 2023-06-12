# APCS Final Project
THIS DOCUMENT IS REQUIRED

## Group Info
Group Name: scholars
Member Name: Niki Chen & Jiayu Yan

## Overview
The goal of this project is to replicate the game Candy Crush in Processing. The objective of the game is to fulfill the “goal” of each level, which might include reaching a specific score or reaching a specific goal in a certain number of moves. We plan to break down our game into 3 classes: Candy, Board, and CandyCrush. The user can “crush” three, or more, candies of the same kind by aligning them horizontally or vertically. When two legal, swappable pieces are selected, the board will adjust to reflect the changes; if no viable swaps and crushes are left, there will be an option to reshuffle the board. When 4 candies are swapped in a row, a striped candy is formed. The striped candy can then be used to eliminate the candies in the corresponding row or column. Our game will consist of 5 levels in total with each level getting progressively harder than the previous level.

## Instructions
Prior to playing the game makesure to install Sound Library by clicking Sketch -> import library -> sound -> and install!

Opening the game, users will be greeted with a home screen where they will see two buttons: play and rules. Clicking on the rules button will bring users to the rules page. There users will be able to see a guide highlighting the general rules of the game. When users click on the play button, they will be brought to level 1 of the main game. The goal of the user is to accomplish the "GOAL" of the game within the specified number of "MOVES." Users can keep track of their progress on the display log located at the bottom of the screen. To play the game, users are allowed to form links of 3 or 4 candies. To swap candies users start of by clicking the piece they want to move. After clicking on the candy, a white box will highlight all the viable positions in which one can move the candy. Users will then select the position they wish to move the candy to. If a link of 3 candies of the same color are formed those candies will automatically crush. If 4 candies of the same color form a vertical link, a vertical striped candy of the same color will form. Similarly, if 4 candies of the same color form a horizontal link, a horizontal striped candy of the same color will form. These striped candies can be swaped with other striped candies or regular candies of the same color. If the goal of the level is met, a message will appear allowing the users to move onto the next level. If the goal is not met, users will have the option to retry the level. If a scenario arises in which there are no possible moves left, users will have the option to reshuffle the board by clicking on the space bar. At the end of the 5 levels, users will be brought to a congratulatory page where they will have the option to return to the home screen.

Key Index:
spacebar: reshuffles board
right arrow:increments levels (for grading purposes)
h: home screen
g: game screen
r: rule screen

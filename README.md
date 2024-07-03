# BJIB: BlackJack In Bash

## Overview
BJIB is a simple implementation of the card game Blackjack, written in Bash. It allows players to play against the computer and track their scores. The script uses functions to handle various aspects of the game, such as dealing cards, calculating scores, and determining the winner. It also includes a main loop that allows players to play multiple rounds until they decide to stop.

## Author
Isaaclins <3

## Version
1.0

## Features
- Play against the computer
- Track player and dealer scores
- Play multiple rounds
- Help option that explains the game rules
- Win option that helps players input game cards and end with the best possible win rate

## Game Rules
1. Cards from 2-10 have their face value. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11, depending on the player's choice.
2. The cards are added together, resulting in the HAND.
3. If you have a HAND higher than the dealer's, you win the game.
4. If you go over 21, you BUST and lose the game.
5. If the dealer goes over 21, you WIN the game.

## Instructions
To start the game, run the script with one of the following options:

- `./blackjack.sh --help` or `blackjack.sh -h`: Displays the help with the game rules and instructions.
- `./blackjack.sh --rules` or `blackjack.sh -r`: Explains the rules of the game.
- `./blackjack.sh --win` or `blackjack.sh -w`: Helps you play the game with the best win rate.
- `./blackjack.sh --play` or `blackjack.sh -p`: Starts a game of Blackjack.

## Installation
Clone the repository or download the files to your local storage. Make sure you have Bash installed on your system. Run the script from your terminal or command line.

### Functions

#### `playgame()`
This function starts the game of Blackjack. It initializes the player and dealer scores, deals cards, and allows the player to hit or stand. It also determines the winner and keeps track of the scores. The function includes a loop that allows players to play multiple rounds until they choose to quit.

#### `calculate_hand(card1, card2)`
This function calculates the total value of a hand in Blackjack. It takes two card values as input and returns the sum of the hand. It handles special cases for Ace cards, which can be worth 1 or 11 depending on the player's choice.

#### `bestchoice()`
This function helps players make the best choice in a game of Blackjack. It prompts the player to enter their cards and the dealer's card, and then calculates the chance of busting if the player hits. Based on the hand value and chance of busting, the function suggests whether the player should hit or stand.

Note: The script also includes a case statement that handles command line options for help, rules, win, and play.

## Fun Errors Along The Journey
I've had my fair share of dumb errors.
here are some screenshots I've made along the way:
<br>
![alt text](/img/image.png)
<br>
Expected output:
`Your hand: (number between 3 & 21)`
<br>
Given output:
`Your hand: 174`
<br>

## Contribution
Feedback and contributions are welcome. Please create an issue or a pull request if you would like to contribute to the improvement of the project.

## License
This project is license-free. You are free to use and modify it for personal or educational purposes.

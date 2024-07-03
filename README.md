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

## Fun Errors Along The Journey
I've had my fair share of dumb errors.
here are some screenshots I've made along the way:
![alt text](/img/image.png)
Expected output:
`Your hand: (number between 3 & 21)`
Given output:
`Your hand: **174**`
## Contribution
Feedback and contributions are welcome. Please create an issue or a pull request if you would like to contribute to the improvement of the project.

## License
This project is license-free. You are free to use and modify it for personal or educational purposes.

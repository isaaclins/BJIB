#!/bin/bash

# Function to display error message and exit
display_error() {
    echo "Wrong usage of file. For help run blackjack.sh --help OR blackjack.sh -h"
    exit 1
}

# Check if no parameters were given
if [ $# -eq 0 ]; then
    display_error
fi

# Check if help flag is provided
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: blackjack.sh [OPTIONS]"
    echo "Options:"
    echo "  --help, -h     Display this help message"
    echo "  --win,  -w     Helps you play the game with the best winrate possible"
    echo "  --play, -p     Play a game of blackjack"
    echo "------------------------------------------"
    echo "Explanation:"
    echo 
    echo "SOFT HAND: A hand containing an ace valued as 11 is called a SOFT hand."
    echo "HARD HAND: A hand without an ace or with an ace valued as 1 is called a HARD hand."

    echo "Cards from 2-10 are worth their face value. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11."
    echo "you add the Cards together and that is equal to your HAND."
    echo "The goal of the game is to have a HAND higher than the Dealers without exceeding 21 from both parties. "
    echo "If you exceed 21, you BUST and lose the game. If the Dealer exceeds 21, you WIN the game."
    echo "If you and the Dealer have the same HAND, it is a PUSH and no one wins."
    echo "If you have a HAND of 21, you have a BLACKJACK and win the game."
    echo "If you have a HAND of 21 and the Dealer has a HAND of 21, it is a PUSH."
    echo "If you have a HAND of higher the one of the Dealer, you win the game."
    echo ""
    exit 0
fi

if [ "$1" = "--win" ] || [ "$1" = "-w" ]; then
        echo "Please enter your FIRST CARD:"
        echo "1-10 or J, Q, K, A"
        while [ "$input" != "e" ] || [ "$input" != "E" ]; do
        
        read input
        if [[ "$input" =~ ^[1-9]$|^10$|^J$|^Q$|^K$|^A$ ]]; then
            echo "Your input: $input"
        else
            echo "Invalid input. Please enter a number from 1-10 or J, Q, K, A."
        fi
        
        done
fi

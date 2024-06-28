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
    echo "----------------------------------------------------------------------------"
    echo "Options:"
    echo "  --help,     -h      Display this help message"
    echo "  --win,      -w      Helps you play the game with the best winrate possible"
    echo "  --play,     -p      Play a game of blackjack"
    echo "  --rules,    -r      Explains the rules of the game"
    echo "----------------------------------------------------------------------------"
    exit 0
fi

if [ "$1" = "--rules" ] || [ "$1" = "-r" ]; then
    echo "Rules:"
    echo "----------------------------------------------------------------------------"
    echo "1. Cards from 2-10 are worth their face value. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11."
    echo "2. You add the Cards together and that is equal to your HAND."
    echo "3. If you have a HAND of higher the one of the Dealer, you win the game."
    echo "4. If you exceed 21, you BUST and lose the game."
    echo "5. If the Dealer exceeds 21, you WIN the game."
    echo "----------------------------------------------------------------------------"
fi
if [ "$1" = "--win" ] || [ "$1" = "-w" ]; then
        echo "Please enter your FIRST CARD:"
        echo "1-10 or J, Q, K, A"
        while [ "$input" != "exit" ] || [ "$input" != "e" ]; do
        
            read input
            if [[ "$input" =~ ^[1-9]$|^10$|^J$|^Q$|^K$|^A$|^j$|^q$|^k$|^a$ ]]; then
                echo "Your input: $input"
                hand+=("$input")
            else
                echo "Invalid input."
                echo "Please enter a number from 1-10 or J, Q, K, A."
                continue
            fi
            hand=("$input")
            echo "Please enter your SECOND CARD:"
                read input
                if [[ "$input" =~ ^[1-9]$|^10$|^J$|^Q$|^K$|^A$|^j$|^q$|^k$|^a$ ]]; then
                    echo "Your input: $input"
                    hand+=("$input")  
                else
                    echo "Invalid input. Please enter a number from 1-10 or J, Q, K, A."
                fi
            echo "Your hand: ${hand[@]}"
        done
fi

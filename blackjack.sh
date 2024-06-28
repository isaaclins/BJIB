#!/bin/bash


# This script is a simple implementation of the game Blackjack.
# It allows players to play against the computer and keeps track of their scores.
# The script uses functions to handle different aspects of the game, such as dealing cards, calculating scores, and determining the winner.
# It also includes a main game loop that allows players to play multiple rounds until they choose to quit.
# The script also includes a help option that explains the rules of the game and how to play.
# The script also includes a win option that helps players play the game with the best winrate possible.
#
# Author: Isaaclins <3
# Version: 0.1


if [ $# -eq 0 ]; then
    echo "Wrong usage of script."
    echo "For help run './blackjack.sh --help' OR 'blackjack.sh -h'"
    exit 1
fi

################################################################
#                                                              #
#                   help flag of the script                    #
#                                                              #
################################################################
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






################################################################
#                                                              #
#               explains the rules of the game                 #
#                                                              #
################################################################

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

################################################################
#                                                              #
#        gives the best possible output determined by          #
#      the given hand of the player and partly the dealer      #
#                                                              #
################################################################

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
            echo "Your hand has following cards: ${hand[@]}"
            # if hand contains the letters k,q or j, then change it for the fixed value 10. if it has an "a", it should give out two hands. one where the "a" is 11 and one where the "a" is 1.
            for (( i=0; i<${#hand[@]}; i++ )); do
                if [[ ${hand[i]} =~ ^[KQJkqj]$ ]]; then
                    hand[i]=10
                    echo "The value of your hand is: $(( ${hand[0]} + ${hand[1]} ))"
                fi
                if [[ ${hand[i]} =~ ^[Aa]$ ]]; then
                    hand_with_11=("${hand[@]}")
                    hand_with_1=("${hand[@]}")
                    hand_with_11[i]=11
                    hand_with_1[i]=1
                    echo "The value of your hand is: $(( ${hand_with_11[0]} + ${hand_with_11[1]} )) or $(( ${hand_with_1[0]} + ${hand_with_1[1]} ))"
                fi
            done
        
        
        done
fi

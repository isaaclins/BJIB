#!/bin/bash

# This script is a simple implementation of the game Blackjack.
# It allows players to play against the computer and keeps track of their scores.
# The script uses functions to handle different aspects of the game, such as dealing cards, calculating scores, and determining the winner.
# It also includes a main game loop that allows players to play multiple rounds until they choose to quit.
# The script also includes a help option that explains the rules of the game and how to play.
# The script also includes a win option that helps players input the game cards and end with the best winrate possible.

# Author: Isaaclins <3
# Version: 0.1

# PLAY GAME
# ask for first card, save in hand.
# ask for second card, save in hand.
# change k, q, j to 10
# change a to 11 if the sum of the hand is less than 21
# change a to 1 if the sum of the hand is more than 21
# return the sum of the hand

bestchoice() {
    read -p "Enter the first card: " card1
    # Check for valid input
    if [[ ! $card1 =~ ^(2|3|4|5|6|7|8|9|10|k|q|j|a)$ ]]; then
        echo "Invalid input for card1. Please enter a valid card."
        return
    fi
    read -p "Enter the second card: " card2
    if [[ ! $card2 =~ ^(2|3|4|5|6|7|8|9|10|k|q|j|a)$ ]]; then
        echo "Invalid input for card2. Please enter a valid card."
        return
    fi
    if [[ $card1 == "a" && $card2 == "a" ]]; then
        card1=11
        card2=1
    fi
    # Convert k, q, j to 10
    case $card1 in
        k|q|j)
            card1=10
            ;;
        a)
            card1=11
            ;;
    esac

    case $card2 in
        k|q|j)
            card2=10
            ;;
        a)
            card2=11
            ;;
    esac
    hand=$((card1 + card2))
    echo "Sum of the hand: $hand"
    read -p "Enter the Dealer's card: " dealer_card
    if [[ ! $dealer_card =~ ^(2|3|4|5|6|7|8|9|10|k|q|j|a)$ ]]; then
        echo "Invalid input for dealer_card. Please enter a valid card."
        return
    fi

}



case "$1" in
    --help | -h)
        echo "Usage: blackjack.sh [OPTIONS]"
        echo "----------------------------------------------------------------------------"
        echo "Options:"
        echo "  --help,     -h      Display this help message"
        echo "  --win,      -w      Helps you play the game with the best winrate possible"
        echo "  --play,     -p      Play a game of blackjack"
        echo "  --rules,    -r      Explains the rules of the game"
        echo "----------------------------------------------------------------------------"
        exit 0
        ;;
    --rules | -r)
        echo "Rules:"
        echo "----------------------------------------------------------------------------"
        echo "1. Cards from 2-10 are worth their face value. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11, depending on the player's choice."
        echo "2. You add the Cards together and that is equal to your HAND."
        echo "3. If you have a HAND of higher the one of the Dealer, you win the game."
        echo "4. If you exceed 21, you BUST and lose the game."
        echo "5. If the Dealer exceeds 21, you WIN the game."
        echo "----------------------------------------------------------------------------"
        exit 0
        ;;
    --win | -w)
        bestchoice
        ;;
    --play | -p)
        # Hier kommt der Code für das Spiel hin
        echo "This is the game"
        ;;
    *)
        echo "Wrong usage of script."
        echo "For help run './blackjack.sh --help' OR 'blackjack.sh -h'"
        exit 1
        ;;
esac




compare_cards() {
    local player_score=$1
    local dealer_score=$2

    if [[ $dealer_score -gt 21 ]]; then
        echo "You win! The dealer went bust!"
    elif [[ $player_score -gt 21 ]]; then
        echo "You went bust :("
    else
        if [[ $player_score -eq $dealer_score ]]; then
            echo "It was a draw!"
        elif [[ $dealer_score -gt $player_score ]]; then
            echo "You lost, Dealer has blackjack!"
        elif [[ $player_score -eq 0 ]]; then
            echo "You were dealt Blackjack! Congrats you win!"
        elif [[ $player_score -gt $dealer_score ]]; then
            echo "You win! Good lad yourself!"
        else
            echo "Dealer has won...no good. You lose!"
        fi
    fi
}
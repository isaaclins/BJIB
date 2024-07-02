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
            echo "You lost, Dealer has more than you!"
        elif [[ $dealer_score -lt $player_score ]]; then
            echo "You win! Good lad yourself!"
        else
            echo "Dealer has won...no good. You lose!"
        fi
    fi
}
playgame(){
    cards=(2 3 4 5 6 7 8 9 10 2 3 4 5 6 7 8 9 10 2 3 4 5 6 7 8 9 10 2 3 4 5 6 7 8 9 10 "k" "q" "j" "a" "k" "q" "j" "a" "k" "q" "j" "a" "k" "q" "j" "a")
    player_score=0
    dealer_score=0
    player_hand=0
    dealer_hand=0
    # Deal cards to player and dealer
    clear
    
    dealer_card1_index=$((RANDOM % ${#cards[@]}))
    while [[ -z ${cards[$dealer_card1_index]} ]]; do
        dealer_card1_index=$((RANDOM % ${#cards[@]}))
    done
    dealer_card1=${cards[$dealer_card1_index]}
    unset "cards[$dealer_card1_index]"
    dealer_card2_index=$((RANDOM % ${#cards[@]}))
    while [[ -z ${cards[$dealer_card2_index]} ]]; do
        dealer_card2_index=$((RANDOM % ${#cards[@]}))
    done
    dealer_card2=${cards[$dealer_card2_index]}
    unset "cards[$dealer_card2_index]"
    dealer_hand=$(calculate_hand "$dealer_card1" "$dealer_card2")


    if [[ $dealer_hand -lt 16 ]]; then
        dealer_card3_index=$((RANDOM % ${#cards[@]}))
        while [[ -z ${cards[$dealer_card3_index]} ]]; do
            dealer_card3_index=$((RANDOM % ${#cards[@]}))
        done
        dealer_card3=${cards[$dealer_card3_index]}
        unset "cards[$dealer_card3_index]"
        dealer_hand=$(calculate_hand "$dealer_hand" "$dealer_card3")
        if [[ $dealer_hand -gt 21 ]]; then
            echo "Dealer went bust! You win!"
            break
        fi
        echo "Dealer took another card: $dealer_card3"
        echo "Dealer's hand: $dealer_card1 + $dealer_card3 + ??? "

    else
    echo "-----------------------------------------------------"
    echo "Dealer's hand: $dealer_card1 + ???"
    echo "-----------------------------------------------------"
    fi

    player_card1_index=$((RANDOM % ${#cards[@]}))
    while [[ -z ${cards[$player_card1_index]} ]]; do
        player_card1_index=$((RANDOM % ${#cards[@]}))
    done
    player_card1=${cards[$player_card1_index]}
    unset "cards[$player_card1_index]"
    player_card2_index=$((RANDOM % ${#cards[@]}))
    while [[ -z ${cards[$player_card2_index]} ]]; do
        player_card2_index=$((RANDOM % ${#cards[@]}))
    done
    player_card2=${cards[$player_card2_index]}
    unset "cards[$player_card2_index]"
    player_hand=$(calculate_hand "$player_card1" "$player_card2")



    echo "-----------------------------------------------------"
    echo "Your hand: $player_card1 + $player_card2 = $player_hand"
    echo "-----------------------------------------------------"


echo "Do you want to hit or stand?"
read -p "Enter your choice (hit/stand): " choice
while [[ $choice == "h" || $choice == "H" || $choice == "HIT" || $choice == "hit" ]]; do
    player_card_index=$((RANDOM % ${#cards[@]}))
    while [[ -z ${cards[$player_card_index]} ]]; do
        player_card_index=$((RANDOM % ${#cards[@]}))
    done
    player_card=${cards[$player_card_index]}
    unset "cards[$player_card_index]"

    if [[ $player_card == "a" ]]; then
        if [[ $((player_hand + 11)) -gt 21 ]]; then
            player_card=1
        else
            player_card=11
        fi
    fi
    if [[ $player_card == "k" || $player_card == "q" || $player_card == "j" ]]; then
        player_card=10
    fi

    player_hand=$((player_hand + player_card))
    echo "You drew a $player_card"
    echo "Your hand: $player_hand"
    echo "Dealer's hand: $dealer_card1 + ???"
    if [[ $player_hand -gt 21 ]]; then
        echo "You went bust! Dealer wins!"
        break
    fi
    read -p "Do you want to hit or stand? " choice
    clear
    if [[ $choice == "stand" || $choice == "STAND" || $choice == "s" || $choice == "S" ]]; then
        
        break
    fi
done
if [[ $dealer_card3 ]]; then
    echo "Dealer's hand: $dealer_card1 + $dealer_card2 + $dealer_card3 = $dealer_hand"
else
    echo "Dealer's hand: $dealer_card1 + $dealer_card2 = $dealer_hand"
fi
echo "Your hand: $player_hand"
compare_cards "$player_hand" "$dealer_hand"
}
calculate_hand() {
    local card1=$1
    local card2=$2
    local sum=0

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
    sum=$((card1 + card2))
    echo "$sum"
}
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
    if [[ $hand -ge 2 && $hand -le 11 ]]; then
        echo "Chance to bust if you hit: 0%"
    elif [[ $hand -ge 12 && $hand -le 16 ]]; then
        echo "Chance to bust if you hit: 31%"
    elif [[ $hand -ge 17 && $hand -le 19 ]]; then
        echo "Chance to bust if you hit: 69%"
    elif [[ $hand -eq 20 ]]; then
        echo "Chance to bust if you hit: 92%"
    elif [[ $hand -eq 21 ]]; then
        echo "Chance to bust if you hit: 100%"
    else
        echo "Invalid hand value."
    fi



    read -p "Enter the Dealer's card: " dealer_card
    if [[ ! $dealer_card =~ ^(2|3|4|5|6|7|8|9|10|k|q|j|a)$ ]]; then
        echo "Invalid input for dealer_card. Please enter a valid card."
        return
    fi
    if [[ $dealer_card == "a" ]]; then
        dealer_card=11
    elif [[ $dealer_card == "k" || $dealer_card == "q" || $dealer_card == "j" ]]; then
        dealer_card=10
    else 
        dealer_card=$dealer_card
    fi
    if [[ $dealer_card -gt $hand ]]; then
        echo "Best choice: Hit"
    else
        echo "Best choice: Stand"
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
        clear
        playgame
        ;;
    *)
        echo "Wrong usage of script."
        echo "For help run './blackjack.sh --help' OR 'blackjack.sh -h'"
        exit 1
        ;;
esac

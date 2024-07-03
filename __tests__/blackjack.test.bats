#!/usr/bin/env bats

@test "Script runs with error because no parameters were given" {
  run ./../blackjack.sh
  [ "$status" -eq 1 ]
  [ "$output" = "Wrong usage of script.
For help run './blackjack.sh --help' OR 'blackjack.sh -h'" ]
}

@test "Script runs with error because wrong parameter was given" {
  run ./../blackjack.sh wrong
  [ "$status" -eq 1 ]
  [ "$output" = "Wrong usage of script.
For help run './blackjack.sh --help' OR 'blackjack.sh -h'" ]
}

@test "Script runs as expected with short help flag" {
  run ./../blackjack.sh -h
  [ "$status" -eq 0 ]
  [ "$output" = "Usage: blackjack.sh [OPTIONS]
----------------------------------------------------------------------------
Options:
  --help,     -h      Display this help message
  --win,      -w      Helps you play the game with the best winrate possible
  --play,     -p      Play a game of blackjack
  --rules,    -r      Explains the rules of the game
----------------------------------------------------------------------------" ]
}


@test "Script runs as expected with long help flag" {
  run ./../blackjack.sh --help
  [ "$status" -eq 0 ]
  [ "$output" = "Usage: blackjack.sh [OPTIONS]
----------------------------------------------------------------------------
Options:
  --help,     -h      Display this help message
  --win,      -w      Helps you play the game with the best winrate possible
  --play,     -p      Play a game of blackjack
  --rules,    -r      Explains the rules of the game
----------------------------------------------------------------------------" ]
}

@test "Script runs with short rule parameter as expected" {
  run ./../blackjack.sh -r
  [ "$status" -eq 0 ]
  [ "$output" = "Rules:
----------------------------------------------------------------------------
1. Cards from 2-10 are worth their face value. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11, depending on the player's choice.
2. You add the Cards together and that is equal to your HAND.
3. If you have a HAND of higher the one of the Dealer, you win the game.
4. If you exceed 21, you BUST and lose the game.
5. If the Dealer exceeds 21, you WIN the game.
----------------------------------------------------------------------------" ]
}
@test "Script runs with long rule parameter as expected " {
  run ./../blackjack.sh --rules
  [ "$status" -eq 0 ]
  [ "$output" = "Rules:
----------------------------------------------------------------------------
1. Cards from 2-10 are worth their face value. Face cards (Jack, Queen, King) are worth 10. Aces are worth 1 or 11, depending on the player's choice.
2. You add the Cards together and that is equal to your HAND.
3. If you have a HAND of higher the one of the Dealer, you win the game.
4. If you exceed 21, you BUST and lose the game.
5. If the Dealer exceeds 21, you WIN the game.
----------------------------------------------------------------------------" ]
}

@test "Script runs with win flag and card values and expects hit as best choice" {
  run ./../blackjack.sh -w 3 9 2
  [ "$status" -eq 0 ]
  [ "$output" = "Your first Card: 3
Your second Card: 9
Dealer's Card: 2
Sum of the hand: 12
Chance to bust if you hit: 30.77%
Best choice: Hit" ]
}

@test "Script runs with win flag and card values and expects stand as best choice" {
  run ./../blackjack.sh -w 9 9 2
  [ "$status" -eq 0 ]
  [ "$output" = "Your first Card: 9
Your second Card: 9
Dealer's Card: 2
Sum of the hand: 18
Chance to bust if you hit: 76.92%
Best choice: Stand" ]
}

@test "Script runs with win flag and with errors as the wrong amount of cards were given" {
  run ./../blackjack.sh -w 9 9 2 3
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number of arguments. Please provide 3 card values." ]
}

@test "Script runs with win flag and with errors as no cards were given" {
  run ./../blackjack.sh -w
  [ "$status" -eq 1 ]
  [ "$output" = "Invalid number of arguments. Please provide 3 card values." ]
}
# cielo muss wasser ihfrüre 
#!/usr/bin/env bats

@test "Script runs with error because no parameters OR the wrong parameters were given" {
    run ./blackjack.sh
    [ "$output" = "Wrong usage of file. For help run blackjack.sh --help OR blackjack.sh -h" ]
    [ "$status" -eq 1 ]
}

@test "Script produces expected output" {
    run ./blackjack.sh
}

@test "Script displays help message when full help flag is provided" {
    run ./blackjack.sh --help
    [ "$status" -eq 0 ]
    [ "$output" = "Usage: blackjack.sh [OPTIONS]
Options:
  --help, -h     Display this help message" ]
}

@test "Script displays help message when abbreviated help flag is provided" {
    run ./blackjack.sh -h
    [ "$status" -eq 0 ]
    [ "$output" = "Usage: blackjack.sh [OPTIONS]
Options:
  --help, -h     Display this help message" ]
}



Feature: Blackjack script

  Scenario: Script runs with error because no parameters were given
    Given the user runs the blackjack script without parameters
    Then the script should exit with status code 1
    And the output should be "Wrong usage of script. For help run './blackjack.sh --help' OR 'blackjack.sh -h'"

  Scenario: Script runs with error because wrong parameter was given
    Given the user runs the blackjack script with a wrong parameter
    Then the script should exit with status code 1
    And the output should be "Wrong usage of script. For help run './blackjack.sh --help' OR 'blackjack.sh -h'"

  Scenario: Script runs as expected with short help flag
    Given the user runs the blackjack script with the short help flag
    Then the script should exit with status code 0
    And the output should display the help message

  Scenario: Script runs as expected with long help flag
    Given the user runs the blackjack script with the long help flag
    Then the script should exit with status code 0
    And the output should display the help message

  Scenario: Script runs with short rule parameter as expected
    Given the user runs the blackjack script with the short rule parameter
    Then the script should exit with status code 0
    And the output should display the game rules

  Scenario: Script runs with long rule parameter as expected
    Given the user runs the blackjack script with the long rule parameter
    Then the script should exit with status code 0
    And the output should display the game rules

  Scenario: Script runs with win flag and card values and expects hit as best choice
    Given the user runs the blackjack script with the win flag and card values 3, 9, 2
    Then the script should exit with status code 0
    And the output should suggest to hit

  Scenario: Script runs with win flag and card values and expects stand as best choice
    Given the user runs the blackjack script with the win flag and card values 9, 9, 2
    Then the script should exit with status code 0
    And the output should suggest to stand

  Scenario: Script runs with win flag and with errors as the wrong amount of cards were given
    Given the user runs the blackjack script with the win flag and wrong amount of card values
    Then the script should exit with status code 1
    And the output should be "Invalid number of arguments. Please provide 3 card values."

  Scenario: Script runs with win flag and with errors as no cards were given
    Given the user runs the blackjack script with the win flag and no card values
    Then the script should exit with status code 1
    And the output should be "Invalid number of arguments. Please provide 3 card values."


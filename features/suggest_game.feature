Feature: Adding games
  Background:
    Given I'm signed in as "joe@example.com"
    Given the following game:
      | name              | Shadows over Camelot |
      | playing_time      | 60 |
      | min_players       | 3  |
      | max_players       | 7  |
      | bgg_id            | 15062 |
    Given the following game:
      | name              | Pandemic |
      | playing_time      | 60 |
      | min_players       | 2  |
      | max_players       | 4  |
    Given the following game:
      | name              | Ghost Stories |
      | playing_time      | 60 |
      | min_players       | 1  |
      | max_players       | 4  |
    Given the following game:
      | name              | Resistance |
      | playing_time      | 60 |
      | min_players       | 5  |
      | max_players       | 10  |
    And I click "Suggest Game"


  Scenario: User views the suggest page
    Then I should see "Suggest Games"
    And I should see "By Number of Players"
    And I should see "How many players?"
    And I should see a "Suggest for this number" button
    And I should see "By Player Names"
    And I should see "Players (separated by commas)"
    And I should see "Include me in this game"
    And "Include me in this game" should be checked
    And I should see "Show only games that are new to these people"
    And I should see "Show only games these people know"
    And "Show only games that are new to these people" should be selected
    And I should see a "Suggest for these players" button

  Scenario: User looks for 1 player games
    When I select "1" from "How many players?"
    And I press "Suggest for this number"
    Then I should see "Game suggestions for 1 player"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for 3 player games
    When I select "3" from "How many players?"
    And I press "Suggest for this number"
    Then I should see "Game suggestions for 3 players"
    And I should see "Shadows over Camelot"
    And I should see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for 8 player games
    When I select "8" from "How many players?"
    And I press "Suggest for this number"
    Then I should see "Game suggestions for 8 players"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should see "Resistance"

  Scenario: User looks for 11 player games
    When I select "11" from "How many players?"
    And I press "Suggest for this number"
    Then I should see "Game suggestions for 11 players"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"
    And I should see "No games found"


  Scenario: User looks for a game using 1 player who has played a game
    Given "John Doe" has played "Ghost Stories"
    When I fill in "John Doe" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"
    And I should see "No games found"

  Scenario: User looks for a game using 3 players with one played
    Given "John Doe1" has played "Ghost Stories"
    When I fill in "John Doe1, John Doe2, John Doe3" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2 and John Doe3"
    And I should see "Shadows over Camelot"
    And I should see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for a game using 8 players with one played
    Given "John Doe1" has played "Resistance"
    When I fill in "John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7, John Doe8" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7 and John Doe8"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"
    And I should see "No games found"

    Scenario: User looks for a game using 1 undefined player
    When I fill in "John Doe" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for a game using 3 undefined players
    When I fill in "John Doe1, John Doe2, John Doe3" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2 and John Doe3"
    And I should see "Shadows over Camelot"
    And I should see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for a game using 8 undefined players
    When I fill in "John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7, John Doe8" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7 and John Doe8"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should see "Resistance"


  Scenario: User looks for a game to play with 1 undefined player
    When I fill in "John Doe" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe"
    And I should not see "Shadows over Camelot"
    And I should see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for a game to play with 3 undefined players
    When I fill in "John Doe1, John Doe2, John Doe3" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2 and John Doe3"
    And I should see "Shadows over Camelot"
    And I should see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"

  Scenario: User looks for a game to play with 8 undefined players
    When I fill in "John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7, John Doe8" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7 and John Doe8"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should see "Resistance"

  Scenario: User looks for a game to play with 10 undefined players
    When I fill in "John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7, John Doe8, John Doe9, John Doe10" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe1, John Doe2, John Doe3, John Doe4, John Doe 5, John Doe6, John Doe7, John Doe8, John Doe9 and John Doe10"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"
    And I should see "No games found"

  Scenario: User looks for a game 1 player has played with no plays
    When I fill in "John Doe" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I choose "Show only games these people know"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"
    And I should see "No games found"

  Scenario: User looks for a game 1 player has played with 1 plays
    Given "John Doe" has played "Ghost Stories"
    When I fill in "John Doe" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I choose "Show only games these people know"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe"
    And I should not see "Shadows over Camelot"
    And I should not see "Pandemic"
    And I should see "Ghost Stories"
    And I should not see "Resistance"
    And I should not see "No games found"

  Scenario: User looks for a game 3 players have played
    Given "John Doe1" has played "Ghost Stories"
    Given "John Doe1" has played "Pandemic"
    Given "John Doe2" has played "Pandemic"
    Given "John Doe3" has played "Pandemic"
    Given "John Doe3" has played "Shadows over Camelot"
    When I fill in "John Doe1, John Doe2, John Doe3" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I choose "Show only games these people know"
    And I press "Suggest for these players"
    Then I should see "Game suggestions for John Doe"
    And I should not see "Shadows over Camelot"
    And I should see "Pandemic"
    And I should not see "Ghost Stories"
    And I should not see "Resistance"
    And I should not see "No games found"
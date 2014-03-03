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

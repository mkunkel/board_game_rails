Feature: Searching collection
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
    Given "Pandemic" is in the collection of "joe@example.com"
    Given "Shadows over Camelot" is in the collection of "joe@example.com"
    Given "Ghost Stories" is in the collection of "joe@example.com"
    Given "Resistance" is in the collection of "joe@example.com"
    And I click "Home"

  Scenario: Searches collection by name
    When I fill in "Ghost Stories" for "Search by name"
    And I press "Search"
    Then I should see "Ghost Stories"
    And I should not see "Pandemic"
    And I should not see "Shadows over Camelot"
    And I should not see "Resistance"

  Scenario: Searches collection by name in all lower case
    When I fill in "ghost stories" for "Search by name"
    And I press "Search"
    Then I should see "Ghost Stories"
    And I should not see "Pandemic"
    And I should not see "Shadows over Camelot"
    And I should not see "Resistance"

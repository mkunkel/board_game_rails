@vcr
Feature: Adding games
  Background:
    Given I'm signed in as "joe@example.com"
    And I click "Add Game"
    When I fill in "Shadows Over Camelot" for "Search by Name"
    And I press "Submit"
    And I click "Didn't find your game?"

  Scenario: User adds game manually
    Then I select "1" from "Playing Time (hours)"
    And I select "0" from "Playing Time (minutes)"
    And I fill in "Shadows Over Camelot Dsa" for "Name"
    And I select "3" from "Min Players"
    And I select "7" from "Max Players"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot Dsa"

  Scenario: User adds game that exists
    Given the following game:
      | name              | Shadows Over Camelot |
      | playing_time      | 60  |
      | min_players       | 3  |
      | max_players       | 7  |
    Then I select "1" from "Playing Time (hours)"
    And I select "0" from "Playing Time (minutes)"
    And I fill in "Shadows Over Camelot" for "Name"
    And I select "3" from "Min Players"
    And I select "7" from "Max Players"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot"
    And "Shadows Over Camelot" should be the same Game
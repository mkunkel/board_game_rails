@vcr
Feature: Adding games
  Background:
    Given I'm signed in as "joe@example.com"
    And I click "Add Game"
    When I fill in "Shadows Over Camelot" for "Search by Name"
    And I press "Submit"
    And I click "Didn't find your game?"

  Scenario: User views manual add game page
    Then I should see "Playing Time (hours)"
    And I should see "Playing Time (minutes)"
    And I should see "Name"
    And I should see "Min. Players"
    And I should see "Max. Players"
    And I should see "Description"
    And I should see a "Submit" button

  Scenario: User adds game manually
    Then I select "1" from "Playing Time (hours)"
    And I select "0" from "Playing Time (minutes)"
    And I fill in "Shadows Over Camelot Dsa" for "Name"
    And I select "3" from "Min. Players"
    And I select "7" from "Max. Players"
    And I fill in "Cooperative game" for "Description"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot Dsa"
    When I click "Shadows Over Camelot Dsa"
    Then I should see "Shadows Over Camelot Dsa"
    And I should see "1 hour playing time"
    And I should see "3-7 players"
    And I should see "Cooperative game"

  Scenario: User adds game that exists
    Given the following game:
      | name              | Shadows Over Camelot |
      | playing_time      | 60  |
      | min_players       | 3  |
      | max_players       | 7  |
    Then I select "1" from "Playing Time (hours)"
    And I select "0" from "Playing Time (minutes)"
    And I fill in "Shadows Over Camelot" for "Name"
    And I select "3" from "Min. Players"
    And I select "7" from "Max. Players"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot"
    And "Shadows Over Camelot" should be the same Game
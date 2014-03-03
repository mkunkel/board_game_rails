Feature: Adding games
  Background:
    Given I'm signed in as "joe@example.com"
    And I click "Suggest Game"

  Scenario:
    Then I should see "Suggest Games"
    And I should see "By Number of Players"
    And I should see "How many players?"
    And I should see "By Player Names"
    And I should see "Players (separated by commas)"
    And I should see "Include me in this game"
    And "Include me in this game" should be checked
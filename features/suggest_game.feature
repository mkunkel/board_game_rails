Feature: Adding games
  Background:
    Given I'm signed in as "joe@example.com"
    And I click "Suggest Game"

  Scenario:
    Then I should see "Suggest Games"
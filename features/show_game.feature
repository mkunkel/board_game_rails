Feature: Showing games
  Background:
    Given I'm signed in as "joe@example.com"
    Given a set of 3 games in collection
    And I go to the homepage

  Scenario: User views games
    When I click "game1"
    Then I should see "game1"
    And I should see "2-5 players"
    And I should see "1 hour playing time"
    When I go to the homepage
    And I click "game2"
    Then I should see "game2"
    When I go to the homepage
    And I click "game3"
    Then I should see "game3"

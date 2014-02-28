Feature: Removing games
  Background:
    Given I'm signed in as "joe@example.com"
    Given a set of 2 games in collection
    And I go to the homepage
    And I click "game1"

  Scenario: User views game in collection
    Then I should see "Remove From My Collection"

  Scenario: User removes game from collection
    When I click "Remove From My Collection"
    Then I should see "My Games"
    Then I should not see "game1"
    And I should see 2 games in the database
Feature: playing games
  Background:
    Given I'm signed in as "joe@example.com"
    Given a set of 2 games in collection
    And I go to the homepage

  Scenario: User views game in collection
    When I click "game1"
    Then I should see "Play This Game"

  @vcr
  Scenario: User views game not in collection
    When I search for "Shadows over Camelot"
    And I click "Shadows over Camelot"
    Then I should not see "Play This Game"

  Scenario: User goes to play game page
    When I click "game1"
    And I click "Play This Game"
    Then I should see "New Game Play"
    And I should see "Players (separated by commas)"
    And I should see "Include me in this game"

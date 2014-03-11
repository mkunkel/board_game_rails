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

  Scenario: User submits a game they are not a part of
    When I click "game1"
    And I click "Play This Game"
    And I fill in "John Doe, Jane Doe, Shigeru Miyamoto" for "Players (separated by commas)"
    And I uncheck "Include me in this game"
    And I press "Submit"
    Then I should see 1 play in the database
    And I should see 3 players_plays in the database
    When I click "Sign Out"
    Then I should see "Recently Played Games"
    And I should see "game1"

  Scenario: User submits a game they are a part of
    When I click "game1"
    And I click "Play This Game"
    And I fill in "John Doe, Jane Doe, Shigeru Miyamoto" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Submit"
    Then I should see 1 play in the database
    And I should see 4 players_plays in the database
    When I click "Sign Out"
    Then I should see "Recently Played Games"
    And I should see "game1"

  Scenario: User submits a game they are a part of and views my plays
    When I click "game1"
    And I click "Play This Game"
    And I fill in "John Doe, Jane Doe, Shigeru Miyamoto" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Submit"
    And I go to the homepage
    And I click "game2"
    And I click "Play This Game"
    And I fill in "John Doe, Shigeru Miyamoto" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Submit"
    When I click "My Plays"
    Then I should see "My Game Plays"
    And I should see "game2"
    And I should see "3"

  Scenario: User views my plays with no plays
    When I click "My Plays"
    Then I should see "No plays found"

  @javascript
  Scenario: User submits a game they are a part of with js
    When I click "game1"
    And I click "Play This Game"
    And I fill in "John Doe, Jane Doe, Shigeru Miyamoto" for "Players (separated by commas)"
    And I check "Include me in this game"
    And I press "Submit"
    Then I should see 1 play in the database
    And I should see 4 players_plays in the database
    When I click "Sign Out"
    Then I should see "Recently Played Games"
    And I should see "game1"
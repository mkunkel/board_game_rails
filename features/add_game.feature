Feature: Adding games
  Background:
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe@example.com" for "Email / Username"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I click "Add Game"

  @vcr
  Scenario: User views add game
    Then I should see "Search by Name"
    And I should see a "Submit" button

  @vcr
  Scenario: User looks up game
    And I fill in "Shadows Over Camelot" for "Search by Name"
    And I press "Submit"
    Then I should see "Game Results"
    And I should see "5" results
    And I should see "Shadows over Camelot: Merlin's Company"
    And I should see "Shadows over Camelot: The Card Game – Merlin & Morgan Promo cards"
    And I should see "Search again?"
    And I should see "Didn't find your game?"
    And I should see "Results provided by Board Game Geek"

  @vcr
  Scenario: User looks up game that exists in local database
    Given the following game:
      | name              | Shadows Over Camelot |
      | playing_time      | 60 |
      | min_players       | 3  |
      | max_players       | 7  |
      | bgg_id            | 15062 |
    When I fill in "Shadows Over Camelot" for "Search by Name"
    And I press "Submit"
    Then I should see "Game Results"
    And  I should see "5" results

  @vcr
  Scenario: User looks up game and adds a search result
    And I fill in "Shadows Over Camelot" for "Search by Name"
    And I press "Submit"
    Then I should see "Game Results"
    And I click "Shadows over Camelot"
    And I click "Add To My Collection"
    When I go to the homepage
    Then I should see "Shadows Over Camelot"
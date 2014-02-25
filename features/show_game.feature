Feature: Showing games
  Background:
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    And a set of 3 games in collection
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe@example.com" for "Email / Username"
    And I fill in "password" for "Password"
    And I press "Sign in"


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

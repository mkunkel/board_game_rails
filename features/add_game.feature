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

  Scenario: User views add game
    Then I should see "Playing Time"
    And I should see "Name"
    And I should see "Minimum Players"
    And I should see "Maximum Players"
    And I should see "Submit"

  Scenario: User adds game
    Then I fill in "90" for "Playing Time"
    And I fill in "Shadows Over Camelot" for "Name"
    And I fill in "3" for "Minimum Players"
    And I fill in "7" for "Maximum Players"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot"
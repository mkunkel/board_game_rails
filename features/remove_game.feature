Feature: Removing games
  Background:
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    Given a set of 2 games in collection
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe@example.com" for "Email / Username"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I click "game1"

  # Scenario: User views game in collection
  #   Then I should see "Remove From My Collection"
  # For some reason, the above scenario will pass, but cause the next to fail
  # It appears the background does not run successfully the second time

  Scenario: User removes game from collection
    Then I should see "Remove From My Collection"
    When I click "Remove From My Collection"
    Then I should see "My Games"
    Then I should not see "game1"
    And I should see 2 games in the database
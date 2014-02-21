Feature: Home Page


  Scenario: User views the home page without signing in
    When I go to the homepage
    Then I should see "Sign In"
    And I should see "Sign Up"
    And I should see "Recently Played Games"
    And I should see 6 games

  Scenario: Signed in user views the home page
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe@example.com" for "Email / Username"
    And I fill in "password" for "Password"
    And I press "Sign in"
    And I go to the homepage
    Then I should see "My Games"
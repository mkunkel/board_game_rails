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
    And I should see "Min. Players"
    And I should see "Max. Players"
    And I should see a "Submit" button

  Scenario: User adds game
    Then I select "1" from "Playing Time (hours)"
    And I select "0" from "Playing Time (minutes)"
    And I fill in "Shadows Over Camelot" for "Name"
    And I select "3" from "Min Players"
    And I select "7" from "Max Players"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot"

  Scenario: User adds game that exists
    Given the following game:
      | name              | Shadows Over Camelot |
      | playing_time      | 60  |
      | min_players       | 3  |
      | max_players       | 7  |
    Then I select "1" from "Playing Time (hours)"
    And I select "0" from "Playing Time (minutes)"
    And I fill in "Shadows Over Camelot" for "Name"
    And I select "3" from "Min Players"
    And I select "7" from "Max Players"
    And I press "Submit"
    And I go to the homepage
    Then I should see "Shadows Over Camelot"
    And "Shadows Over Camelot" should be the same Game
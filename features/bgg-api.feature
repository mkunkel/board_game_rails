Feature: BGG-API

  @vcr
  Scenario: Request a game
    When BoardGameGeek is searched for "Shadows Over Camelot"
    Then it should return 5 results
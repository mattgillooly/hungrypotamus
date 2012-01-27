Feature: Setting up a game
  In order to play a game
  As an online user
  I want to choose my hippo and set up the game board

  Background:
    Given I am signed in

  Scenario: Set up a game
    Given my marble collecting area is empty
    When I join a game
    Then I choose an available hippo
    And I place 5 marbles into my marble release area
    And I wait for the game to begin

  Scenario: Begin a game
    When everyone in the game has chosen a hippo
    And they have all loaded their marble release areas
    Then the youngest player launches one marble


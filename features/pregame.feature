Feature: Setting up a game
  In order to play a game
  As an online user
  I want to choose my hippo and set up the game board

  Background:
    Given I am signed in

  Scenario: Join a game
    When I join a game
    Then I can choose an available hippo

  Scenario: Choose a hippo
    Given I join a game
    When I choose an available hippo
    Then my marble collecting area is empty
    And I have 5 marbles in my marble release area
    And I can't choose another hippo

  Scenario: Wait for start of gameplay
    Given I join a game
    When three other players have joined the game
    And everyone in the game has chosen a hippo
    Then it is the youngest players turn to launch a marble


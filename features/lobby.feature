Feature: Lobby
  In order to join a game
  As an online user
  I want to wait in the lobby

  Background:
    Given I am signed in

  Scenario: Enter Lobby
    When I enter the Lobby
    Then I am told that I will be notified when I can join a game
    When I am able to join a game
    Then I am notified that I can join the game

  Scenario: Join a Game
    Given I have been prompted to join a game
    When I opt to join the game
    Then I join the game

  Scenario: Opt-out of joining a game
    Given I have been prompted to join a game
    When I opt not to join the game
    Then I remain in the Lobby
    When I am able to join a game
    Then I am notified that I can join the game


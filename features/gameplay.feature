@wip
Feature: Playing a game
  In order to have a fun time with friends
  As player in an active game
  I want to play by the rules

  Background:
    Given I am in an active game

  Scenario: I launch a marble
    Given it is my turn to launch a marble
    When I launch a marble
    Then a marble is moved from my marble release area to the playing field

  Scenario: I try to launch a marble when it is not my turn
    When I try to launch a marble
    Then none of my marbles are launched

  Scenario: I push my hippo's tail to no effect
    When I push my hippo's tail
    Then my hippo bites

  Scenario: I gobble a marble
    Given a marble is near my hippo's mouth
    When I push my hippo's tail
    Then the marble is moved from the playing area to my marble collecting area
    And all players are notfied that I have eaten a marble
    And the player to the left of the last marble launcher is allowed to launch a marble
    And the game is paused until a marble is launched

  Scenario: I gobble the last marble, to win the game
    Given I have eaten the most marbles
    And the current marble in play is the last one that hasn't been eaten
    And a marble is near my hippo's mouth
    When I push my hippo's tail
    Then all players are notified that I have won the game
    And the game is over

  Scenario: I gobble the last marble, to lose the game
    Given I have eaten two fewer marbles than an opponent
    And the current marble in play is the last one that hasn't been eaten
    And a marble is near my hippo's mouth
    When I push my hippo's tail
    Then all players are notified that my opponent has won the game
    And the game is over

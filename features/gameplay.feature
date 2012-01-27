Feature: Playing a game
  In order to have a fun time with friends
  As an online user
  I want to play a game of hungrypotamus

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

  Scenario: I launch a marble
    Given I am in an active game
    And it is my turn to launch a marble
    When I launch a marble
    Then a marble is moved from my marble release area to the playing field

  Scenario: I try to launch a marble when it is not my turn
    Given I am in an active game
    When I try to launch a marble
    Then none of my marbles are launched

  Scenario: I push my hippo's tail to no effect
    Given I am in an active game
    When I push my hippo's tail
    Then my hippo bites

  Scenario: I gobble a marble
    Given I am in an active game
    And a marble is near my hippo's mouth
    When I push my hippo's tail
    Then the marble is moved from the playing area to my marble collecting area
    And all players are notfied that I have eaten a marble
    And the player to the left of the last marble launcher is allowed to launch a marble
    And the game is paused until a marble is launched

  Scenario: I gobble the last marble, to win the game
    Given I am in an active game
    And I have eaten the most marbles
    And the current marble in play is the last one that hasn't been eaten
    And a marble is near my hippo's mouth
    When I push my hippo's tail
    Then all players are notified that I have won the game
    And the game is over

  Scenario: I gobble the last marble, to lose the game
    Given I am in an active game
    And I have eaten two fewer marbles than an opponent
    And the current marble in play is the last one that hasn't been eaten
    And a marble is near my hippo's mouth
    When I push my hippo's tail
    Then all players are notified that my opponent has won the game
    And the game is over

  Scenario: The game is over
    Given I was in a game that has ended
    When I dismiss the notification of who has won the game
    Then I am asked if I would like to play again
    When I say I would like to play again
    Then I am redirected to the pre-game waiting area

  Scenario: The game is over, and I am tired
    Given I was in a game that has ended
    When I dismiss the notification of who has won the game
    Then I am asked if I would like to play again
    When I say I would not like to play again
    Then I am redirected to buy Hungry Hunry Hippos on Amazon.com using Matt Gillooly's affiliate code

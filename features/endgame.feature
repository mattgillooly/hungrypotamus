Feature: Endgame
  In order to carry on with my life
  As player in a game that has just ended
  I want to see the results of the game

  Background:
    Given I was in a game that has ended

  Scenario: The game is over
    When I dismiss the notification of who has won the game
    Then I am asked if I would like to play again
    When I say I would like to play again
    Then I am redirected to the pre-game waiting area

  Scenario: The game is over, and I am tired
    When I dismiss the notification of who has won the game
    Then I am asked if I would like to play again
    When I say I would not like to play again
    Then I am redirected to buy Hungry Hunry Hippos on Amazon.com using Matt Gillooly's affiliate code

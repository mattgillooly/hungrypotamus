Feature: Joining the service
  In order to play games
  As some deranged person on the internet
  I want to sign up for Hungrypotamus

  Scenario: First visit
    When I visit Hungrypotamus
    And I click the Play Now button
    Then I will see my signup options

  Scenario: Sign up with Facebook
    Given I have a Facebook account
    When I view my signup options
    And I choose to sign up with Facebook
    Then I will sign in with Facebook
    And I will be redirected to the Lobby

  Scenario: Sign up with Twitter
    Given I have a Twitter account
    When I view my signup options
    And I choose to sign up with Twitter
    Then I will sign in with Twitter
    And I will be redirected to the Lobby


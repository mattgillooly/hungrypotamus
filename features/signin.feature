@wip
Feature: Signing in to the service
  In order to play games
  As some deranged person on the internet
  I want to sign in to Hungrypotamus

  Scenario: Welcome back
    When I visit Hungrypotamus
    And I click the Play Now button
    Then I will see my sign in options

  Scenario: Sign in with Facebook
    Given I have a Facebook account
    When I view my sign-in options
    And I choose to sign in with Facebook
    Then I will sign in with Facebook
    And I will be redirected to the Lobby

  Scenario: Sign up with Twitter
    Given I have a Twitter account
    When I view my sign-in options
    And I choose to sign in with Twitter
    Then I will sign in with Twitter
    And I will be redirected to the Lobby


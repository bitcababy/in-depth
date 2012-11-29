@javascript
Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

     Scenario: User signs in successfully
      Given I exist as a user
        And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: User enters wrong login
      Given I exist as a user
      And I am not logged in
      When I sign in with a wrong login
      Then I see an invalid login message
      And I should be signed out
      
    Scenario: User enters wrong password
      Given I exist as a user
      And I am not logged in
      When I sign in with a wrong password
      Then I see an invalid login message
      And I should be signed out


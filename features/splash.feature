Feature: Splash
In order to build a list of early adopters and gauge consumer interest
A vistor 
Should be able to enter their email address

Scenerio: Success
  Given I am on the splash page
  And I fill in "user_email" with "brian.stolte@gmail.com"
  When I press "Subscribe"
  Then I should see "Thanks for signing up!"
  
Scenario: Failure - email has already subscribed
  Given I am on the landing page
  And I fill in "user_email" with "brian.stolte@gmail.com"
  And I press "Subscribe"
  And I fill in "user_email" with "brian.stolte@gmail.com"
  When I press "Subscribe"
  Then I should see "Email has already been taken"


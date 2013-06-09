Feature: Splash
	In order to build a list of early adopters and gauge consumer interest
	A vistor 
	Should be able to enter their email address
	
	@wip
	Scenario: Success
  	Given I am on the splash page
  	And I fill in "subscription_email" with "brian.stolte@gmail.com"
  	When I press "Notify me when the app is available"
  	Then I should see "Thanks for signing up!"
		
	@wip 
	Scenario: Failure - email has already subscribed
  	Given I am on the splash page
  	And I fill in "subscription_email" with "brian.stolte@gmail.com"
  	And I press "Notify me when the app is available"
  	And I fill in "subscription_email" with "brian.stolte@gmail.com"
  	When I press "Notify me when the app is available"
		Then I should see "Email has already been taken"
	

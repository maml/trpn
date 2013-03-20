Feature: Subscribe
	In order to build a list of early adopters and gauge consumer interest
	A vistor 
	Should be able to enter their email address

	Scenario: Success
		Given I am on the landing page
		And I fill in "subscription_email" with "brian.stolte@gmail.com"
		When I press "Notify Me!"
		Then I should see "Thanks for signing up!"
		
	Scenario: Failure - email has already subscribed
		Given I am on the landing page
		And I fill in "subscription_email" with "brian.stolte@gmail.com"
		And I press "Notify Me!"
		And I fill in "subscription_email" with "brian.stolte@gmail.com"
		When I press "Notify Me!"
		Then I should see "Email has already been taken"
  

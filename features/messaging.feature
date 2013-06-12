Feature: Messaging
	In order to let riders and drivers hammer out the details of a ride
	As a user of the app
	I want to be able to send a message in response to a ride

	Scenario: A logged in user can send a message to a ride
		Given I am a logged in user of the app
		And I am on a ride page
		When I press "Message"
		Then I should see "Message"
		When I enter a message
		And I press "Send Message"
		Then I should see "Your message has been sent!"
	
	Scenario: I can view the messages for my ride
		Given I am a logged in user of the app
		And I am on my ride page that has a message
		Then I should see "Show messages"

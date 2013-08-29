Feature: Messaging
	In order to let users figure out the details of a ride
	As a user interested in a ride
	I want to be able to message the ride's user

	Scenario: I'm logged in, viewing a ride, and want to send a message
		Given I am a registered user of the app
		And I log in with "user@example.com" and "p@ssw0rd"
		And I am on a ride page
		When I press "Message"
		And I enter a message
		And I press "Submit"
		Then I should see "Your message has been sent!"

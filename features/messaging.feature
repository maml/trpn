Feature: Messaging
	In order to let users figure out the details of a ride
	As a user interested in a ride
	I want to be able to message the ride's user

	Scenario: I'm logged in, viewing a ride, and want to send a message
		Given I am a logged in user of the app
		And I am on a ride page
		When I press "Message"
		Then I should see "rides#send_message"
		And I enter a body
		And I press "Submit"
		Then I should see "Your message has been sent!"
